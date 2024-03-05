-- Active: 1709120862925@@b3jxvck0direazgd6igh-mysql.services.clever-cloud.com@3306@b3jxvck0direazgd6igh
SHOW DATABASES;

-- Creacion De Tablas

CREATE TABLE supermercado( 

);

-- Clientes
CREATE TABLE clientes( ): 
-- Pedidos
CREATE TABLE pedidos ();

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
    (
        'Panadería y Productos Horneados'
    ),
    ('Bebidas y Licores'),
    (
        'Snacks y Alimentos Procesados'
    ),
    ('Cuidado Personal y Belleza'),
    (
        'Artículos para el Hogar y Utensilios de Cocina'
    );

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

INSERT INTO
    enlatados_conservas (
        nombre, precio, cantidad, id_categoria
    )
VALUES ('Atún enlatado', 3.99, 40, 2),
    (
        'Sopa de tomate en lata', 1.99, 25, 2
    ),
    (
        'Champiñones enlatados', 2.49, 35, 2
    ),
    ('Sopa de tomate', 1.99, 70, 2),
    (
        'Frijoles enlatados', 1.99, 4, 2
    ), 
    ('Atún enlatado', 2.80, 60, 2), 
    (
        'Sardinas enlatadas', 3.89, 2, 2
    ), 
    (
        'Duraznos enlatados', 5.99, 10, 2
    ), 
    (
        'Aceitunas enlatadas', 1.75, 56, 2
    );

-- Bebidas y licores
CREATE TABLE bebidas_licores (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    cantidad INT NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias (id_categoria)
);

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


