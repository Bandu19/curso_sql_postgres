-- NOMBRE, APELLIDO E IP, DONDEN LA ULTIMA CONEXION SE DIO DE 221.XXX.XXX.XXX
SELECT * FROM users;

SELECT first_name, last_name, followers, last_connection
FROM users
WHERE last_connection LIKE '221.%';



-- NOMBRE, APELLIDO Y SEGUIDORES(FOLLOWERS) DE TODOS A LOS QUE LO SIGUEN MAS DE 4600

SELECT first_name, last_name, followers
FROM users
WHERE followers > 4600
ORDER BY followers ASC;

-- 1- Cree una tabla llamada "agenda". Debe tener los siguientes campos: apellido (cadena de 30), nombre (cadena de 20), domicilio (cadena de 30) y telefono (cadena de 11)

CREATE TABLE agenda(
	nombre VARCHAR(30),
	apellido VARCHAR(20),
	domicilio VARCHAR(30),
	telefono VARCHAR(11)
);

-- 2 - Visualice la estructura de la tabla "agenda".

 select table_name,column_name,udt_name,character_maximum_length 
  from information_schema.columns 
  where table_name = 'agenda';

-- 3- Ingrese los siguientes registros:
INSERT INTO  agenda
VALUES ('Torres','Juan','Avellaneda 135','4458787');

-- 4- Elimine la tabla "agenda":
DROP TABLE agenda;


-------Ingresemos el siguiente lote de comandos SQL en pgAdmin:


CREATE TABLE libros(
	titulo VARCHAR(20),
	autor VARCHAR(15),
	editorial VARCHAR(10),
	precio FLOAT,
	cantidad INTEGER
);

 select table_name,column_name,udt_name,character_maximum_length 
  from information_schema.columns 
  where table_name = 'libros';

 insert into libros (titulo,autor,editorial,precio,cantidad)
  values ('El aleph','Borges','Emece',25.50,100);
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values ('Matematica estas ahi','Paenza','Siglo XXI',18.8,200);

SELECT * FROM libros;

---------6- Recuperar algunos registros (where) ------------------
SELECT * FROM usuarios;


CREATE TABLE usuarios (
  nombre varchar(30),
  clave varchar(10)
);

SELECT table_name,column_name,udt_name,character_maximum_length 
  FROM information_schema.columns 
WHERE table_name = 'usuarios';

INSERT INTO usuarios
VALUES	('Marcelo','Boca'), 
	('JuanPerez','Juancito'),
	('Susana','River'),
	('Luis','River');

SELECT * FROM usuarios
WHERE nombre = 'JuanPerez';

SELECT nombre FROM usuarios
WHERE clave = 'Boca';

SELECT nombre FROM usuarios WHERE clave = 'River';


-- Primer problema:
-- Trabaje con la tabla "agenda" en la que registra los datos de sus amigos.


-- 1- Cree la tabla, con los siguientes campos: apellido (cadena de 30), nombre(cadena de 20), domicilio (cadena de 30) y telefono(cadena de 11).
CREATE TABLE agenda(
	nombre VARCHAR(30),
	apellido  VARCHAR(20),
	domicilio VARCHAR(30),
	telefono VARCHAR(11)
);

SELECT * FROM agenda;

-- 2- Visualice la estructura de la tabla "agenda".

SELECT table_name, column_name, udt_name, character_maximum_length FROM information_schema.columns WHERE table_name = 'agenda';


-- 3- Ingrese los siguientes registros:

INSERT INTO agenda
values
 	('HECTOR', 'LOPEZ', 'SALTA 535', '4887788'),
	('LUIS', 'LOPEZ', 'URQUIZA 333', '4545454'),
	( 'MARISA','LOPEZ', 'Urquiza 333', '4545454')
;

-- 4- Seleccione todos los registros de la tabla
SELECT * FROM agenda;

-- 5- Seleccione el registro cuyo nombre sea "Marisa" (1 registro)
SELECT * FROM agenda
WHERE nombre = 'MARISA';

-- 6- Seleccione los nombres y domicilios de quienes tengan apellido igual a "Lopez" (3 registros)

SELECT nombre, apellido, domicilio, telefono
FROM agenda
WHERE apellido LIKE 'LOPEZ%';


