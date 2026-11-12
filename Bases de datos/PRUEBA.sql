-- ejercicio 1, ficha de cliente
-- muestre el id de cada cliente y las siguientes columnas, sin espacio sobrante en ninguna de ellas. Ordene el resultado alfabeticamente por apellido (sin espacios sobrantes).

SELECT 
    TRIM(id) AS id_cliente,
    TRIM(nombre) AS nombre,
    TRIM(apellido) AS apellido,
    TRIM(email) AS email,
    TRIM(telefono) AS telefono,
    TRIM(comuna) AS comuna,
    TRIM(fecha_nacimiento) AS fecha_nacimiento
FROM t_cliente
ORDER BY apellido ASC;

-- Ejercicio 2, Codigos de producto y rut
-- GENERE A TRAVES DE UNA INSTRUCCION SLECT UN CODIGO PARA CADA PRODUCTO CON EL FORMATO C-MAR-NNN: la categoria, guion, las tres primeras letras de la marcada sin espacio sobrante y en mayusculas), un gion y los ultimos digitos del sku)

SELECT
   CONCAT(
    TRIM(categoria), '-',
    UPPER(TRIM(SUBSTRING(marca, 1, 3))), '-',
    RIGHT(TRIM(SKU),3))
AS codigo_producto
FROM t_producto;

--Ejercicio 3, precios y cuotas de Bicicletas

SELECT 
    TRIM(nombre) AS nombre_producto,
    TRIM(precio) AS precio_producto
FROM t_producto
ORDER BY nombre_producto ASC;

-- Ejercicio 4, bodega de accesorios y respuestos

SELECT
    TRIM(nombre) AS nombre_producto,
    TRIM(stock) AS stock_producto,
    TRIM(ROUND(peso_kg, 0)) AS peso_total_producto 
FROM t_producto
ORDER BY peso_total_producto DESC;

-- Ejercicio 5, productos inresado en el segundo semestre
-- Muestre todos los productos que ingreasro en  la tienda durante el segundo semestre de 2026, ordene alfabeticamente por nombre

SELECT
    TRIM(nombre) AS nombre_producto,
    TRIM(fecha_ingreso) AS fecha_ingreso_producto
FROM t_producto
WHERE fecha_ingreso BETWEEN '2026-01-01' AND '2026-06-30'
ORDER BY nombre_producto ASC;

-- Ejercicio 6, Cumpleaños de Clientes

SELECT 
    CONCAT(TRIM(nombre), ' ', TRIM(apellido)) AS nombre_cliente,
    TRIM(fecha_nacimiento) as fecha_nacimiento_cliente
FROM t_cliente
ORDER BY rut ASC;

-- EJERCICIO 7, totales de ventas antiguas

SELECT 
    CAST(TRIM(nro_boleta) AS SIGNED) as boleta,
    CAST(TRIM(cantidad_txt) AS SIGNED) as cantidad
FROM t_venta_antigua
WHERE cantidad_txt > 1
;

-- EJERCICIO 8, ventas de alto valor

SELECT
    CAST(TRIM(precio_txt) AS SIGNED) AS precio,
    CAST(TRIM(nro_boleta) AS SIGNED) as boleta,
    TRIM(producto_id) AS producto_id,
    CAST(TRIM(precio_txt) AS SIGNED) AS precio_producto,
    CAST(TRIM(fecha_hora_txt) AS DATE) AS fecha_venta
FROM t_venta_antigua
WHERE CAST(TRIM(precio_txt) AS SIGNED) > 100000
ORDER BY precio_producto DESC;

EJERCICIO 9, ventas de la tarde

SELECT
    CAST(TRIM(precio_txt) AS SIGNED) AS precio,
    CAST(TRIM(nro_boleta) AS SIGNED) as boleta,
    TRIM(producto_id) AS producto_id,
    CAST(TRIM(precio_txt) AS SIGNED) AS precio_producto,
    CAST(TRIM(fecha_hora_txt) AS DATE) AS fecha_venta
FROM t_venta_antigua
WHERE fecha_hora_txt BETWEEN '2025-09-15' AND '2025-10-15' 
ORDER BY fecha_venta DESC;

--EJERCICIO 10 ETIQUETADE DE BICIELTAS LIVIANAS



SELECT
    CONCAT(
        UPPER(TRIM(nombre)), ', ',
        UPPER(TRIM(marca)), ', ',
        TRIM(aro)
    ) AS etiqueta
    FROM t_producto
WHERE categoria ='Bicicleta' 
ORDER By nombre ASC;