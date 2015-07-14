BEGIN;

CREATE TABLE farmers_markets 
(
fmid 		SERIAL PRIMARY KEY,
MarketName 	varchar, 
Website 	varchar,
street 		varchar,
city 		varchar,
County 		varchar,
State 		varchar,
zip 		varchar,
Season1Date 	varchar,
Season1Time 	varchar,
Season2Date 	varchar,
Season2Time 	varchar,
Season3Date 	varchar,
Season3Time 	varchar,
Season4Date 	varchar,
Season4Time 	varchar,
Longitude 	varchar,
Latitude 	varchar, 
Location 	varchar,
Credit 		boolean,
WIC 		boolean,
WICcash 	boolean,
SFMNP 		boolean,
SNAP 		boolean,
Bakedgoods 	boolean,
Cheese 		boolean,
Crafts 		boolean,
Flowers 	boolean,
Eggs 		boolean, 
Seafood 	boolean,
Herbs 		boolean,
Vegetables 	boolean,
Honey 		boolean,
Jams 		boolean,
Maple 		boolean,
Meat 		boolean,
Nursery 	boolean,
Nuts 		boolean,
Plants 		boolean,
Poultry 	boolean,
Prepared 	boolean,
Soap 		boolean,
Trees 		boolean,
Wine 		boolean,
updateTime 	varchar
)
;

\copy farmers_markets FROM 'Documents/psql/farmers_markets.csv' DELIMITER ',' CSV;

CREATE TABLE pop_density (
Id varchar,
Id2 varchar,
Geography varchar,
Target_Geo_Id varchar,
Target_Geo_Id2 varchar,
Geographic_area varchar,
County varchar,
Population varchar,
Housing_units varchar,
Total_area varchar,
Water_area varchar,
Land_area varchar,
Population_Density varchar,
Housing_units01 varchar)
;

\copy pop_density FROM 'Documents/psql/population_density.csv' DELIMITER ',' CSV;


CREATE TABLE pop_estimate
(
SUMLEV varchar,
REGION varchar,
DIVISION varchar,
STATE varchar,
NAME varchar,
POPESTIMATE2014 varchar,
POPEST18PLUS2014 varchar,
PCNT_POPEST18PLUS varchar
)
;

\copy pop_estimate FROM 'Documents/psql/state_pop_2015.csv' DELIMITER ',' CSV;







