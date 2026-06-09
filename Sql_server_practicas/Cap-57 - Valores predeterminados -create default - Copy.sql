/*
Los valores predeterminados se asocian con uno o varios campos (o tipos de datos definidos por el usuario);
se definen una sola vez y se pueden usar muchas veces.
 create default NOMBREVALORPREDETERMINADO
  as VALORPREDETERMINADO;
para realizar la vinculacion al campo. 
exec sp_bindefault NOMBRE, 'NOMBRETABLA.CAMPO';

diferencias entre valor prederteminado y valor por default.

-un campo solamente puede tener definida UNA restricción "default", 
un campo solamente puede tener UN valor predeterminado asociado a él,

- una restricción "default" se almacena con la tabla, cuando ésta se elimina, 
 las restricciones también. Los valores predeterminados son objetos diferentes e 
 independientes de las tablas, si eliminamos una tabla, las asociaciones desaparecen,
 pero los valores predeterminados siguen existiendo en la base de datos.

 - una restricción "default" se establece para un solo campo; un valor predeterminado 
 puede asociarse a distintos campos (inclusive, de diferentes tablas).
 -- una restricción "default" no puede establecerse sobre un campo "identity",
 tampoco un valor predeterminado.

 Un campo con un valor predeterminado asociado puede tener reglas asociadas a él y restricciones "check". 


*/

if object_id ('empleados') is not null
  drop table empleados; --elimina la tabla empleados si esta existe.

  --se eliminan los valores por defectos en caso de estos existir. 
  if object_id ('VP_cero') is not null
   drop default VP_cero;
if object_id ('VP_100') is not null
   drop default VP_100;
if object_id ('VP_datodesconocido') is not null
   drop default VP_datodesconocido;
if object_id ('VP_telefono') is not null
   drop default VP_telefono;

   create table empleados(
  nombre varchar(30),
  domicilio varchar(30),
  barrio varchar(15),
  telefono char(14),
  sueldo decimal(6,2)
);

insert into empleados default values;

select * from empleados

create default VP_datodesconocido
  as 'Desconocido';

  exec sp_bindefault VP_datodesconocido, 'empleados.domicilio';
  exec sp_bindefault VP_datodesconocido, 'empleados.barrio';

  exec sp_bindefault VP_datodesconocido, 'empleados.barrio';

  create default VP_cero
  as 0;
create default VP_100
  as 100;

  exec sp_bindefault VP_100, 'empleados.sueldo';

insert into empleados default values;

select * from empleados;

exec sp_helpconstraint empleados;

exec sp_help;

create default VP_telefono
 as '(0000)0-000000';

 exec sp_bindefault VP_telefono,'empleados.telefono';

 
insert into empleados default values;

select * from empleados;

exec sp_helpconstraint empleados;

---Primera Practica 
 if object_id ('clientes') is not null
  drop table clientes;

   if object_id ('VP_legajo_patron') is not null
   drop default VP_legajo_patron;
 if object_id ('RG_legajo_patron') is not null
   drop rule RG_legajo_patron;
 if object_id ('RG_legajo') is not null
   drop rule RG_legajo;
 if object_id ('VP_datodesconocido') is not null
   drop default VP_datodesconocido;
 if object_id ('VP_fechaactual') is not null
   drop default VP_fechaactual;


    create table clientes(
  legajo char(4),
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(15),
  provincia varchar(20) default 'Cordoba',
  fechaingreso datetime
 );

 select * from clientes

 create rule RG_legajo_patron 
 as @legajo between 0 and 2
 
 exec sp_bindrule RG_legajo_patron,'clientes.legajo'
 exec sp_helpconstraint clientes

 ---creacion de un valor predeterminado. 
 create default VP_legajo_patron 
as  'AA00'

--Asociacion del valor defecto al campo. 
exec sp_bindefault VP_legajo_patron,'clientes.legajo'

exec sp_helpconstraint clientes

create default VP_datosdesconocidos
as '??'

exec sp_bindefault VP_datosdesconocidos, 'clientes.domicilio'
go
exec sp_helpconstraint clientes

exec sp_bindefault VP_datosdesconocidos, 'clientes.ciudad'

insert into clientes (legajo) values('AA')

--desvinculacion de un valor predeterminado. 
exec sp_unbindefault  'clientes.legajo'

exec sp_unbindrule 'clientes.legajo'

exec sp_helpconstraint clientes

insert into clientes default values

select * from clientes

exec sp_bindefault VP_datosdesconocidos, 'clientes.provincia'

--creacion de valor por defecto para la fecha. 
create default VP_fechaactual 
as getdate()

exec sp_bindefault VP_fechaactual,'clientes.fechaingreso'

exec sp_helpconstraint clientes
insert into clientes default values

select * from clientes

insert into clientes (fechaingreso) values(getdate())


create rule RG_legajo
  as @valor like 'B%';

 exec sp_bindrule RG_legajo,'clientes.legajo';

 insert into clientes values (default,'Luis Garcia','Colon 876','Cordoba','Cordoba','2001-10-10');
