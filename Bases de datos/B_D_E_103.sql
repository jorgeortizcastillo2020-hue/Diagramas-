
SELECT nombre, YEAR(fecha_contratacion) FROM t_empleados 


CALCULO DE SALARIO: muestre el nombre y el salario de cada empleado, dedondeado y sin decimales

SELECT LOWER(nombre), ROUND(salario) FROM t_empleado;

FILTRANDO POR MES DE CONTRATACION: Muestre los datos de los empleado contratados en el mes de marzo

SELECT LOWER(nombre), Lower(apellido), ROUND(salario), fecha_contratacion FROM t_empleado
WHERE MONTH(fecha_contratacion) = 3;

Formate de nombres: mostrar el nombre completo de los empleado en una sola columna con el nombre en mayuscula 
y el apellido en minuscula, separados por un espacio. Además, eliminar los espacio extra de los nombre

SELECT (CONCAT(UPPER(TRIM(nombre)), ' ', LOWER(TRIM(apellido)))) as nombre_completo FROM t_empleado;