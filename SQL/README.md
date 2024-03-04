# Curso de Bases de datos con PostgreSQL

## Pasos para levantar el proyecto

1. Tener docker Desktop o el demonio de Docker corriendo
2. Clonar el proyecto
3. Navegar a la carpeta del proyecto
4. Ejecutar ```docker compose up -d```
5. Revisar el **archivo docker-compose.yml** para los usuarios y contraseñas
6. Para para Docker es con **docker compose down**


# Proceso para levantar DOCKER con postgres.


## Pasos para levantar el proyecto nuevamente


1. Entrar como superusuario en fedora 39
2. Eliminar la carpeta **postgres** con el comando ```sudo rm -rf ./postgres```
3. Ingresar comando **sudo systemctl start docker** para levantar el proyecto y luego repotes los pasos de  ```Pasos para levantar el proyecto en el punto numero 4.```


# Querys de SQL

1. ```OFFSET:``` Sirve para saltar los 2 primeros registros de la tabla.
2. ```ILIKE```  PostgreSQL es un poco más complejo. Puedes usar el operador ILIKE, que es similar a LIKE pero no distingue entre mayúsculas y minúsculas.

3. Quiero todos los registros que cuyo primer nombre sea Jim (Jim Carter o Jim Rogers) al dejar **%** un espacio estamos tomando en cuenta solo **JIM**, si por ejemplo ponemos jimmi no funcionara el query. Aqui dejare el query: ```SELECT * FROM users WHERE name LIKE 'Jim %';```

