--sql simple--

select distinct ciudad, nombre from t_cliente;

select codigo, nombre, precio, stock, tipo_luz from t_planta where tipo_luz = "sombra";


select nombre, cargo, fecha_contrato, activo from t_empleado where activo = TRUE order by fecha_contrato;

SELECT schema_name
FROM information_schema.schemata

SHOW DATABASES; 

--- tablas---

SELECT table_name
FROM information_schema.tables
WHERE table_schema = "vivero"; 

show tables;

--- columnas----
SELECT column_name, data_type, is_nullable, column_default
FROM information_schema.columns
WHERE table_schema = 'vivero'
 AND table_name = 't_planta';


 DESCRIBE vivero.t_venta;

select column_name, data_type
from information_schema.columns
where table_schema = "vivero"
 and table_name = "t_cliente" and is_nullable = "YES";


select table_name, column_name, data_type 
from information_schema.columns where table_schema = "vivero"
and data_type in ('date','datetime','timestamp','time','year') order by table_name, column_name;

-- index----

select index_name, column_name, non_unique, seq_in_index
from information_schema.statistics where table_schema = "vivero"
and table_name = "t_venta";

SHOW INDEX FROM t_cliente;

--constaints ----

SELECT constraint_name, constraint_type
FROM information_schema.table_constraints
WHERE table_schema = 'vivero'
 AND table_name = 't_planta';

-- claves foraneas---

SELECT k.constraint_name, k.column_name, k.referenced_table_name, k.referenced_column_name
FROM information_schema.key_column_usage AS k
JOIN information_schema.table_constraints AS t
 ON k.constraint_name = t.constraint_name AND k.table_schema = t.table_schema
WHERE t.constraint_type = 'FOREIGN KEY' AND k.table_schema = 'vivero' AND k.table_name =
't_venta';


--- creacion de vistas simples-----

CREATE VIEW v_planta_interior AS
SELECT id, codigo, nombre, precio, stock
FROM t_planta
WHERE apta_interior = TRUE;
-- consulta de vista --
SELECT * FROM v_planta_interior;

CREATE VIEW v_cliente_temuco AS
SELECT id, rut, nombre, apellido, ciudad, anio_registro
FROM t_cliente
WHERE ciudad = 'Temuco';
SELECT * FROM v_cliente_temuco;



create view planta_stock_critico AS
select id, codigo, nombre, stock
from t_planta 
where stock < 10;


-- actualizar a travez de vistas simples----
UPDATE planta_stock_critico
SET stock = stock + 20
WHERE codigo = 'OR-002';
SELECT * FROM v_planta_stock_critico;
SELECT codigo, nombre, stock FROM t_planta WHERE codigo = 'OR-002';


SELECT * FROM planta_stock_critico;

INSERT INTO v_cliente_temuco (rut, nombre, apellido, ciudad, anio_registro)
VALUES ('22345678-1', 'Martina', 'Ñancupil', 'Temuco', 2026);

SELECT * FROM v_cliente_temuco;



-----creacion de vistas complejas-----

CREATE VIEW v_planta_detalle AS
SELECT p.codigo, p.nombre, c.nombre AS categoria, p.precio, p.stock, p.tipo_luz
FROM t_planta p
INNER JOIN t_categoria c ON p.categoria_id = c.id;


SELECT *
FROM v_planta_detalle
WHERE categoria = 'Árboles nativos'
ORDER BY precio DESC;



create view v_venta_detalle AS
select v.id as venta, v.fecha_hora,
cl.nombre as cliente_nombre, cl.apellido as cliente_apellido, cl.ciudad,
p.nombre as planta, e.nombre as vendedor, v.cantidad, v.precio_unitario, v.cantidad * v.precio_unitario as total
from t_venta v
INNER JOIN t_cliente cl on v.cliente_id = cl.id
INNER JOIN t_planta p on v.planta_id = p.id
INNER JOIN t_empleado e on v.empleado_id = e.id;



CREATE VIEW v_venta_detalle AS
SELECT v.id AS venta, v.fecha_hora,
 cl.nombre AS cliente_nombre, cl.apellido AS cliente_apellido, cl.ciudad,
 p.nombre AS planta, e.nombre AS vendedor,
 v.cantidad, v.precio_unitario,
 v.cantidad * v.precio_unitario AS total
FROM t_venta v
INNER JOIN t_cliente cl ON v.cliente_id = cl.id
INNER JOIN t_planta p ON v.planta_id = p.id
INNER JOIN t_empleado e ON v.empleado_id = e.id;


select table_name, auto_increment
from information_schema.tables 
where table_schema = "vivero"
and table_type = "BASE TABLE";



----AUTO INCREMENT ----

CREATE TABLE t_proveedor
(
 id INT AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(100) NOT NULL,
 ciudad VARCHAR(60),
 telefono CHAR(12)
) AUTO_INCREMENT = 100;


INSERT INTO t_proveedor (nombre, ciudad, telefono) VALUES
('Viveros del Cautín', 'Temuco', '+56452111111'),
('Semillas Araucanía', 'Lautaro', '+56452222222'),
('Sustratos del Sur', 'Osorno', '+56642333333');
SELECT * FROM t_proveedor;




--------------
insert into t_proveedor(nombre, ciudad)
values ("Macetas Llaima", "Cunco");


alter table t_proveedor auto_increment = 500;

insert into t_proveedor (nombre, ciudad)
values("matoto", "hola");

select * from t_proveedor;




create table t_despacho(
    id int AUTO_INCREMENT PRIMARY KEY,
    venta_id BIGINT UNSIGNED NOT NULL,
    direccion varchar(150) not NULL,
    fecha date not NULL
);

SET SESSION auto_increment_increment = 4;
SET SESSION auto_increment_offset = 5;

SET SESSION auto_increment_increment = 1;
SET SESSION auto_increment_offset = 1;


-- indeces no unicos---

SHOW INDEX FROM t_planta;


CREATE INDEX i_planta_nombre ON t_planta (nombre);


SELECT index_name, column_name, non_unique
FROM information_schema.statistics
WHERE table_schema = 'vivero'
 AND table_name = 't_planta';

 create index i_cliente_ciudad on t_cliente(ciudad);




 CREATE INDEX i_empleado_apellido_nombre ON t_empleado (apellido, nombre);
SELECT index_name, column_name, seq_in_index
FROM information_schema.statistics
WHERE table_schema = 'vivero'
 AND table_name = 't_empleado'
 AND index_name = 'i_empleado_apellido_nombre';
