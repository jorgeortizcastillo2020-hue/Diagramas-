-- --ejercicio 1-------
select ciudad from t_estudiante where becado = TRUE order by nombre;

-- --ejercicio 2------
SELECT column_name, data_type, is_nullable, column_default
FROM information_schema.columns
WHERE table_schema = 'idiomas'
 AND table_name = 't_estudiante';

-- ---ejercicio 3------
create view v_curso_online as 
select id, codigo, nivel, hora_inicio, fecha_inicio, cupo, arancel
from t_curso
where modalidad = "Presencial";



-- ---ejercicio 4------
create view v_estudiante_villarrica as
select id, rut, nombre, apellido, telefono, ciudad
from t_estudiante
where ciudad = "Villarrica";

-- --- ejercicio 5 -----
insert into v_estudiante_villarrica(rut, nombre, apellido, telefono, ciudad)
values ("22789456-0", "Maximiliano", "Llancafil", "+56961234525", "Villarrica");

-- -ejercicio 6-----
create table t_sala(
    id smallint unsigned auto_increment PRIMARY KEY,
    nombre varchar(40) not NULL,
    piso tinyint unsigned not null,
    capacidad tinyint UNSIGNED not null,
    proyector boolean not null default false
) auto_increment = 4;

-- -ejercicio 7-----
create table t_solicitud (
    id int UNSIGNED auto_increment PRIMARY KEY,
    nombre varchar(80) not null,
    email varchar(150) not null,
    idioma_id tinyint unsigned not null,
    fecha date not null
); 
SET SESSION auto_increment_increment = 4;
SET SESSION auto_increment_offset = 2;

-- --ejercicio 8 -------
create index i_estudiante_apellido on t_estudiante(apellido);
create index i_curso_fecha_inicio on t_curso(fecha_inicio);

-- --ejercicio 9-----

create index i_matricula_estado on t_matricula (estado, fecha);

-- -- ejercicio 10------
create index i_profesor_apellido on t_profesor(apellido, nombre);