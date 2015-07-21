--question one

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
Longitude 	decimal,
Latitude 	decimal, 
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

\copy farmers_markets FROM 'farmers_markets.csv' DELIMITER ',' CSV;


--question two
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

\copy pop_estimate FROM 'state_pop_est.csv' DELIMITER ',' CSV;


--question three
CREATE TABLE mississippi
(
latitude decimal,
longitude decimal
)
;

\copy mississippi FROM 'mississippi_river.csv' DELIMITER ',' CSV HEADER


CREATE TABLE rockies
(
Id 	INT,
longitude decimal,
latitude decimal
)
;

\copy rockies FROM 'rocky_mnts.csv' DELIMITER ',' CSV HEADER





