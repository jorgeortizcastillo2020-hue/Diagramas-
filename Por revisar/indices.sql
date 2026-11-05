drop table if exists t_empleado;
create table t_empleado(
    id int auto_increment primary key,
    nombre varchar(100),
    apellido varchar(100),
    departamento varchar(50),
    fecha_contratacion date
);
drop table if exists t_producto;
create table t_producto(
    id int auto_increment primary key,
    nombre varchar(255),
    categoria varchar(100),
    precio int,
    stock int
);

create index i_apellido on t_empleado(apellido);

show index from t_empleado;

select * from t_producto where categoria = "Congelados";

create index i_categoria on t_producto(categoria);
show index from t_producto;

drop table if exists t_cliente;
create table t_cliente(
    id int auto_increment primary key,
    nombre varchar(100),
    ciudad varchar(100),
    fecha_registro date
);

show index from t_cliente;

create index i_ciudad on t_cliente(ciudad);

show index from t_cliente;

drop index i_ciudad on t_cliente;