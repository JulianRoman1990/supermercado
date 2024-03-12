-- Active: 1709120862925@@b3jxvck0direazgd6igh-mysql.services.clever-cloud.com@3306@b3jxvck0direazgd6igh
SHOW DATABASES;

-- Creacion De Tablas


-- Supermercados
CREATE TABLE supermercados (
    id_supermercado INT PRIMARY KEY AUTO_INCREMENT,
    nombre_supermercado VARCHAR(255) NOT NULL,
    ubicacion VARCHAR(255),
    horarios_atencion VARCHAR(255),
    contacto_telefono VARCHAR(20),
    contacto_correo VARCHAR(255)
);

-- Agregar Supermercados
INSERT INTO supermercados (nombre_supermercado, ubicacion, horarios_atencion, contacto_telefono, contacto_correo)
VALUES
    ('Supermercado Medellín', 'Medellín', '9:00 AM - 8:00 PM', '+574123456789', 'info@supermedellin.com'),
    ('Supermercado Envigado', 'Envigado', '8:30 AM - 7:30 PM', '+574234567890', 'info@superenvigado.com'),
    ('Supermercado Itagüí', 'Itagüí', '8:00 AM - 9:00 PM', '+574345678901', 'info@superitagui.com'),
    ('Supermercado Sabaneta', 'Sabaneta', '10:00 AM - 6:00 PM', '+574456789012', 'info@supersabaneta.com'),
    ('Supermercado Bello', 'Bello', '10:30 AM - 7:30 PM', '+574567890123', 'info@superbello.com');

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
    PRIMARY KEY (id_supermercado, id_cliente),
    FOREIGN KEY (id_supermercado) REFERENCES supermercados (id_supermercado),
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
);


-- Insertar Clientes de Medellín
INSERT INTO clientes (nombre, apellido, cedula, correo, whatsapp, direccion)
VALUES
    ('Carlos', 'Gómez', '1234567890', 'carlos@example.com', '+5741234567890', 'Barrio Laureles, Medellín'),
    ('Ana', 'Martínez', '2345678901', 'ana@example.com', '+5742345678901', 'Barrio El Poblado, Medellín'),
    ('Luis', 'Hernández', '3456789012', 'luis@example.com', '+5743456789012', 'Barrio Belén, Medellín'),
    ('Laura', 'García', '4567890123', 'laura@example.com', '+5744567890123', 'Barrio Robledo, Medellín'),
    ('Jorge', 'Rodríguez', '5678901234', 'jorge@example.com', '+5745678901234', 'Barrio San Javier, Medellín'),
    ('María', 'Sánchez', '6789012345', 'maria@example.com', '+5746789012345', 'Barrio Manrique, Medellín'),
    ('Miguel', 'López', '7890123456', 'miguel@example.com', '+5747890123456', 'Barrio Castilla, Medellín'),
    ('Sofía', 'Ramírez', '8901234567', 'sofia@example.com', '+5748901234567', 'Barrio Buenos Aires, Medellín'),
    ('Pedro', 'Pérez', '9012345678', 'pedro@example.com', '+5749012345678', 'Barrio La América, Medellín'),
    ('Isabel', 'Díaz', '0123456789', 'isabel@example.com', '+5740123456789', 'Barrio Santa Cruz, Medellín');



-- Pedidos
CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    fecha_pedido DATE NOT NULL,
    total_pedido DECIMAL(10, 2) NOT NULL,
    estado_pedido VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
);

-- Insertar Pedidos de ejemplo
INSERT INTO pedidos (id_cliente, fecha_pedido, total_pedido, estado_pedido)
VALUES
    (1, '2024-03-05', 50.99, 'En Proceso'),
    (2, '2024-03-06', 35.75, 'Entregado'),
    (3, '2024-03-07', 22.50, 'Pendiente'),
    (4, '2024-03-08', 45.30, 'Enviado'),
    (5, '2024-03-09', 28.99, 'Entregado'),
    (6, '2024-03-10', 18.75, 'Pendiente'),
    (7, '2024-03-11', 37.40, 'Enviado'),
    (8, '2024-03-12', 55.25, 'En Proceso'),
    (9, '2024-03-13', 42.80, 'Entregado'),
    (10, '2024-03-14', 30.50, 'Pendiente');




