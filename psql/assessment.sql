
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
		p.population,
		((m.total::int*1000000)/p.population::int) AS markets_per_capita 
FROM markets_per_state m 
LEFT JOIN pop_dense p ON p.State = m.State 
ORDER BY markets_per_capita
; --> Texas lowest markets per capita; Vermont highest markets per capita
*/

--question #3
/*


CREATE TEMP TABLE question_3 AS
SELECT fm.FMID, fm.latitude, fm.longitude
FROM	(
		SELECT  FMID,
				(SELECT river_long FROM r_lat_long r WHERE r.river_lat = c.market_lat LIMIT 1) AS river_long, 
				(SELECT mnt_long FROM m_lat_long m WHERE m.mnt_lat = c.market_lat LIMIT 1) AS mnt_long,
				(SELECT MIN(mnt_lat) FROM m_lat_long) AS min_mnt_lat,
				(SELECT MAX(river_lat) FROM r_lat_long) AS max_river_lat
			FROM coordinates c
		) total 
LEFT JOIN farmers_markets fm USING (FMID)
WHERE longitude BETWEEN mnt_long AND river_long
AND latitude BETWEEN min_mnt_lat AND max_river_lat 
ORDER BY longitude
;

\copy (SELECT * FROM m_lat_long) TO 'm_lat_long.csv' DELIMITER ',' CSV HEADER

\copy question_3 TO 'question_3.csv' DELIMITER ',' CSV HEADER

*/
--question #4
--One fact about farmers markets in the US made fairly obvious by this data is there are, by far, more farmers markets east of the Mississippi than anywhere else. 


