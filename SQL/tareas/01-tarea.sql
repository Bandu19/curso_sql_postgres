-- 1. Ver todos los registros
SELECT * FROM users;

-- 2. Ver el registro cuyo id sea igual a 10
SELECT * FROM users WHERE id = '1';

-- 3. Quiero todos los registros que cuyo primer nombre sea Jim (engañosa)
SELECT * FROM users WHERE name LIKE 'Oscar %';


-- 4. Todos los registros cuyo segundo nombre es Alexander
SELECT * FROM users WHERE name ILIKE '% Gustavo';

-- 5. Cambiar el nombre del registro con id = 1, por tu nombre Ej:'Fernando Herrera'
UPDATE users 
SET name = 'Oscar Acuña'
WHERE id = '1';

-- 6. Borrar el último registro de la tabla 
SELECT max(id) FROM  users;

DELETE FROM users
WHERE id = '3980';


--> NUEVA TECNICA

DELETE FROM users
WHERE id = (SELECT max(id) FROM users);




---------------------------------> ACTIVIDAD <---------------------------------
UPDATE users
SET 	first_name = SUBSTRING (name, 0 , POSITION(' ' IN name)), 
	last_name = SUBSTRING(name, POSITION(' ' IN name)+ 1);