-- 7- Muestre el nombre de quienes tengan el teléfono "4545454" (2 registros)
SELECT nombre, apellido, domicilio, telefono
FROM agenda
WHERE apellido LIKE 'LOPEZ%' AND telefono LIKE '4545454%';

-- 8- ELIMINE LA TABLA
DROP TABLE agenda;


--Segundo problema:
--Trabaje con la tabla "libros" de una librería que guarda información referente a sus libros 
--disponibles para la venta.

CREATE TABLE libros(
	titulo VARCHAR(20),
	autor VARCHAR(30),
	editorial VARCHAR(15)
);

-- 2- Visualice la estructura de la tabla "libros".

SELECT table_name, column_name, udt_name, character_maximum_length FROM information_schema.columns WHERE table_name = 'libros';

-- 3- Ingrese los siguientes registros:

INSERT INTO libros
VALUES 	('El aleph','Borges','Emece'),
	('Martin Fierro','Jose Hernandez','Emece'),
 	('Martin Fierro','Jose Hernandez','Planeta'),
 	('Aprenda PHP','Mario Molina','Siglo XXI');

-- 4- SELECCIONE LOS REGISTROS CUYO AUTOR SEA "BORGES" 

SELECT * FROM libros
WHERE LOWER(autor)  ---> LOWER sirve par transformar Minusculas
LIKE LOWER('BORGES');

-- 5- Seleccione los títulos de los libros cuya editorial sea "Emece" (2 registros)

SELECT titulo, editorial
	FROM libros
WHERE editorial ='Emece' or LOWER (editorial) LIKE LOWER('EMECE%');

-- 6- Seleccione los nombres de las editoriales de los libros cuyo titulo sea "Martin Fierro" (2 registros)
SELECT UPPER(editorial), titulo
	FROM libros
WHERE LOWER(titulo) LIKE LOWER('Martin Fierro%');



-- Primer problema:
-- Un comercio que vende artículos de computación registra los datos de sus artículos en una tabla con ese nombre.

CREATE TABLE articulos(
	codigo INTEGER,
	nombre VARCHAR(20),
	descripcion VARCHAR(30),
	precio FLOAT,
	cantidad integer
);

-- 2- Ingrese algunos registros:

INSERT INTO articulos
VALUES (1,'impresora','Epson Stylus C45',400.80,20),
	(2,'impresora','Epson Stylus C85',500,30),
	(3,'monitor','Samsung 14',800,10),
	(4,'teclado','ingles Biswal',100,50),
	(5,'teclado','español Biswal',90,50);

-- 3- Seleccione los datos de las impresoras (2 registros)

SELECT nombre AS Impresoras 
FROM articulos
WHERE nombre = 'impresora';

-- 4- Seleccione los artículos cuyo precio sea mayor o igual a 400 (3 registros);

SELECT * FROM articulos
WHERE precio >= 400;

-- 5- Seleccione el código y nombre de los artículos cuya cantidad sea menor a 30 (2 registros)
SELECT codigo, nombre, precio, cantidad
FROM articulos
WHERE cantidad < 30;

-- 6- Selecciones el nombre y descripción de los artículos que NO cuesten $100 (4 registros)
SELECT nombre, descripcion
FROM articulos
WHERE precio<>100;



---TERMINA

-- 1- Cree la tabla eligiendo el tipo de dato adecuado para cada campo:
 create table peliculas(
  titulo varchar(20),
  actor varchar(20),
  duracion integer,
  cantidad integer
 );
-- 2- Ingrese los siguientes registros:

INSERT INTO peliculas	
VALUES	('Mision imposible','Tom Cruise',120,3),
	('Mision imposible 2','Tom Cruise',180,4),
	('Mujer bonita','Julia R.',90,1),
	('Elsa y Fred','China Zorrilla',80,2);

-- 3- Seleccione las películas cuya duración no supere los 90 minutos (2 registros);

SELECT * FROM peliculas
WHERE duracion <= 90;

-- 4- Seleccione el título de todas las películas en las que el actor NO sea "Tom Cruise" (2 registros);
SELECT titulo 
FROM peliculas
WHERE actor <> 'Tom Cruise';

-- 5- Muestre todos los campos, excepto "duracion", de todas las películas de las que haya más de 2 copias (2 registros)
SELECT titulo, actor, cantidad 
FROM peliculas
WHERE cantidad > 2;

/* COMENTAR */
