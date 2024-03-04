-- Creamos la tabla:

insert into usuarios 
  values('Marcelo','River'),
  	('Susana','chapita'),
	('Carlosfuentes','Boca'),
  	('Federicolopez','Boca');

 create table usuarios(
  nombre varchar(20),
  clave varchar(10)
 );

SELECT * FROM usuarios;

insert into usuarios 
  values('Marcelo','River'),
  	('Susana','chapita'),
	('Carlosfuentes','Boca'),
  	('Federicolopez','Boca');

update usuarios set clave='RealMadrid';

UPDATE usuarios set clave='Boca'
WHERE nombre = 'Federicolopez';

UPDATE usuarios SET clave='payaso'
WHERE nombre='JuanaJuarez';




-- Para actualizar varios campos en una sola instrucción empleamos:
UPDATE usuarios SET nombre='Marceloduarte', clave='Marce'
WHERE nombre='Marcelo';

TRUNCATE TABLE usuarios;


--Trabaje con la tabla "agenda" que almacena los datos de sus amigos.

create table agenda(
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11)
 );

INSERT INTO agenda
VALUES
	('Acosta','Alberto','Colon 123','4234567'),
	('Juarez','Juan','Avellaneda 135','4458787'),
	('Lopez','Maria','Urquiza 333','4545454'),
	('Lopez','Jose','Urquiza 333','4545454'),
	('Suarez','Susana','Gral. Paz 1234','4123456');

SELECT * FROM agenda;

-- 3- Modifique el registro cuyo nombre sea "Juan" por "Juan Jose" (1 registro afectado)

UPDATE agenda SET nombre = 'Juan Jose' 
WHERE nombre = 'Juan';

-- 4- Actualice los registros cuyo número telefónico sea igual a "4545454" por "4445566" (2 registros afectados)

UPDATE agenda SET telefono = '4445566'
WHERE telefono = '4545454';


/* 5- Actualice los registros que tengan en el campo "nombre" el valor "Juan" por "Juan Jose" (ningún 
registro afectado porque ninguno cumple con la condición del "where")*/

UPDATE agenda SET nombre = 'Juan Jose' 
WHERE nombre = 'Juan';


-- 6- Luego de cada actualización ejecute un select que muestre todos los registros de la tabla.

SELECT * FROM agenda; 



