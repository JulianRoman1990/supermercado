-- Active: 1709032388368@@b3jxvck0direazgd6igh-mysql.services.clever-cloud.com@3306@b3jxvck0direazgd6igh
 -- DATABASE
SHOW DATABASES;

-- MOSTRAR TODOS LOS USUARIOS
SELECT *
FROM users;


-- NOMBRES APELLIDOS Y EDAD 20 
SELECT nombres, apellidos, edad 
FROM users
 WHERE edad = 20;



SELECT nombres, apellidos, edad, genero
FROM users
WHERE genero = 'M' AND edad BETWEEN 20 AND 30;

SELECT *
FROM users
ORDER BY  Edad ASC
LIMIT 1;


SELECT nombres,apellidos,edad,genero
FROM users
ORDER BY id 
LIMIT 5;

SELECT nombres, apellidos, edad, genero
FROM users
ORDER BY id DESC
LIMIT 10;

SELECT COUNT (id)
FROM users;

SELECT nombres, apellidos, correo
FROM users
WHERE correo LIKE '%.net';


SELECT nombres, apellidos, pais
FROM users
WHERE pais <> 'Colombia';

SELECT nombres, apellidos, pais
FROM users
WHERE pais NOT IN ('Ecuador', 'Panamá');

SELECT COUNT(*) 
FROM users
WHERE pais = 'colombia' and musica = 'rock';

UPDATE users
SET musica = 'carranga'
WHERE musica = 'metal';

SELECT *
FROM users
WHERE musica = 'carranga' and genero ='H' and pais = 'colombia' and edad BETWEEN 10 and 20;

UPDATE users
SET musica = 'carranga'
WHERE edad = '99';


SELECT nombres
FROM users
WHERE nombres LIKE 'a%';


SELECT  apellidos
FROM users
WHERE apellidos LIKE '%z';


UPDATE users
SET musica ='null'
WHERE edad = '50';

SELECT *
FROM users 
WHERE musica = 'null';


SELECT SUM (edad)
FROM users;

SELECT COUNT (*)
FROM users
WHERE pais = 'ecuador'

SELECT COUNT (*)
FROM users
WHERE pais = 'colombia' and musica = 'vallenato'
