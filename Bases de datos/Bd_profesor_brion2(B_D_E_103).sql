-- Crea BD, tabla y datos.

DROP DATABASE IF EXISTS funciones_de_conversion;

CREATE DATABASE funciones_de_conversion;

USE funciones_de_conversion;

CREATE TABLE t_venta
    (
    id INT PRIMARY KEY,
    producto VARCHAR(100),
    precio VARCHAR(20),    -- Almacenado como texto
    cantidad VARCHAR(10),    -- Almacenado como texto
    fecha_venta VARCHAR(50)    -- Almacenado como texto
    );

INSERT INTO t_venta VALUES
    (1, 'Notebook', '550900.50', '4', '2025-10-01'),
    (2, 'Mouse', '9999.99', '7', '2024-09-07'),
    (3, 'Teclado', '17500.00', '6', '2025-08-13'),
    (4, 'Monitor', '150000.75', '5', '2025-03-20'),
    (5, 'Impresora', '75000.75', '8', '2024-10-20');