-- Categorias
CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT, nombre_categoria VARCHAR(255) NOT NULL
);

-- Insertar categorías
INSERT INTO
    categorias (nombre_categoria)
VALUES ('Aseo y Limpieza'),
    ('Enlatados y Conservas'),
    ('Lácteos y Productos Lácteos'),
    ('Frutas y Verduras'),
    ('Carnes y Pescados'),
    ('Panadería y Productos Horneados'),
    ('Bebidas y Licores'),
    ('Snacks y Alimentos Procesados'),
    ('Cuidado Personal y Belleza'),
    ('Artículos para el Hogar y Utensilios de Cocina');

-- Aseo y Limpieza
CREATE TABLE aseo_limpieza (
    id_producto INT PRIMARY KEY AUTO_INCREMENT, nombre VARCHAR(255) NOT NULL, precio DECIMAL(10, 2) NOT NULL, cantidad INT NOT NULL, id_categoria INT, FOREIGN KEY (id_categoria) REFERENCES categorias (id_categoria)
);

-- Insertar Aseo y Limpieza
INSERT INTO
    aseo_limpieza (
        nombre, precio, cantidad, id_categoria
    )
VALUES ('Detergente', 5.99, 50, 1),
    ('Jabón', 2.50, 30, 1),
    ('Limpiavidrios', 3.99, 20, 1),
    ('Limpiapisos', 3.99, 30, 1),
    ('jabon rey', 2.85, 40, 1),
    ('fabuloso', 3.60, 70, 1),
    ('axion', 2.74, 58, 1),
    ('limpido', 1.98, 47, 1),
    ('suavizante', 4.50, 15, 1),
    ('desinfectante', 7.99, 10, 1);


-- Enlatados y Conservas
CREATE TABLE enlatados_conservas (
    id_producto INT PRIMARY KEY AUTO_INCREMENT, nombre VARCHAR(255) NOT NULL, precio DECIMAL(10, 2) NOT NULL, cantidad INT NOT NULL, id_categoria INT, FOREIGN KEY (id_categoria) REFERENCES categorias (id_categoria)
);

-- Insertar Enlatados y Conservas
INSERT INTO
    enlatados_conservas (
        nombre, precio, cantidad, id_categoria
    )
VALUES
    ('Atún enlatado', 3.99, 40, 2),
    ('Sopa de tomate en lata', 1.99, 25, 2),
    ('Champiñones enlatados', 2.49, 35, 2),
    ('Sopa de tomate', 1.99, 70, 2),
    ('Frijoles enlatados', 1.99, 4, 2), 
    ('Atún enlatado', 2.80, 60, 2), 
    ('Sardinas enlatadas', 3.89, 2, 2), 
    ('Duraznos enlatados', 5.99, 10, 2), 
    ('Aceitunas enlatadas', 1.75, 56, 2);



-- Lácteos y Productos Lácteos
CREATE TABLE lacteos (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    cantidad INT NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias (id_categoria)
);

-- Insertar Lácteos
INSERT INTO lacteos (nombre, precio, cantidad, id_categoria) VALUES
    ('Leche entera', 2.99, 20, 3),
    ('Yogur natural', 1.50, 30, 3),
    ('Queso cheddar', 4.99, 15, 3),
    ('Mantequilla', 3.25, 25, 3),
    ('Helado de vainilla', 5.50, 12, 3),
    ('Yogur de fresa', 1.75, 18, 3),
    ('Queso suizo', 6.99, 10, 3),
    ('Leche descremada', 3.49, 22, 3),
    ('Queso brie', 8.50, 8, 3),
    ('Helado de chocolate', 5.50, 15, 3);



-- Frutas y Verduras
CREATE TABLE frutas_verduras (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    cantidad INT NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias (id_categoria)
);

