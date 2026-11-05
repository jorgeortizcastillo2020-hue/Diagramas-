CREATE DATABASE IF NOT EXISTS autoexpress;
USE autoexpress;

DROP TABLE IF EXISTS t_mantencion;
DROP TABLE IF EXISTS t_vehiculo;
DROP TABLE IF EXISTS t_cliente;

-- Parte 2: Creación de tablas
CREATE TABLE t_cliente
(
    id INT PRIMARY KEY,
    rut VARCHAR(10) NOT NULL UNIQUE,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    telefono CHAR(9),
    region TINYINT,
    fecha_nacimiento DATE,
    cliente_frecuente BOOLEAN DEFAULT 0,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    observaciones TEXT
);

CREATE TABLE t_vehiculo
(
    id INT PRIMARY KEY,
    patente VARCHAR(10) NOT NULL UNIQUE,
    marca VARCHAR(20) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    year YEAR,
    tipo_vehiculo VARCHAR(30),
    num_puertas TINYINT,
    kilometraje INT DEFAULT 0,
    capacidad_estanque INT,
    precio_dia DECIMAL(10, 2) NOT NULL,
    consumo_promedio FLOAT,
    disponible BOOLEAN DEFAULT 1,
    descripcion TEXT,
    fecha_ingreso DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE t_mantencion
(
    id INT PRIMARY KEY,
    id_vehiculo INT,
    tipo_mantencion CHAR(3),
    duracion_estimada TIME, 
    costo FLOAT NOT NULL,
    hora_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    resumen TINYTEXT,
    detalle LONGTEXT,
    calificacion_servicio TINYINT
);

-- Parte 3: Alter Table
ALTER TABLE t_cliente
    ADD email_verificado BOOLEAN DEFAULT 0;

ALTER TABLE t_vehiculo
    ADD color TINYTEXT;

-- Si tu versión de MySQL/MariaDB soporta IF EXISTS:
ALTER TABLE t_cliente
    DROP COLUMN IF EXISTS comentarios;

-- Parte 4: DML
-- Punto 6: 5 clientes, omitiendo campos con DEFAULT (cliente_frecuente, fecha_registro, email_verificado)
INSERT INTO t_cliente (id, rut, nombres, apellidos, email, telefono, region, fecha_nacimiento, observaciones) VALUES
(1, '11111111-1', 'Carlos', 'Perez', 'carlos@mail.com', '912345678', 13, '1990-05-12', 'Cliente nuevo'),
(2, '22222222-2', 'Maria', 'Soto', 'maria@mail.com', '923456789', 9, '1985-11-23', 'Sin detalles'),
(3, '33333333-3', 'Juan', 'Valdes', 'juan@mail.com', '934567890', 5, '1998-02-17', 'Recomendado'),
(4, '44444444-4', 'Ana', 'Rojas', 'ana@mail.com', '945678901', 8, '2001-08-30', 'Empresa asociada'),
(5, '55555555-5', 'Pedro', 'Gomez', 'pedro@mail.com', '956789012', 13, '1975-12-01', 'Frecuente');

-- Punto 7: 6 vehículos (especificando columnas para evitar desajustes por el ALTER TABLE)
INSERT INTO t_vehiculo (id, patente, marca, modelo, year, tipo_vehiculo, num_puertas, kilometraje, capacidad_estanque, precio_dia, consumo_promedio, disponible, descripcion, color) VALUES
(1, 'BBCL10', 'Toyota', 'Yaris', 2020, 'Sedan', 4, 45000, 42, 25000.00, 15.5, 1, 'Auto económico', 'Blanco'),
(2, 'CCDD20', 'Hyundai', 'Tucson', 2022, 'SUV', 5, 25000, 54, 45000.00, 12.0, 1, 'Espacioso', 'Gris'),
(3, 'EEFF30', 'Chevrolet', 'Sail', 2019, 'Sedan', 4, 80000, 40, 20000.00, 16.0, 1, 'Uso urbano', 'Rojo'),
(4, 'GGHH40', 'Nissan', 'Qashqai', 2021, 'SUV', 5, 35000, 55, 42000.00, 13.2, 1, 'Familiar', 'Azul'),
(5, 'IIJJ50', 'Ford', 'Ranger', 2023, 'Camioneta', 4, 15000, 80, 55000.00, 10.5, 1, 'Tracción 4x4', 'Negro'),
(6, 'KKLL60', 'Suzuki', 'Swift', 2021, 'Hatchback', 5, 30000, 37, 22000.00, 17.8, 1, 'Compacto', 'Plata');

-- Punto 8: 4 mantenciones asociadas a vehículos existentes
INSERT INTO t_mantencion (id, id_vehiculo, tipo_mantencion, duracion_estimada, costo, resumen, detalle, calificacion_servicio) VALUES
(1, 1, 'PRE', '02:30:00', 45000.0, 'Cambio de aceite', 'Cambio de aceite y filtro de aire sintético', 5),
(2, 2, 'REV', '01:00:00', 25000.0, 'Revisión técnica', 'Inspección de frenos y niveles generales', 4),
(3, 3, 'COR', '04:00:00', 95000.0, 'Reparación frenos', 'Cambio de pastillas y rectificado de discos', 3),
(4, 4, 'PRE', '01:30:00', 35000.0, 'Alineación y balanceo', 'Alineación computarizada tren delantero', 5);

-- Punto 9: Actualizar kilometraje tras un arriendo
UPDATE t_vehiculo
SET kilometraje = kilometraje + 350
WHERE id = 1;

-- Punto 10: Subir precio_dia un 8% a un tipo_vehiculo determinado
UPDATE t_vehiculo
SET precio_dia = precio_dia * 1.08
WHERE tipo_vehiculo = 'SUV';

-- Punto 11: Eliminar registro por condición
DELETE FROM t_mantencion
WHERE id = 1;