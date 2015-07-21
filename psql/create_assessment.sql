--question one

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


--question two
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
SELECT DISTINCT CASE WHEN name ILIKE '%Puerto Rico%' THEN 'Puerto Rico' ELSE name END AS State, popestimate2014 AS population
FROM pop_estimate pe
WHERE state != '00'
;

--question three
CREATE OR REPLACE VIEW coordinates AS
SELECT FMID, ROUND(fm.longitude, 2) AS market_long, ROUND(fm.latitude, 0) AS market_lat
FROM farmers_markets fm
WHERE City in (SELECT City FROM Useable)
ORDER BY city, state
;

CREATE OR REPLACE VIEW r_lat_long AS
SELECT ROUND(latitude, 0) AS river_lat, ROUND(longitude, 2) AS river_long
FROM mississippi
ORDER BY longitude
;

CREATE OR REPLACE VIEW m_lat_long AS
SELECT ROUND(latitude, 0) AS mnt_lat, ROUND(longitude, 2) AS mnt_long
FROM rockies
WHERE Id BETWEEN 14 AND 31
ORDER BY longitude
;

\copy (SELECT fmid, latitude, longitude FROM farmers_markets) TO 'farmers_markets_new.csv' DELIMITER ',' CSV HEADER

