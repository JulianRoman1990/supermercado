-- Active: 1709120862925@@b3jxvck0direazgd6igh-mysql.services.clever-cloud.com@3306@b3jxvck0direazgd6igh

SHOW DATABASES;

CREATE TABLE empresas(
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(45),
  nit VARCHAR(45),
  telefono VARCHAR(20),
  direccion VARCHAR(45)
);
INSERT INTO empresas(nombre,nit,telefono,direccion)VALUES('test','test','test','test');-- insertar datos en la tabla
INSERT INTO empresas(nombre,nit,telefono,direccion)VALUES('Riwi','900456987','3104569874','calle 1 # 2-3');
DELETE FROM empresas WHERE nombre = 'test';-- eliminar datos de la tabla
ALTER TABLE empresas ADD COLUMN correo VARCHAR(150);--modificar columnas y tipos de datos en la tabla
UPDATE empresas SET correo = 'correo@riwi.io' WHERE nombre = 'Riwi';--modificar datos de la tabla
SELECT * FROM empresas;--mostrar datos de la tabla
DROP TABLE empresas;--eliminar tabla


CREATE TABLE vehiculos(
  id INT AUTO_INCREMENT PRIMARY KEY,
  placa VARCHAR(6),
  modelo VARCHAR(20),
  marca VARCHAR(45),
  color VARCHAR(20),
  tipo_vehiculo VARCHAR(45)
);
INSERT INTO vehiculos(placa,modelo,marca,color,tipo_vehiculo)VALUES('test','test','test','test','test');
INSERT INTO vehiculos(placa,modelo,marca,color,tipo_vehiculo)VALUES('ABC123','Optra','Chevrolet','Gris','Automovil');
DELETE FROM vehiculos WHERE placa = 'test';
ALTER TABLE vehiculos ADD COLUMN año VARCHAR(4);
UPDATE vehiculos set año = '2008' WHERE placa = 'ABC123';
SELECT * FROM vehiculos;
DROP TABLE vehiculos;


CREATE TABLE paises(
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(45)
);
INSERT INTO paises(nombre)VALUES('test');
INSERT INTO paises(nombre)VALUES('Colombia');
DELETE FROM paises WHERE nombre = 'test';
ALTER TABLE paises ADD COLUMN poblacion VARCHAR(10);
UPDATE paises SET poblacion = '25`000.000';
SELECT * FROM paises;
DROP TABLE paises;


CREATE TABLE ciudad(
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(40)
);
INSERT INTO ciudad(nombre)VALUES('test');
INSERT INTO ciudad(nombre)VALUES('Medellin');
DELETE FROM ciudad WHERE nombre = 'test';
ALTER TABLE ciudad ADD COLUMN departamento VARCHAR(30);
UPDATE ciudad SET departamento = 'Antioquia';
SELECT * FROM ciudad;
DROP TABLE ciudad;


CREATE TABLE usuarios(
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombres VARCHAR(45),
  apellidos VARCHAR(45),
  correo VARCHAR(150),
  password VARCHAR(10),
  edad VARCHAR(4),
  genero VARCHAR(20),
  altura VARCHAR(20),
  peso VARCHAR(8)
);
INSERT INTO usuarios(nombres,apellidos,correo,password,edad,genero,altura,peso)VALUES('test','test','test@gmail.com','test.','test','test','test','test');
INSERT INTO usuarios(nombres,apellidos,correo,password,edad,genero,altura,peso)VALUES('Andres Felipe','Gomez Piedrahita','correo@gmail.com','Abc123.','30','Masculino','1,84','100');
DELETE FROM usuarios WHERE nombres = 'test';
ALTER TABLE usuarios ADD COLUMN telefono VARCHAR(10);
UPDATE usuarios SET telefono = '3108849756';
SELECT * FROM usuarios;
DROP TABLE usuarios;