-- Insertar Frutas y Verduras
INSERT INTO frutas_verduras (nombre, precio, cantidad, id_categoria) VALUES
    ('Manzana', 1.99, 50, 4),
    ('Plátano', 0.75, 30, 4),
    ('Naranjas', 1.25, 40, 4),
    ('Uvas', 2.50, 20, 4),
    ('Zanahorias', 0.99, 35, 4),
    ('Tomates', 1.50, 25, 4),
    ('Pepino', 0.99, 40, 4),
    ('Lechuga', 1.75, 30, 4),
    ('Papas', 2.25, 28, 4),
    ('Fresas', 3.99, 15, 4);



-- Carnes y Pescados
CREATE TABLE carnes_pescados (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    cantidad INT NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias (id_categoria)
);

-- Insertar Carnes y Pescados
INSERT INTO carnes_pescados (nombre, precio, cantidad, id_categoria) VALUES
    ('Pollo', 5.99, 20, 5),
    ('Filete de res', 12.50, 15, 5),
    ('Salmón', 8.99, 10, 5),
    ('Chuletas de cerdo', 6.75, 18, 5),
    ('Atún fresco', 9.50, 12, 5),
    ('Costillas de cordero', 15.99, 8, 5),
    ('Pescado blanco', 7.25, 20, 5),
    ('Ternera molida', 4.99, 25, 5),
    ('Langostinos', 10.75, 15, 5),
    ('Salchichas de pavo', 3.49, 30, 5);



-- Panadería y Productos Horneados
CREATE TABLE panaderia_productos_horneados (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    cantidad INT NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias (id_categoria)
);

-- Insertar Panadería y Productos Horneados
INSERT INTO panaderia_productos_horneados (nombre, precio, cantidad, id_categoria) VALUES
    ('Pan integral', 3.99, 15, 6),
    ('Baguette', 2.50, 20, 6),
    ('Croissants', 2.99, 25, 6),
    ('Pan de ajo', 4.25, 18, 6),
    ('Pastel de chocolate', 8.99, 12, 6),
    ('Bollos de canela', 3.50, 22, 6),
    ('Donas surtidas', 1.75, 30, 6),
    ('Tarta de manzana', 6.49, 15, 6),
    ('Pan de centeno', 4.75, 20, 6),
    ('Palitos de pan', 2.25, 28, 6);




-- Bebidas y licores
CREATE TABLE bebidas_licores (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    cantidad INT NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias (id_categoria)
);

-- Insertar Bebidas Y Licores
INSERT INTO bebidas_licores (nombre, precio, cantidad, id_categoria) VALUES
    ('Agua mineral', 1.25, 50, 7),
    ('Refresco cola', 1.99, 40, 7),
    ('Cerveza', 2.50, 30, 7),
    ('Vino tinto', 8.99, 25, 7),
    ('Jugo de naranja', 3.50, 30, 7),
    ('Café', 2.00, 40, 7),
    ('Té verde', 1.75, 35, 7),
    ('Whisky', 25.99, 15, 7),
    ('Energizante', 2.49, 20, 7),
    ('Limonada', 1.99, 28, 7);

-- Snacks y alimentos procesados
CREATE TABLE snacks_alimentos_procesados (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    cantidad INT NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias (id_categoria)
);

-- Insertar Snacks
INSERT INTO snacks_alimentos_procesados (nombre, precio, cantidad, id_categoria) VALUES
    ('Papas fritas', 1.99, 30, 8),
    ('Galletas saladas', 2.50, 25, 8),
    ('Barra de granola', 1.75, 40, 8),
    ('Chocolate', 2.99, 35, 8),
    ('Frutos secos', 3.50, 20, 8),
    ('Caramelos', 1.25, 50, 8),
    ('Chips de maíz', 2.25, 45, 8),
    ('Palomitas de maíz', 1.50, 60, 8),
    ('Barras energéticas', 2.75, 28, 8),
    ('Helado', 4.99, 15, 8);



-- Cuidado personal y belleza
CREATE TABLE cuidado_personal_belleza (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    cantidad INT NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias (id_categoria)
);

