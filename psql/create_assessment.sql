CREATE TEMP TABLE cities AS
SELECT  DISTINCT City,
		split_part(City, '.', 2) AS Abbreviated,
		split_part(City, ' ', 2) AS two_words, 
		split_part(City, '-', 2) AS hyphenated, 
		split_part(City, ', ', 2) AS county_state,
		split_part(City, '/', 2) AS state_county,
		split_part(City, '=', 2) AS equivalent
FROM farmers_markets
ORDER BY City ASC
;

CREATE TEMP TABLE exclude AS
SELECT * 
FROM cities 
WHERE two_words != '' 
OR Abbreviated != '' 
OR hyphenated != '' 
OR county_state != '' 
OR state_county != ''
OR equivalent != ''
ORDER BY City;

CREATE TEMP TABLE Useable AS
SELECT DISTINCT City, County, State
FROM farmers_markets f
WHERE City NOT IN 
	(
	SELECT DISTINCT City 
	FROM exclude 
	EXCEPT 
	SELECT DISTINCT City
	FROM exclude	
	WHERE (county_state != '' AND two_words = '')
	OR (state_county != '' AND two_words = '')
	)
AND City NOT IN ('n/a', 'T/NILES')
ORDER BY City ASC;

CREATE OR REPLACE VIEW markets_per_state AS
SELECT COUNT(FMID) AS Total, State
FROM (
SELECT  FMID, 
		CASE 	WHEN State = 'Calafornia' THEN 'California'
				WHEN State = 'Virigina' THEN 'Virginia'
				WHEN State = 'Miinesota' THEN 'Minnesota'
				ELSE State
		END AS State				
FROM farmers_markets
WHERE City IN 
		(
		SELECT City 
		FROM Useable
		)
	) total
GROUP BY State
ORDER BY Total DESC
;

CREATE OR REPLACE VIEW pop_dense AS
SELECT DISTINCT pd.County AS State, population
FROM pop_density pd
LEFT JOIN markets_per_state m ON m.State = pd.County
WHERE geographic_area NOT LIKE '%unicipio%'
AND pd.County NOT LIKE '%_County'
AND m.State = pd.County
ORDER BY pd.County
;




