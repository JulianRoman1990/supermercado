-- Active: 1709032388368@@b3jxvck0direazgd6igh-mysql.services.clever-cloud.com@3306@b3jxvck0direazgd6igh

SHOW DATABASES;

/* Tabla estudiantes */
CREATE TABLE estudiantes (
    id_estudiante INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    edad INT
);



/* Tabla materias */
CREATE TABLE materias (
    id_materia INT PRIMARY KEY AUTO_INCREMENT,
    materia VARCHAR(50),
    disponible BOOLEAN DEFAULT TRUE
);

/* Tabla calificaciones */
CREATE TABLE calificaciones (
    id_calificacion INT PRIMARY KEY AUTO_INCREMENT,
    id_estudiante INT,
    id_materia INT,
    calificacion INT,
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante),
    FOREIGN KEY (id_materia) REFERENCES materias(id_materia)
);

/* Insertar estudiantes */
INSERT INTO estudiantes (nombre, apellido, edad)
VALUES 
    ('Manuela', 'Giraldo', 20),
    ('Samuel', 'Vera', 23),
    ('Alex', 'Rodriguez', 27),
    ('Richard', 'Betancourt', 19),
    ('Andres', 'Gomez', 30),
    ('Deiby', 'Cardona', 25),
    ('Felipe', 'Forero', 28),
    ('Daniel', 'Gaviria', 25),
    ('Camilo', 'Atehortua', 21),
    ('Juan', 'Sanabria', 29);

/* Insertar materias con la columna disponible */
INSERT INTO materias (id_materia, materia, disponible)
VALUES
(1, 'Inglés', TRUE),
(2, 'Filosofía', FALSE),
(3, 'Estadística', TRUE),
(4, 'Química', FALSE),
(5, 'Biología', TRUE),
(6, 'Astronomía', FALSE),
(7, 'Matemáticas', TRUE),
(8, 'Física', FALSE),
(9, 'Geometría', TRUE),
(10, 'Trigonometría', FALSE);

/* Insertar calificaciones */
INSERT INTO calificaciones (id_estudiante, id_materia, calificacion)
VALUES
-- Calificaciones para Manuela
(1, 1, 8), (1, 2, 7), (1, 3, 9), (1, 4, 6), (1, 5, 10), (1, 6, 5), (1, 7, 8), (1, 8, 4), (1, 9, 7), (1, 10, 9),
-- Calificaciones para Samuel
(2, 1, 7), (2, 2, 6), (2, 3, 8), (2, 4, 9), (2, 5, 5), (2, 6, 10), (2, 7, 6), (2, 8, 8), (2, 9, 9), (2, 10, 4),
-- Calificaciones para Alex
(3, 1, 9), (3, 2, 7), (3, 3, 6), (3, 4, 8), (3, 5, 10), (3, 6, 5), (3, 7, 7), (3, 8, 8), (3, 9, 9), (3, 10, 6),
-- Calificaciones para Richard
(4, 1, 6), (4, 2, 8), (4, 3, 7), (4, 4, 9), (4, 5, 5), (4, 6, 10), (4, 7, 8), (4, 8, 4), (4, 9, 7), (4, 10, 9),
-- Calificaciones para Andres
(5, 1, 8), (5, 2, 9), (5, 3, 7), (5, 4, 6), (5, 5, 10), (5, 6, 5), (5, 7, 8), (5, 8, 4), (5, 9, 7), (5, 10, 9),
-- Calificaciones para Deiby
(6, 1, 7), (6, 2, 6), (6, 3, 8), (6, 4, 9), (6, 5, 5), (6, 6, 10), (6, 7, 6), (6, 8, 8), (6, 9, 9), (6, 10, 4),
-- Calificaciones para Felipe
(7, 1, 9), (7, 2, 7), (7, 3, 6), (7, 4, 8), (7, 5, 10), (7, 6, 5), (7, 7, 7), (7, 8, 8), (7, 9, 9), (7, 10, 6),
-- Calificaciones para Daniel
(8, 1, 6), (8, 2, 8), (8, 3, 7), (8, 4, 9), (8, 5, 5), (8, 6, 10), (8, 7, 8), (8, 8, 4), (8, 9, 7), (8, 10, 9),
-- Calificaciones para Camilo
(9, 1, 8), (9, 2, 9), (9, 3, 7), (9, 4, 6), (9, 5, 10), (9, 6, 5), (9, 7, 8), (9, 8, 4), (9, 9, 7), (9, 10, 9),
-- Calificaciones para Juan
(10, 1, 7), (10, 2, 6), (10, 3, 8), (10, 4, 9), (10, 5, 5), (10, 6, 10), (10, 7, 6), (10, 8, 8), (10, 9, 9), (10, 10, 4);


/* Consulta orden ascendente por edad estudiantes*/
SELECT *
FROM estudiantes
ORDER BY edad ASC;

/* Consulta de materias disponibles */
SELECT *
FROM materias 
WHERE disponible = TRUE;


/* Consulta tabla de estudiantes y materias */
SELECT
    e.id_estudiante,
    e.nombre AS Nombre,
    e.apellido AS Apellido,
    MAX(CASE WHEN m.id_materia = 1 THEN c.calificacion END) AS Ingles,
    MAX(CASE WHEN m.id_materia = 2 THEN c.calificacion END) AS Filosofia,
    MAX(CASE WHEN m.id_materia = 3 THEN c.calificacion END) AS Estadistica,
    MAX(CASE WHEN m.id_materia = 4 THEN c.calificacion END) AS Quimica,
    MAX(CASE WHEN m.id_materia = 5 THEN c.calificacion END) AS Biologia,
    MAX(CASE WHEN m.id_materia = 6 THEN c.calificacion END) AS Astronomia,
    MAX(CASE WHEN m.id_materia = 7 THEN c.calificacion END) AS Matematicas,
    MAX(CASE WHEN m.id_materia = 8 THEN c.calificacion END) AS Fisica,
    MAX(CASE WHEN m.id_materia = 9 THEN c.calificacion END) AS Geometria,
    MAX(CASE WHEN m.id_materia = 10 THEN c.calificacion END) AS Trigonometria
FROM
    estudiantes e
JOIN materias m ON 1=1
LEFT JOIN calificaciones c ON e.id_estudiante = c.id_estudiante AND m.id_materia = c.id_materia
GROUP BY
    e.id_estudiante, e.nombre, e.apellido
ORDER BY
    e.id_estudiante;





