-- NOMBRE, APELLIDO E IP, DONDEN LA ULTIMA CONEXION SE DIO DE 221.XXX.XXX.XXX
SELECT * FROM users;

SELECT first_name, last_name, last_connection
FROM users
WHERE last_connection LIKE '221.%';

-- NOMBRE, APELLIDO Y SEGUIDORES(FOLLOWERS) DE TODOS A LOS QUE LO SIGUEN MAS DE 4600
SELECT first_name, last_name, followers
FROM users
WHERE followers > 4600
ORDER BY followers DESC;

/* Operador BETWEEN */

SELECT first_name, last_name, followers
FROM users
WHERE followers BETWEEN 4600 AND 4700
ORDER BY followers ASC;

/* Funcion MAX, MIN, COUNT, ROUND AVG */

SELECT COUNT(*) FROM users;

SELECT 
	COUNT(*) as Total_users,
	MIN(followers) as valor_minimo_followers,
	MAX(followers) as valor_maximo_followers,
	SUM(followers) as max_followers,
	AVG(followers) as avg_followers,
	ROUND( AVG(followers) ) as avg_followers_redondeado,
	SUM(followers) / COUNT(*) as avg_manual	
FROM users;



/*Agregando Subquery*/
SELECT 
	id, 
	first_name AS nombre,
	last_name AS apellido,
	followers AS  Seguidores
FROM users
WHERE followers = (SELECT MIN(followers) FROM users);


/* Funcion GROUP BY */

SELECT * FROM users;

SELECT first_name, last_name, followers
FROM users
WHERE followers = 4 OR followers = 4999; 


SELECT COUNT(*) as total_followers, followers
FROM users
WHERE followers = 4 OR followers = 4999
GROUP BY followers;

SELECT COUNT(*) as total_followers, followers
FROM users
WHERE followers BETWEEN 4500 AND 4999
GROUP BY followers
ORDER BY followers DESC;


/* HAVING --- CONDICION- despues del GROUP BY y antes del ORDER BY*/

SELECT * FROM users;


SELECT  COUNT(*), country
FROM users
GROUP BY country
HAVING count(*) >= 5 --- Condicion
ORDER BY COUNT(*) DESC;

/* Funcion DISTINCT */

SELECT * FROM users;

SELECT DISTINCT country FROM users;

/* Funcion GROUP BY --> MAS FUNCIONES */

SELECT * FROM USERS;

SELECT  COUNT(*),
	SUBSTRING(email, POSITION('@' IN email)+ 1)
FROM users
GROUP BY SUBSTRING(email, POSITION('@' IN email)+ 1)
HAVING COUNT(*) > 1
ORDER BY SUBSTRING(email, POSITION('@' IN email)+ 1) asc;

/* SUBQUERIES */
SELECT * FROM (
	SELECT  COUNT(*),
		SUBSTRING(email, POSITION('@' IN email)+ 1) AS DOMAIN,
		'Oscar' AS name,
		37 AS age
	FROM users
	GROUP BY SUBSTRING(email, POSITION('@' IN email)+ 1)
	HAVING COUNT(*) > 1
	ORDER BY SUBSTRING(email, POSITION('@' IN email)+ 1) asc
) AS email_domains;

