-- parte 1
create database fitzone;
use fitzone;

-- parte 2

create table t_socio
(
    id int primary key,
    rut char(10) not null unique,
    nombres varchar(50) not null,
    apellidos varchar(50) not null,
    email varchar (100) unique,
    telefono char(9),
    comuna varchar(100),
    fecha_nacimiento date,
    socio_vip boolean default 0,
    fecha_inscripcion datetime default CURRENT_TIMESTAMP,
    observaciones text
);

create table t_instructor
(
    id int primary key,
    rut char(12) not null unique,
    nombre varchar(100) not null,
    apellido varchar (100) not null,
    especialidad varchar(100),
    anios_experiencia tinyint,
    sueldo_base decimal(10,2) not null,
    certificado_vigente boolean default 1,
    fecha_hora datetime default current_timestamp
);

create table t_clase
(
    id int primary key,
    id_instructor int,
    nombre_clase varchar(100) not null,
    tipo_clase char(3),
    anio_temporada year,
    cupo_maximo tinyint,
    duracion_minutos int,
    costo_clase decimal(10,2) not null,
    calificacion_promedio float,
    activa boolean default 1,
    descripcion longtext,
    hora_registro datetime default current_timestamp
);

-- PARTE 3 modificacion de estructura

alter table t_socio 
    add direccion varchar(100);

alter table t_instructor
    add telefono_contacto varchar(20);

alter table t_socio
    drop column observaciones;

-- PARTE 4 DML
insert into t_socio(id, rut, nombres, apellidos,email, telefono, comuna, fecha_nacimiento, direccion)
values
(1,"11.111.111-1", "Cristobal", "Ejemplo", "unico_cambiar emaiaaal", "123456789", "tmuco", "2002-02-02", "micasita"),
(2,"21.111.111-1", "Cristobal", "Ejemplo", "unico_cambiar email", "123456789", "tmuco", "2002-02-02", "micasita"),
(3,"31.111.111-1", "Cristobal", "Ejemplo", "unico_cambiar emaiaadasdasdal", "123456789", "tmuco", "2002-02-02", "micasita");


insert into t_instructor(id, rut, nombre, apellido, especialidad, anios_experiencia, sueldo_base, telefono_contacto)
values (1, "11.111.11-1", "Cristobal", "HOLA", "hola", 127, 152.2, "hola"),
(2, "21.111.11-1", "Cristobal", "HOLA", "hola", 127, 152.2, "hola"),
(3, "31.111.11-1", "Cristobal", "HOLA", "hola", 127, 152.2, "hola");

insert into t_clase(id, id_instructor, nombre_clase, tipo_clase, anio_temporada, cupo_maximo, duracion_minutos, costo_clase, calificacion_promedio, descripcion)
values(1, 1, "hola", "waa", 2007, 2, 2, 1.92, 6.7, "hola"),
(2, 2, "hola", "waa", 2007, 2, 2, 1.92, 6.7, "hola"),
(3, 3, "hola", "waa", 2007, 2, 2, 1.92, 6.7, "hola");


update t_clase
set cupo_maximo = 10
where id = 1;

update t_clase 
set costo_clase = costo_clase * 1.1
where tipo_clase = "waa";

delete from t_clase 
where id = 3;

--PARTE 5 CONSULTAS SELECT
select * from t_clase where costo_clase between 1 and 10;

select * from t_socio where nombres like "C%";

select * from t_instructor where especialidad in ("Yoga", "Pilates", "Cossfit");