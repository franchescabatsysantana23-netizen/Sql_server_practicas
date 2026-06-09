/*
las restricciones que se aplican a las tablas, que aseguran valores únicos para cada registro.
Hay 2 tipos: 1) primary key y 2) unique.
una clave primaria para una tabla empleábamos la siguiente sintaxis al crear la tabla,

create table libros(
  codigo int not null,
  titulo varchar(30),
  autor varchar(30),
  editorial varchar(20),
  primary key(codigo)
 );

 Por convención, cuando demos el nombre a las restricciones 
 "primary key" seguiremos el formato "PK_NOMBRETABLA_NOMBRECAMPO".

 SQL Server controla los datos existentes para confirmar que cumplen las exigencias 
 de la restricción, si no los cumple, la restricción no se aplica y aparece un mensaje de error.
 Si ejecutamos el procedimiento almacenado "sp_helpconstraint" junto al nombre de la tabla,
 podemos ver las restricciones "primary key" (y todos los tipos de restricciones) de dicha tabla.

 Un campo "primary key" también acepta una restricción "default" (excepto si es identity),
 pero no tiene sentido ya que el valor por defecto solamente podrá ingresarse una vez; 
 si intenta ingresarse cuando otro registro ya lo tiene almacenado, aparecerá un mensaje de error 
 indicando que se intenta duplicar la clave.
*/

-- contenido del modulo

if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int not null,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  primary key (codigo)
);

go

-- Veamos la restricción "primary key" que creó automáticamente SQL Server:
exec sp_helpconstraint libros;

-- Vamos a eliminar la tabla y la crearemos nuevamente, sin establecer la 
-- clave primaria:
drop table libros;

create table libros(
  codigo int not null,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15)
);

go

-- Definimos una restricción "primary key" para nuestra tabla "libros" 
-- para asegurarnos que cada libro tendrá un código diferente y único:
alter table libros
 add constraint PK_libros_codigo
 primary key(codigo);

-- Veamos la información respecto a ella:
exec sp_helpconstraint libros;

--Primera Practica

if object_id('empleados') is not null
  drop table empleados;

create table empleados (
  documento varchar(8) not null,
  nombre varchar(30),
  seccion varchar(20)
 );

  insert into empleados
  values ('22222222','Alberto Lopez','Sistemas');
 insert into empleados
  values ('23333333','Beatriz Garcia','Administracion');
 insert into empleados
  values ('23333333','Carlos Fuentes','Administracion');
select * from empleados

alter table empleados
add constraint PK_EMPLEADOS_DOCUMENTO
primary key(documento)

delete from empleados

update  empleados 
set documento='23333333'
where documento ='22222222'

alter table empleados
add constraint PK_EMPLEADOS_NOMBRE
primary key(nombre)

INSERT INTO EMPLEADOS DEFAULT VALUES

 insert into empleados
  values (' ','Carlos Fuentes','Administracion');
  
 insert into empleados
  values (DEFAULT,'Carlos Fuentes','Administracion');

   insert into empleados
  values ('00000000','Carlos Fuentes','Administracion');


  SELECT * FROM EMPLEADOS 

  EXEC SP_HELPCONSTRAINT EMPLEADOS

  --Segunda Practica

if object_id('remis') is not null
drop table remis

 create table remis(
  numero tinyint identity,
  patente char(6),
  marca varchar(15),
  modelo char(4)
 );

 insert into remis values('ABC123','Renault 12','1990');
 insert into remis values('DEF456','Fiat Duna','1995');

 select * from remis

 alter table remis
 add constraint PK_REMIS_PATENTE
 primary key(patente)

  alter table remis
 add constraint PK_REMIS_NUMERO
 primary key(numero)

 exec sp_helpconstraint remis