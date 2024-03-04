--Nombre, apellido e IP, donde la última conexión se dio 221.xxx.xxx.xxx
SELECT * FROM users;

SELECT first_name, last_name,last_connection FROM users
WHERE last_connection LIKE '221%';



--Nombre, apellido y seguidores(followers) de todos a los que lo siguen más de 4600 personas

SELECT first_name, last_name, followers, '-' AS Prueba FROM users
WHERE followers > 4600;
