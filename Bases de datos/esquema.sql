-- ===============================================================================
-- Asignatura : Bases de Datos Estructuradas
-- Profesor : Patricio Briones Bonvallet
-- Inacap : Sede Temuco
-- Script SQL de creación de una base de datos de prueba
-- Las tablas están construidas con fines didácticos (no optimizadas técnicamente)
-- Todos los datos son ficticios y solo con fines académicos
-- ===============================================================================

DROP DATABASE IF EXISTS pedal_sur;
CREATE DATABASE pedal_sur
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_spanish_ci;

USE pedal_sur;

-- ---------------------------------------------------------------------
-- Tabla t_producto : catálogo de bicicletas, accesorios y repuestos
-- categoria : 'B' = Bicicleta, 'A' = Accesorio, 'R' = Repuesto
-- ---------------------------------------------------------------------
CREATE TABLE t_producto (
    id              INT UNSIGNED      NOT NULL AUTO_INCREMENT,
    sku             VARCHAR(6)        NOT NULL,
    nombre          VARCHAR(60)       NOT NULL,
    categoria       CHAR(1)           NOT NULL,
    marca           VARCHAR(30)       NOT NULL,
    aro             TINYINT UNSIGNED  NULL,
    precio          INT UNSIGNED      NOT NULL,
    costo           INT UNSIGNED      NOT NULL,
    precio_oferta   INT UNSIGNED      NULL,
    stock           SMALLINT          NOT NULL,
    stock_minimo    SMALLINT          NOT NULL,
    peso_kg         DECIMAL(5,2)      NOT NULL,
    fecha_ingreso   DATE              NOT NULL,
    garantia_meses  TINYINT UNSIGNED  NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

INSERT INTO t_producto
    (sku, nombre, categoria, marca, aro, precio, costo, precio_oferta, stock, stock_minimo, peso_kg, fecha_ingreso, garantia_meses)
VALUES
    ('000101', '  Bicicleta MTB Rocky 29 ',   'B', ' trek ',       29,  549990, 410000, 499990,  4,  3, 13.80, '2025-03-12', 24),
    ('000102', 'bicicleta urbana city 26',    'B', 'Oxford',       26,  289990, 205000,   NULL,  7,  3, 15.20, '2025-05-20', 12),
    ('000103', 'BICICLETA RUTA AERO 28',      'B', ' SPECIALIZED', 28,  899990, 690000,   NULL,  2,  2,  9.40, '2025-08-05', 24),
    ('000104', 'Bicicleta Infantil Junior 16','B', 'oxford',       16,  119990,  82000,  99990,  6,  4,  8.90, '2025-10-02',  6),
    ('000105', 'Bicicleta Eléctrica Volt 27', 'B', 'Trek',         27, 1290000, 990000,   NULL,  1,  2, 22.50, '2026-01-15', 24),
    ('000106', ' bicicleta bmx street 20',    'B', ' Mongoose',    20,  199990, 140000, 179990,  3,  2, 11.30, '2025-12-01', 12),
    ('000201', ' Casco Ruta Aero',            'A', 'Giro',       NULL,   59990,  36000,   NULL, 18, 10,  0.28, '2025-04-02',  6),
    ('000202', 'Luz Delantera LED',           'A', ' cateye ',   NULL,   24990,  14500,  19990, 25, 15,  0.12, '2025-06-18', NULL),
    ('000203', 'candado u-lock',              'A', 'Kryptonite', NULL,   34990,  21000,   NULL,  9, 10,  1.05, '2025-09-09', NULL),
    ('000204', 'Botella Térmica 750 ml',      'A', 'Camelbak',   NULL,   15990,   8900,   NULL, 42, 20,  0.20, '2026-02-10', NULL),
    ('000205', 'GUANTES GEL PRO',             'A', 'giro',       NULL,   18990,  10500,  14990, 13, 12,  0.09, '2025-11-20', NULL),
    ('000301', 'Cámara Aro 29',               'R', 'Maxxis',     NULL,    7990,   3900,   NULL, 64, 30,  0.21, '2025-02-25', NULL),
    ('000302', 'Cadena 11V',                  'R', 'shimano',    NULL,   32990,  21500,   NULL, 11,  8,  0.26, '2025-07-07',  3),
    ('000303', 'Pastillas Freno Disco ',      'R', ' SHIMANO ',  NULL,   12990,   7200,   9990, 27, 20,  0.05, '2025-10-28',  3),
    ('000304', 'Neumático 29x2.2',            'R', 'Maxxis',     NULL,   39990,  26000,   NULL,  5,  8,  0.78, '2026-03-03',  6),
    ('000305', 'pedales plataforma',          'R', 'Wellgo',     NULL,   21990,  12800,   NULL,  0,  5,  0.35, '2026-01-30', NULL);

-- ---------------------------------------------------------------------
-- Tabla t_cliente : clientes registrados (datos ingresados a mano)
-- ---------------------------------------------------------------------
CREATE TABLE t_cliente (
    id                INT UNSIGNED NOT NULL AUTO_INCREMENT,
    rut               VARCHAR(12)  NOT NULL,
    nombre            VARCHAR(40)  NOT NULL,
    apellido          VARCHAR(40)  NOT NULL,
    email             VARCHAR(60)  NULL,
    telefono          VARCHAR(12)  NULL,
    comuna            VARCHAR(40)  NOT NULL,
    fecha_nacimiento  DATE         NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

INSERT INTO t_cliente
    (rut, nombre, apellido, email, telefono, comuna, fecha_nacimiento)
VALUES
    ('12.345.678-5', '  juan ',    'SOTO',          ' JSoto@Gmail.com ',          '+56987654321', 'Temuco',          '1990-04-15'),
    ('15.432.109-K', 'MARÍA',      ' painemal ',    NULL,                         '+56912345678', 'Padre Las Casas', '1985-11-02'),
    ('18.765.432-1', 'pedro',      'Muñoz  ',       'pedro.munoz@outlook.com',    NULL,           'Temuco',          '2001-07-22'),
    ('19.876.543-2', 'Camila',     'rIVAS',         'Camila.Rivas@gmail.com',     '+56955512345', 'Labranza',        '1997-02-28'),
    ('9.876.543-3',  ' TOMÁS ',    'huenchullán',   NULL,                         NULL,           'Vilcún',          '1978-09-09'),
    ('21.234.567-8', 'valentina',  'Fuentes',       'vale.fuentes@yahoo.com ',    NULL,           'Temuco',          '2004-12-05'),
    ('17.654.321-0', 'Diego',      ' CARRASCO ',    'dcarrasco@gmail.com',        '+56944433322', 'Lautaro',         '1993-06-17'),
    ('14.567.890-K', 'fernanda',   'Lagos',         NULL,                         '+56922211100', 'Padre Las Casas', '1988-01-30'),
    ('8.765.432-1',  'IGNACIO',    'Catrileo',      ' IGNACIO.CATRILEO@GMAIL.COM','+56933344455', 'Temuco',          '1969-03-03'),
    ('21.987.654-4', ' josefa',    'MORALES ',      'jmorales@hotmail.com',       NULL,           'Freire',          '2006-08-19');

-- ---------------------------------------------------------------------
-- Tabla t_venta_antigua : ventas importadas desde el sistema antiguo.
-- Todos los datos numéricos y de fecha quedaron guardados como TEXTO.
-- descuento_txt : fracción (0.10 = 10 %)
-- ---------------------------------------------------------------------
CREATE TABLE t_venta_antigua (
    id              INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nro_boleta      VARCHAR(7)   NOT NULL,
    cliente_id      INT UNSIGNED NOT NULL,
    producto_id     INT UNSIGNED NOT NULL,
    precio_txt      VARCHAR(10)  NOT NULL,
    cantidad_txt    VARCHAR(4)   NOT NULL,
    descuento_txt   VARCHAR(5)   NOT NULL,
    fecha_hora_txt  VARCHAR(19)  NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

INSERT INTO t_venta_antigua
    (nro_boleta, cliente_id, producto_id, precio_txt, cantidad_txt, descuento_txt, fecha_hora_txt)
VALUES
    ('0004512',  1,  1, '549990', '1',  '0.10', '2025-09-03 10:15:22'),
    ('0004513',  3,  7, '59990',  '2',  '0.00', '2025-09-03 17:40:05'),
    ('0004514',  4, 12, '7990',   '12', '0.05', '2025-09-10 09:05:48'),
    ('0004515',  2,  2, '289990', '1',  '0.00', '2025-09-21 12:30:00'),
    ('0004516',  6,  8, '24990',  '3',  '0.00', '2025-10-01 19:55:10'),
    ('0004517',  7, 14, '12990',  '10', '0.15', '2025-10-04 11:20:33'),
    ('0004518',  9,  3, '899990', '1',  '0.08', '2025-10-11 16:45:00'),
    ('0004519',  5, 10, '15990',  '4',  '0.00', '2025-10-18 08:50:17'),
    ('0004520',  1, 13, '32990',  '2',  '0.00', '2025-10-25 15:10:40'),
    ('0004521',  8,  4, '119990', '1',  '0.05', '2025-11-02 10:00:00'),
    ('0004522', 10, 11, '18990',  '2',  '0.00', '2025-11-08 18:25:55'),
    ('0004523',  3, 15, '39990',  '2',  '0.10', '2025-11-15 13:35:12');