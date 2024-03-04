SELECT * FROM country ORDER BY code ASC ;


-- CREAMOS UNA LLAVE PRIMARIA.
ALTER TABLE country
	ADD PRIMARY KEY (code);

SELECT * FROM country WHERE code = 'NLD';

-- ELIMINAR CAMPO ESPECIFICO.
DELETE FROM country WHERE code = 'NLD' AND code2 = 'NA';


/* CONSTRAINT - CHECK  */
ALTER TABLE country ADD CHECK( --> POMER UNA CONDICION PARA LOS CCAMPOS DE LA TABLA-
	surfacearea >= 0
);

SELECT DISTINCT continent FROM country;

ALTER TABLE country ADD CHECK(
	( continent = 'Asia'::text) OR
	( continent = 'South America'::text) OR
	( continent = 'North America'::text) OR
	( continent = 'Oceania'::text) OR
	( continent = 'Antarctica'::text) OR
	( continent = 'Africa'::text) OR
	( continent = 'Europe'::text) OR 
	( continent = 'Central America'::text)
);

SELECT * FROM country WHERE code LIKE 'HND';

/*DROP CONSTRAINT*/
/*Elimina los check creados*/
ALTER TABLE country DROP CONSTRAINT "country_continent_check";

/* Creando Indices */

CREATE UNIQUE index "unique_country_name" ON country(
	name
);

-- Otro ejemplo:
CREATE index "country_continent" ON country(continent );

/* Unique Index */

SELECT * FROM city;
SELECT * FROM city WHERE name ='Jinzhou' AND countrycode = 'CHN' AND district = 'Liaoning';

CREATE UNIQUE INDEX "unique_name_countrycode_distric" ON city (
	name, countrycode, district
);


ALTER TABLE city DROP CONSTRAINT "city_population_check";

/* Valor no unico */
CREATE INDEX "index_district" ON city (
	district
);







