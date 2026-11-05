-- ===============================================================================
-- Script SQL de creación de una base de datos de prueba
-- Asignatura : Bases de Datos Estructuradas
-- Profesor : Patricio Briones Bonvallet
-- Inacap : Temuco
-- Las tablas están construidas con fines didácticos (no optimizadas técnicamente)
-- Todos los datos son ficticios y solo con fines académicos
-- ===============================================================================

DROP DATABASE IF EXISTS expresionesCondicionales;
CREATE DATABASE expresionesCondicionales;
USE expresionesCondicionales;

CREATE TABLE t_cliente
    (
    id INT,
    nombre VARCHAR (100),
    total_compras INT
    );

CREATE TABLE t_empleado
    (
    nombre VARCHAR (100),
    sueldo INT,
    antiguedad_anios INT,
    departamento VARCHAR (50)
    );

CREATE TABLE t_inventario
    (
    producto VARCHAR(50),
    cantidad INT,
    precio DECIMAL(10,2)
    );

CREATE TABLE t_personal
    (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    ciudad VARCHAR(50),
    salario INT,
    departamento VARCHAR(50),
    fecharegistro DATE
    );

CREATE TABLE t_producto
    (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombreproducto VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    fechacreacion DATETIME
    );

CREATE TABLE t_ropa
    (
    nombre VARCHAR(50) NOT NULL,
    talla CHAR(1)
    );

CREATE TABLE t_usuario
    (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    celular VARCHAR(15)
    );

INSERT INTO t_cliente VALUES
    (1, 'Heriberto Fuenzalida', NULL),
    (2, 'Iván Guzmán', 12000),
    (3, 'Mabel López', 300000),
    (4, 'Olga Olivares', 950000),
    (5, 'Renata Salgado', 1500000);

INSERT INTO t_empleado VALUES
    ('Diego Hernández', 600000, 1, 'Administración'),
    ('Ernesto Ibáñez', 750000, 2, 'Ventas'),
    ('Fernando Jorquera', 1200000, 3, 'Administración'),
    ('Gastón Kramer', 2350000, 4, 'Ventas'),
    ('Hugo López', 1600000, 5, 'Logística'),
    ('Ignacia Manríquez', 1250000, 6, 'Logística'),
    ('Josefina Opazo', 950000, 7, 'Compras');

INSERT INTO t_inventario VALUES
    ('Estufa', 5, 75000),
    ('Sofá', 25, 170000),
    ('Ventilador', 75, 35000),
    ('Lámpara', 120, 17000);

INSERT INTO t_personal (id, nombre, apellido, email, ciudad, salario, departamento, fecharegistro) VALUES
    (34, 'Juan', 'Pérez', NULL, NULL, 350000, 'Ventas', NULL),
    (35, 'María', 'García', NULL, NULL, 650000, NULL, NULL),
    (36, 'Carlos', 'López', NULL, NULL, 680000, NULL, NULL),
    (37, 'Ana', 'Martín', NULL, NULL, NULL, 'Ventas', NULL),
    (5, 'Ana', 'Santos', 'as@gmail.com', 'Temuco', 1500000, 'Gerencia', '2025-08-21');

INSERT INTO t_producto (nombreproducto, precio, stock, fechacreacion) VALUES
    ('Cuaderno', 4725.00, 20, '2025-08-21 00:00:00'),
    ('Lápiz', 2940.00, 0, '2024-09-11 00:00:00'),
    ('Goma', 1260.00, 15, '2023-10-31 00:00:00');

INSERT INTO t_ropa (nombre, talla) VALUES
    ('Camisa', 'S'),
    ('Chaleco', 'M'),
    ('Polera', 'L'),
    ('Polerón', ''),
    ('Camisa', 'L');

INSERT INTO t_usuario (nombre, email, celular) VALUES
    ('Juan Pedro', 'jp@mail.com', '+57800000001'),
    ('Maximiliano', 'm@mail.com', NULL),
    ('Cristobal', NULL, '+57800000003'),
    ('Estefania', NULL, NULL);