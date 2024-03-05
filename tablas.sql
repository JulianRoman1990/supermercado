-- Active: 1709032388368@@b3jxvck0direazgd6igh-mysql.services.clever-cloud.com@3306@b3jxvck0direazgd6igh
SHOW DATABASES;

-- TABLA MARCAS
CREATE TABLE marcas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50)
);

-- TABLA TIPO DE VEHICULO
CREATE TABLE tipo_vehiculo(
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(50)
);

-- TABLA VEHICULO
CREATE TABLE vehiculos(
    id INT PRIMARY KEY,
    modelo VARCHAR(50),
    placa VARCHAR(50),
    color_id INT,
    marca_id INT,
    tipo_vehiculo_id int
);


-- TABLA COLORES
CREATE TABLE colores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    color VARCHAR(50)
);

--INSERTAR MARCAS
INSERT INTO marcas (nombre)
VALUES 
('Toyota'),
('Mercedez Benz');


-- INSERTAR TIPOS DE VEHICULOS
INSERT INTO tipo_vehiculo (tipo)
VALUES
('Sedan'),
('Pick Up');


-- INSERTAR COLORES
INSERT INTO colores (color)
VALUES
('negro'),
('blanco');


-- CONSULTAR MARCAS
SELECT * 
FROM marcas;

-- CONSULTAR TIPO DE VEHICULO
SELECT *
FROM tipo_vehiculo;

-- CONSULTAR COLORES ADD
SELECT *
FROM colores;

-- CONSULTAR VEHICULOS ADD
SELECT *
FROM vehiculos;

-- INNER JOIN
SELECT vehiculos.modelo, vehiculos.placa, colores.color, marcas.nombre, tipo_vehiculo.tipo
FROM vehiculos
INNER JOIN marcas
INNER JOIN colores
INNER JOIN tipo_vehiculo
WHERE marca_id = marcas.id
AND color_id = colores.id
AND tipo_vehiculo_id = tipo_vehiculo.id

--ALTER

ALTER TABLE vehiculos ADD FOREIGN KEY (color_id) REFERENCES colores (id);
ALTER TABLE vehiculos ADD FOREIGN KEY (marca_id) REFERENCES marcas (id);
ALTER TABLE vehiculos ADD FOREIGN KEY (tipo_vehiculo_id) REFERENCES tipo_vehiculo(id);
