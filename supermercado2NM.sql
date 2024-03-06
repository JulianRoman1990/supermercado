-- Active: 1709032388368@@b3jxvck0direazgd6igh-mysql.services.clever-cloud.com@3306@b3jxvck0direazgd6igh
-- Creación De Tablas

-- Supermercados
CREATE TABLE supermercados (
    id_supermercado INT PRIMARY KEY AUTO_INCREMENT,
    nombre_supermercado VARCHAR(255) NOT NULL,
    ubicacion VARCHAR(255),
    horarios_atencion VARCHAR(255)
);

-- Contacto de Supermercado
CREATE TABLE contacto_supermercado (
    id_contacto INT PRIMARY KEY AUTO_INCREMENT,
    id_supermercado INT,
    telefono VARCHAR(20),
    correo VARCHAR(255),
    FOREIGN KEY (id_supermercado) REFERENCES supermercados (id_supermercado)
);

-- Agregar Supermercados
INSERT INTO supermercados (nombre_supermercado, ubicacion, horarios_atencion)
VALUES
    ('Supermercado Medellín', 'Medellín', '9:00 AM - 8:00 PM'),
    ('Supermercado Envigado', 'Envigado', '8:30 AM - 7:30 PM'),
    ('Supermercado Itagüí', 'Itagüí', '8:00 AM - 9:00 PM'),
    ('Supermercado Sabaneta', 'Sabaneta', '10:00 AM - 6:00 PM'),
    ('Supermercado Bello', 'Bello', '10:30 AM - 7:30 PM');

-- Clientes
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    cedula VARCHAR(20) NOT NULL,
    correo VARCHAR(255),
    whatsapp VARCHAR(20),
    direccion VARCHAR(255)
);

-- Relación muchos a muchos entre clientes y supermercados
CREATE TABLE supermercado_cliente (
    id_supermercado INT,
    id_cliente INT,
    fecha_registro DATE,
    PRIMARY KEY (id_supermercado, id_cliente, fecha_registro),
    FOREIGN KEY (id_supermercado) REFERENCES supermercados (id_supermercado),
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
);

-- Categorías
CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre_categoria VARCHAR(255) NOT NULL
);

-- Productos
CREATE TABLE productos (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    cantidad INT NOT NULL
);

-- Relación entre productos y categorías
CREATE TABLE productos_categorias (
    id_producto INT,
    id_categoria INT,
    PRIMARY KEY (id_producto, id_categoria),
    FOREIGN KEY (id_producto) REFERENCES productos (id_producto),
    FOREIGN KEY (id_categoria) REFERENCES categorias (id_categoria)
);

-- Pedidos
CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    fecha_pedido DATE NOT NULL,
    total_pedido DECIMAL(10, 2) NOT NULL,
    estado_pedido VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
);

-- Relación entre pedidos y productos
CREATE TABLE pedido_producto (
    id_pedido INT,
    id_producto INT,
    cantidad INT,
    PRIMARY KEY (id_pedido, id_producto),
    FOREIGN KEY (id_pedido) REFERENCES pedidos (id_pedido),
    FOREIGN KEY (id_producto) REFERENCES productos (id_producto)
);

-- Creación de las demás tablas de productos según categorías...

-- CONSULTAS (puedes adaptar estas consultas según tus necesidades)

-- Consulta de supermercados
SELECT * FROM supermercados;

-- Consulta de clientes
SELECT * FROM clientes;

-- Consulta de productos por categoría
SELECT * FROM productos_categorias pc
INNER JOIN productos p ON pc.id_producto = p.id_producto
INNER JOIN categorias c ON pc.id_categoria = c.id_categoria;

-- Detalle de producto
SELECT * FROM productos WHERE id_producto = 1;

-- Registro de nuevos clientes
INSERT INTO clientes (nombre, apellido, cedula, correo, whatsapp, direccion)
VALUES ('Julian', 'Agudelo', '1040746538', 'julianroman1990@gmail.com', '+573005324567', 'Niquitao');

-- Historial de pedidos por cliente
SELECT * FROM pedidos WHERE id_cliente = 2;

-- Actualizar información del cliente
UPDATE clientes
SET direccion = 'Nueva Direccion', whatsapp = '+57YYYYYYYYYY'
WHERE id_cliente = 1;

-- Verificación de inventario
SELECT * FROM productos0;

-- Eliminar cliente
DELETE FROM clientes WHERE id_cliente = 11;


-- Consulta de supermercados y clientes relacionados
SELECT sc.id_supermercado, s.nombre_supermercado, c.id_cliente, c.nombre, c.apellido
FROM supermercado_cliente sc
INNER JOIN supermercados s ON sc.id_supermercado = s.id_supermercado
INNER JOIN clientes c ON sc.id_cliente = c.id_cliente;
