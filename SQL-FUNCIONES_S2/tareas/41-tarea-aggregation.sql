CREATE TABLE medicamentos(
	codigo serial,
	nombre VARCHAR(20),
	laboratorio VARCHAR(20),
	precio DECIMAL(6,2),
	cantidad SMALLINT,
	fechavencimiento DATE NOT NULL,
	numerolote INT DEFAULT NULL,
	primary key(codigo)

);




SELECT * FROM medicamentos;
-- 3- Muestre la cantidad de registros empleando la función "count(*)" (7 registros)
SELECT COUNT(*) FROM medicamentos;
 

-- 4- Cuente la cantidad de medicamentos que tienen laboratorio conocido (5 registros)

SELECT COUNT(*), laboratorio
FROM medicamentos
WHERE laboratorio IS NOT NULL
GROUP BY laboratorio
ORDER BY COUNT(*) DESC;


/*5- Cuente la cantidad de medicamentos que tienen precio distinto a "null" y que tienen cantidad 
distinto a "null", disponer alias para las columnas.*/

SELECT * FROM  medicamentos;

SELECT COUNT(*), laboratorio, precio, cantidad
FROM medicamentos
WHERE precio IS NOT NULL AND cantidad IS NOT NULL
GROUP BY precio, cantidad, laboratorio;

-- R:
 select count(laboratorio)
   from medicamentos;



/*6- Cuente la cantidad de remedios con precio conocido, cuyo laboratorio comience con "B" (2 
registros)*/

SELECT COUNT(*), laboratorio, cantidad
FROM medicamentos
WHERE precio IS NOT NULL AND laboratorio LIKE 'B%'
GROUP BY cantidad, laboratorio;

--R:
 select count(precio)
  from medicamentos
  where laboratorio like 'B%';


/*7- Cuente la cantidad de medicamentos con número de lote distinto de "null" (0 registros)*/
SELECT * FROM medicamentos;

SELECT COUNT(numerolote)
FROM medicamentos
WHERE precio IS NOT NULL;


/* Funciones de agrupamiento (count - sum - min - max - avg) */

create table empleados(
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  seccion varchar(20),
  sueldo decimal(6,2),
  cantidadhijos smallint,
  primary key(documento)
 );

SELECT * FROM empleados;
	
-- Muestre la cantidad de empleados usando "count" (9 empleados)
SELECT COUNT(*) FROM empleados;

-- Muestre la cantidad de empleados con sueldo no nulo de la sección "Secretaria" (2 empleados)
select count(sueldo)
  from empleados
  where seccion='Secretaria';

-- Muestre el sueldo más alto y el más bajo colocando un alias (5000 y 2000)

SELECT MAX(sueldo) as sueldo_alto, MIN(sueldo) as sueldo_bajo FROM empleados;


-- Muestre el valor mayor de "cantidadhijos" de los empleados "Perez" (3 hijos)	
SELECT MAX(cantidadhijos) as mayor_cantidad_hijos 
FROM empleados
WHERE nombre LIKE '%Perez%';

-- Muestre el promedio de sueldos de todo los empleados (3400. Note que hay un sueldo nulo y no es tenido en cuenta)
SELECT * FROM empleados;

SELECT ROUND( AVG(sueldo) ) FROM empleados;

-- Muestre el promedio de sueldos de los empleados de la sección "Secretaría" (2100)

SELECT ROUND( AVG(sueldo) )
FROM empleados
WHERE seccion LIKE 'Secretaria';

-- Muestre el promedio de hijos de todos los empleados de "Sistemas" (2)

SELECT ROUND( AVG(cantidadhijos) )
FROM empleados
WHERE seccion  LIKE 'Secretaria';

