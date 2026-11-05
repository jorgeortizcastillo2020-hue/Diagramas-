create view v_empleado_alto_salario AS 
select id, nombre, salario
from t_empleado
where salario > 100000;

create view v_empleado_nuevo AS 
select nombre, fecha_Contrato, salario
from t_empleado
where year(fecha_contrato) = year(curdate());:

create view v_empleado_detalle AS
select e.id,
e.nombre,
e.salario,
d.nombre as departamento
from t_empleado e
inner join t_departamento d 
on e.departamento_id = d.id;

select * from v_empleado_alto_salario;

insert into v_empleado_alto_salario(id,nombre,salario)
values(151,"Juan Perez", 1550000);

update v_empleado_alto_salario 
set salario = salario * 1.1
where id = 13;

delete from v_empleado_alto_salario
where salario < 1100000;

drop view v_empleado_alto_salario;
/*
create sequence sq_producto
start with 100
increment by 1 
maxvalue 1;
*/


create table t_usuario
(
    id int auto_increment
)