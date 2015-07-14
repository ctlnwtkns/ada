
/*
--question #1
SELECT DISTINCT City
FROM farmers_markets
WHERE City IN (SELECT City FROM Useable)
AND Vegetables = 't'
AND Honey = 'f'
AND Jams = 'f' 
AND Maple = 'f'
AND Bakedgoods = 'f'
ORDER BY City
; --> 121


--question #2
SELECT  m.State, 
		m.Total, 
		p.popestimate2014 AS population,
		((m.total::int*1000000)/p.popestimate2014::int) AS markets_per_capita 
FROM markets_per_state m 
LEFT JOIN pop_estimate p ON p.name = m.State 
ORDER BY markets_per_capita
; --> Texas lowest markets per capita; Vermont highest markets per capita
*/

\copy (SELECT Longitude, Latitude FROM farmers_markets WHERE City IN (SELECT City FROM Useable) ORDER BY State, County) TO '/Users/caitlinwatkins/Documents/psql/lat_long.csv' DELIMITER ',' CSV HEADER;

/*
SELECT County, State, Latitude, Longitude
FROM farmers_markets 
WHERE City IN (SELECT City FROM Useable) 
AND (latitude, longtitude) IN (SELECT latitude, longitude FROM farmers_markets WHERE latitude BETWEEN )
ORDER BY State, County
;
*/
