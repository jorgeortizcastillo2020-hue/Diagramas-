SELECT
    nombre,
    CASE talla
       WHEN 'S' THEN 'pequeña'
       WHEN 'M' THEN 'Mediana'
       WHEN 'L' THEN 'Grande'
       ELSE 'Desconocida'
    END AS descripcion_talla
FROM t_ropa;




SELECT
    apellido,
    salario,
    CASE
       WHEN salario <500000 THEN 'Bajo'
       WHEN salario BETWEEN 500000 AND 1000000 THEN 'Medio'
       WHEN salario >1000000 THEN 'Alto'
       ELSE 'No  Especificado'
    END AS rango_salarial
FROM t_personal;




SELECT
    apellido,
    IFNULL (departamento, 'Sin departamaneto') AS contacto
FROM t_personal;



SELECT 
    nombreproducto,
    NULLIF (stock, 0) AS cantidad_valida
FROM t_producto;


SELECT
    nombre,
    COALESCE (email,celular,'sin contacto') AS contacto_disponible
FROM t_usuario;


SELECT * FROM t_producto;

SELECT 
    nombreproducto AS Producto,
    precio,
    stock,
    CASE
       WHEN stock <10 THEN 'Critico'
       WHEN stock BETWEEN 10 AND 50 THEN 'Bajo'
       WHEN stock BETWEEN 51 AND 100 THEN 'Normal'
       WHEN stock >100 THEN 'ALTO'
       ELSE 'Error'
    END AS Estado_Stock,
    CASE
       WHEN stock <10 THEN 'URGENTE: reabastecer'
       WHEN stock BETWEEN 10 AND 50 THEN 'OK'
       WHEN stock BETWEEN 51 AND 100 THEN 'OK'
       WHEN stock >100 THEN 'OK'
    END AS Alerta
FROM t_producto;


SELECT 
    nombreproducto AS Producto,
    precio,
    stock,
    CASE
       WHEN stock <10 THEN 'Critico'
       WHEN stock BETWEEN 10 AND 50 THEN 'Bajo'
       WHEN stock BETWEEN 51 AND 100 THEN 'Normal'
       WHEN stock >100 THEN 'ALTO'
       ELSE 'Error'
    END AS Estado_Stock,
    IF(stock < 10, 'URGENTE:Reabastecer', 'OK') AS Alerta_Stock
FROM t_producto;