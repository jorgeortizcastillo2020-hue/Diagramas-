create database secuencia;
use secuencia;

create table t_usuario(
    id int auto_increment primary key,
    nombre varchar(50),
    email varchar(100)
);

insert into t_usuario(nombre, email)
values ('Fernando Perez', "fp@gmail.com"),
        ("Antonieta Garcia", "ag@gmail.com");

create table t_producto(
    codigo int auto_increment primary key,
    nombre varchar(100),
    precio decimal(10,2)
) auto_increment = 1000;

insert into t_producto(
    nombre, precio) 
values(
    "Notebook", 890000.00),
    ("Mouse", 14990.00);

-- create index nombre_indice on nombre_tabla (columna1, columna2, ...);