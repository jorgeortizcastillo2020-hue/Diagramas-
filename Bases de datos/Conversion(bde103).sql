--      Conversion de Texto a Numero

-- Convertin string a entero (resultado: 123)
-- Nota: entre "CAST" y el "(" NO PUEDE HABER NINGUN ESPACIO

SELECT CAST('123' AS SIGNED) AS numero;


-- Convertir string a decimal (resultado : 45.67)
SELECT CAST('45.67' AS DECIMAL(10,2)) AS precio;


--       Conversion de numero a texto

--  numero a string (resultado: '12345')
SELECT CAST(12345 AS CHAR) AS codigo;

-- con longitud especifica (resultado: '789')

SELECT CAST(789 AS CHAR(10)) AS codigo_fijo;



--      Conversion de fechas

-- STRING a Fecha
SELECT CAST('2025-10-13' AS DATE ) AS fecha;

-- Fecha a STRING
SELECT CAST(NOW() AS CHAR) AS fecha_texto;

-- extrae solo la fecha de un datetime (resultado: 2027-09-03)
SELECT CAST('2027-09-03 15:30:00' AS DATE) AS fecha_solo;



