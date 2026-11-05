select schema_name
from information_schema.schemata;

show databases;

-- consultar tablas
select table_name
from information_schema.tables
where table_schema = "esquema";

select column_name,
        data_type,
        is_nullable,
        column_default
from information_schema.columns
where table_schema = "esquema" and
table_name = "t_personal";

desc esquema.t_personal;


select index_name, column_name, non_unique, seq_in_index
from information_schema.statistics
where table_schema = "esquema" and table_name = "t_personal";

show index 
from t_personal
from esquema;


select 
constraint_name,
constraint_type
from information_schema.table_constraints
where
    table_schema = "esquema" and
    table_name = "t_personal";