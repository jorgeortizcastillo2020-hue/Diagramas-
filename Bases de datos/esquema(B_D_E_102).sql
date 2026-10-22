-- 2-1-2 EJEMPLOS DE CONSULTAS
-- -> CONSULTAS A BASES DE DATOS
-- para obtener una ista de todas las bases de datos en el servidor, se puede utilizar la siguiente consulta.

SELECT schema_name
FROM information_schema.schemata;

-- COMANDO SHOW
-- UNA CONSULTA SIMILAR A LA ANTERIOR ES UTILIZANDO EL COMANDO "SHOW."
SHOW DATABASES;

-- Nota: la sentencia SHOW no esta disponible en todos los DBMS (database management system), es un comando 
-- especifico del dialecto de MySQL y MariaDB, no un estandar universal.

-- CONSULTA TABLAS 
-- PARA LISTAR TODAS LAS TABLAS DENTRO DE LA BASE DE DATOS "MI_BASE_DE_DATOS"

SELECT table_name
FROM information_schema.tables 
WHERE table_schema = "MI_BASE_DE_DATOS";

-- COMO POR EJEMPLO, PARA UNA BASE DE DATOS LLAMADA "ESQUEMA" SERIA ASI...

SELECT table_name 
FROM information_schema.tables
WHERE table_schema="esquema";

-- El comando "SHOW" tambien ofrece una alternativa

USE esquema;
SHOW TABLES;

-- CONSULTAS A columnas
-- para obtener informacion detallada sobre las columnas de una tabla en particular,
-- incluyendo su tipo de dato, si admiten valores nulos y sus valores por defecto,
-- utilice una consulta similar a la siguiente.

SELECT column_name,
       data_type,
       is_nullable,
       column_default
FROM   information_schema.columns 
WHERE  table_schema="MI_BASE_DE_DATOS" AND 
       table_name="MI_TABLA";


-- Por ejemplo

SELECT column_name,
       data_type,
       is_nullable,
       column_default
FROM   information_schema.columns 
WHERE  table_schema="esquema" AND 
       table_name="t_personal";


-- DESCRIBE O DESC: UNA VISTA SIMILAR DE LA ESTRUCTURA DE UNA TABLAS

DESCRIBE MI_BASE_DE_DATOS.MI_TABLA;

-- POR EJEMPLO

DESCRIBE esquema.t_personal;


-- O 

DESC esquema.t_personal;


-- NOTA: La sentencia DESCRIBE (o DESC) No esta disponible en todos los DBMS (database management system),
-- es un comando especifico del dialecto de MySQL Y MariaDB, NO un estandar universal


-- CONSULTAS a Indices: LOS INDICES SON FUNDAMENTALES PARA EL RENDIMIENTO DE LAS CONSULTAS.
-- PARA LISTAR TODOS LOS INDICES DE UNA TABLA, PUEDE CONSULTA LA VISTA "STATISTICS"-

SELECT index_name, column_name, non_unique, seq_in_index
FROM information_schema.statistics 
WHERE table_schema="MI_BASE_DE_DATOS" AND table_name='MI_TABLA';

-- Por ejemplo

SELECT index_name,
       column_name,
       non_unique,
       seq_in_index
FROM  information_schema.statistics
WHERE table_schema='esquema' AND
      table_name='t_personal';


-- El comando "SHOW INDEX" ofrece una salida similar

SHOW INDEX
FROM MI_TABLA
FROM MI_BASE_DE_DATOS; 

-- ejemplo

SHOW INDEX
FROM t_personal
FROM esquema;



-- CONSULTAS A RESTRICCIONES (CONSTRAINTS) 

-- Las restricciones aseguran la integridad de los datos. Para obtener informacion sobre la restricciones
-- de una tabla, como claves primari, claves foraneas y otras, se pueden utilizar las siguientes
-- consultas

-- restricciones de tabla en general

SELECT 
    constraint_name,
    constraint_type
FROM 
   information_schema.table_constraints 
WHERE
   table_schema='MI_BASE_DE_DATOS' AND
   table_name='MI_TABLA';

-- ejemplos

SELECT 
    constraint_name,
    constraint_type
FROM 
   information_schema.table_constraints 
WHERE
   table_schema='esquema' AND
   table_name='t_personal';

-- espacio porque falte a muchas clases que se rellanaran mas tarde







--- fin del espacio



-- ¿Que son los sinonimos en SQL?

-- Lo