-- Insertar Cuidado
INSERT INTO cuidado_personal_belleza (nombre, precio, cantidad, id_categoria) VALUES
    ('Champú', 5.99, 30, 9),
    ('Acondicionador', 4.50, 25, 9),
    ('Jabón líquido', 3.25, 40, 9),
    ('Cepillo de dientes', 2.75, 35, 9),
    ('Desodorante', 2.99, 20, 9),
    ('Maquinilla de afeitar', 3.50, 18, 9),
    ('Crema hidratante', 6.25, 22, 9),
    ('Perfume', 15.99, 15, 9),
    ('Papel higiénico', 1.99, 40, 9),
    ('Protector solar', 8.50, 12, 9);



-- Artículos para el hogar y utensilios de cocina
CREATE TABLE articulos_hogar_utensilios_cocina (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    cantidad INT NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias (id_categoria)
);

-- Insertar Articulos hogar
INSERT INTO articulos_hogar_utensilios_cocina (nombre, precio, cantidad, id_categoria) VALUES
    ('Toallas de cocina', 2.99, 30, 10),
    ('Paños de limpieza', 1.50, 25, 10),
    ('Ollas y sartenes', 20.75, 20, 10),
    ('Platos y tazas', 15.99, 30, 10),
    ('Cubiertos', 10.50, 25, 10),
    ('Cuchillos de cocina', 12.25, 20, 10),
    ('Tablas de cortar', 8.99, 22, 10),
    ('Cubos de basura', 5.50, 18, 10),
    ('Lámparas', 25.99, 15, 10),
    ('Organizadores de cocina', 7.99, 12, 10);




-- CONSULTAS 

SELECT *
FROM supermercados;

SELECT *
FROM clientes;

-- Búsqueda de productos por categoría
SELECT * FROM aseo_limpieza WHERE id_categoria = 1;

-- Detalle de producto
SELECT * FROM aseo_limpieza WHERE id_producto = 1;

-- Registro de nuevos clientes
INSERT INTO clientes (nombre, apellido, cedula, correo, whatsapp, direccion)
VALUES ('julian', 'Agudelo', '1040746538', 'julianroman1990@gmail.com', '+573005324567', 'Niquitao');

-- Historial de pedidos por cliente
SELECT * FROM pedidos WHERE id_cliente = 2;ha)


-- Actualizar información del cliente
UPDATE clientes
SET direccion = 'Nueva Direccion', whatsapp = '+57YYYYYYYYYY'
WHERE id_cliente = 1;

-- Verificación de inventario
SELECT * FROM aseo_limpieza WHERE cantidad < 40;


-- Gestión de categorías
INSERT INTO categorias (nombre_categoria) VALUES ('Nueva Categoría');

-- Seguimiento de estado de pedidos
SELECT * FROM pedidos WHERE estado_pedido = 'En Proceso';


-- Eliminar cliente
DELETE FROM clientes WHERE id_cliente = 11;




--JOIN

--  Pedido con Nombre de Cliente
SELECT pedidos.id_pedido, pedidos.fecha_pedido, pedidos.total_pedido, pedidos.estado_pedido, clientes.nombre AS nombre_cliente
FROM pedidos
INNER JOIN clientes ON pedidos.id_cliente = clientes.id_cliente;


--  Productos con Nombre de Categoría
SELECT aseo_limpieza.nombre AS nombre_producto, aseo_limpieza.precio, aseo_limpieza.cantidad, categorias.nombre_categoria
FROM aseo_limpieza
INNER JOIN categorias ON aseo_limpieza.id_categoria = categorias.id_categoria;


--Productos y Cantidad en el Inventario
SELECT aseo_limpieza.nombre, aseo_limpieza.cantidad
FROM aseo_limpieza
WHERE aseo_limpieza.cantidad < 40;


-- Pedidos y Clientes con Detalle del Producto
SELECT pedidos.id_pedido, pedidos.fecha_pedido, pedidos.total_pedido, pedidos.estado_pedido, aseo_limpieza.nombre AS nombre_producto, aseo_limpieza.precio, aseo_limpieza.cantidad
FROM pedidos
INNER JOIN aseo_limpieza ON pedidos.id_pedido = aseo_limpieza.id_producto;






