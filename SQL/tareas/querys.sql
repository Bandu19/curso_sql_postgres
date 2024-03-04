 create table  users (
 	name varchar(10) unique,
	lastname VARCHAR(10),
	role VARCHAR(20)
 );

DROP table users;

select * from users;

------------------INSERTAR VALORES----------------------------------------------------
INSERT INTO users
	(name, lastname, role)
VALUES 
	('MIGUEL', 'ALEJANDRO', 'FINANZAS');
----
INSERT INTO users 
VALUES ('PEDRO','ALEJO','FINANZAS');


----------------ACTUALIZAR REGISTROS---------------------------------------------
UPDATE users
SET name = 'FELIX', role = 'SISTEMAS'
WHERE name = 'DIEGO';

--------------------- SENTENCIAS DE SELECCION ---------------------------------
SELECT * FROM users;

SELECT * FROM users 
	LIMIT 4 
OFFSET 2;

------------------- CLAUSULAS WHERE -------------------------------------
SELECT * FROM users;

SELECT * FROM users WHERE name = 'HECTOR';

SELECT * FROM users WHERE ROLE LIKE '%A%';

SELECT * FROM users WHERE name ILIKE 'Oscar';

SELECT * FROM users WHERE lastname LIKE '_LE%';

SELECT * FROM users WHERE role LIKE '_INANZAS';

SELECT * FROM users WHERE lastname LIKE '_LEJO';


------------------ELIMINAR REGISTROS-------------------------
SELECT * FROM users;

DELETE FROM users WHERE name LIKE 'HECTOR';

DELETE FROM users WHERE role = 'SISTEMAS';

--> PELIGROSAMENTE NO HACERLO <--
DELETE FROM users;


-------------->	DROP vs TRUNCATE TABLE <-----------------

CREATE TABLE users_v2(
	name VARCHAR(20) UNIQUE
);
--> DROP table = ELIMINA COMPLETAMENTE LA TABLA 
DROP TABLE users_v2;

SELECT * FROM users_v2;

--> TRUNCATE table = ELIMINA TODOS SUS REGISTROS 
TRUNCATE TABLE users_v2;

-------------------OPERADORES de STRING y FUNCIONES ------------------------------------
SELECT * FROM users;

SELECT 
	id, 
	UPPER(name) AS upper_name, 
	LOWER(name) AS lower_name,
	LENGTH(name) AS length_name,	
	(20 * 2)AS constante,		
	CONCAT('*'||id||'-'||name||'*') AS concat_v1,
	CONCAT('*'||name||'*') AS concat_v2,
	CONCAT('*',id,'-',name,'*'),	
	name
FROM users;



------------------> OPERADORES de SUBSTRING y POSITIONS <----------------------------------
SELECT * FROM users;

SELECT 
	name,
	SUBSTRING(name, 0, 7 ), -- RESPUESTA: GUSTAVO
	POSITION('E' IN name),
	POSITION(' ' IN name) AS NumPosition,
	SUBSTRING(name, 0, POSITION(' ' IN name)) AS first_name,
	SUBSTRING( name, POSITION(' ' IN name) + 1) AS last_name,
	SUBSTRING( name, POSITION(' ' IN name)) AS last_name,
	'-' AS prueba
FROM users ORDER BY id ASC;


-- 1. Ver todos los registros
SELECT * FROM users;

-- 2. Ver el registro cuyo id sea igual a 10
SELECT * FROM users WHERE id = '1';

-- 3. Quiero todos los registros que cuyo primer nombre sea Jim (engañosa)
SELECT * FROM users WHERE name LIKE 'Jim %';


-- 4. Todos los registros cuyo segundo nombre es Alexander
SELECT * FROM users WHERE name LIKE '% Alexander';

-- 5. Cambiar el nombre del registro con id = 1, por tu nombre Ej:'Fernando Herrera'
UPDATE users 
SET name = 'Oscar Acuña'
WHERE id = '1';

-- 6. Borrar el último registro de la tabla 
SELECT max(id) FROM  users;

DELETE FROM users
WHERE id = '3980';


--> NUEVA TECNICA (subquery)

DELETE FROM users
WHERE id = (SELECT max(id) FROM users);

select * from users;

---------------------------------> ACTIVIDAD <---------------------------------
UPDATE users
SET 	first_name = SUBSTRING (name, 0 , POSITION(' ' IN name)), 
	last_name = SUBSTRING(name, POSITION(' ' IN name)+ 1);
