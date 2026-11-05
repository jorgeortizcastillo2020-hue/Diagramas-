
SELECT nombre, YEAR(fecha_contratacion) FROM t_empleados 


CALCULO DE SALARIO: muestre el nombre y el salario de cada empleado, dedondeado y sin decimales

SELECT LOWER(nombre), ROUND(salario) FROM t_empleado;

FILTRANDO POR MES DE CONTRATACION: Muestre los datos de los empleado contratados en el mes de marzo

SELECT LOWER(nombre), Lower(apellido), ROUND(salario), fecha_contratacion FROM t_empleado
WHERE MONTH(fecha_contratacion) = 3;

Formate de nombres: mostrar el nombre completo de los empleado en una sola columna con el nombre en mayuscula 
y el apellido en minuscula, separados por un espacio. Además, eliminar los espacio extra de los nombre

SELECT (CONCAT(UPPER(TRIM(nombre)), ' ', LOWER(TRIM(apellido)))) as nombre_completo FROM t_empleado;

Creacion de un Codigo de Empleado : Genere un codigo de empleado que consista en el ID, la primera
letra del nombre y la letra del apellido, todo en mayusculas.

SELECT id, nombre, apellido, CONCAT(id, UPPER((SUBSTRING(TRIM(nombre), 1, 1))),
 UPPER((SUBSTRING(TRIM(apellido), 1, 1))))
AS codigo_empleado FROM t_empleado;

IDEALMENTE:

SELECT id, nombre, apellido,
       UPPER(
        CONCAT(
            id,
            SUBSTRING(TRIM(nombre), 1, 1),
            SUBSTRING(TRIM(apellido), 1, 1)
        )) AS codigo_empleado
from t_empleado; 
       


SELECT producto,
       CAST(precio AS DECIMAL(10,2)) * CAST(cantidad AS SIGNED) AS total 
       FROM t_venta;

-- Mostrar todos los productos VENDIDOS EL SEGUNDO SEMESTRE DEL AÑO 202 (FILTRAR RANGO DE FECHAS)

SELECT id, producto, precio, cantidad, fecha_venta FROM t_venta
WHERE CAST(fecha_venta AS DATE)BETWEEN '2025-07-01' AND '2025-12-31';


