/*
para eliminar un tipo de datos se puede hacer con sp_droptype.
comando de ejecucion. 
exec sp_droptype TIPODEDATODEFINIDOPORELUSUARIO;
estos datos son almacenados en la tabla "systypes".
ejemplo de consultas para la eliminacion de un tipo de datos:

if exists (select *from systypes
  where name = 'NOMBRETIPODEDATODEFINIDOPORELUSUARIO')
  exec sp_droptype TIPODEDATODEFINIDOPORELUSUARIO;

  ejemplo:
   if exists (select *from systypes
  where name = 'tipo_documento')
  exec sp_droptype tipo_documento;

  no se puede eliminar un tipo de dato que este siendo utilizado por un objeto. 
  si eliminamos el tipo de datos, desaparecen la asociaciones de reglas, valores predeterminados, 
  pero las reglas y valores predeterminados no son eliminados. 
*/
--contenido practico. 

if object_id('alumnos') is not null
  drop table alumnos;

-- Definimos un nuevo tipo de dato llamado "tipo_documento".
-- Primero debemos eliminarlo, si existe, para volver a crearlo:
if exists (select *from systypes
  where name = 'tipo_documento')
  exec sp_droptype tipo_documento;

--Creamos un tipo de dato definido por el usuario llamado "tipo_documento"
-- basado en el tipo "char" que permita 8 caracteres y valores nulos:
exec sp_addtype tipo_documento, 'char(8)', 'null';

-- Eliminamos la regla "RG_documento" si existe:
if object_id ('RG_documento') is not null
   drop rule RG_documento;

go

-- Creamos la regla que permita 8 caracteres que solamente serán dígitos:
create rule RG_documento
  as @documento like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]';

go

-- Asociamos la regla al tipo de datos "tipo_documento":
exec sp_bindrule RG_documento, 'tipo_documento';

-- Creamos la tabla "alumnos":
create table alumnos(
  nombre varchar(30),
  documento tipo_documento
);

-- No podemos eliminar el tipo de dato "tipo_documento" porque hay una
-- tabla "alumnos" que lo utiliza. Entonces eliminamos la tabla:
drop table alumnos;

-- Ahora podemos eliminar el tipo de datos:
exec sp_droptype tipo_documento;

-- Volvemos a crear el tipo de dato:
exec sp_addtype tipo_documento, 'char(8)', 'null';

-- Note que no tiene reglas asociadas:
exec sp_help tipo_documento;

-- Asociamos la regla nuevamente:
exec sp_bindrule RG_documento, 'tipo_documento';


--Practica
--1- eliminar la tabla empleados si esta existe.
if object_id('empleados') is not null
drop table empleados

--2- eliminar el tipo de dato tipo ano si el mismo existe.

if exists
(select * from systypes where name ='tipo_año')
exec sp_droptype tipo_año

--creacion de un tipo de dato definido.

exec sp_addtype tipo_año, int ,'null'

---creacion de una regla. 

if object_id('RG_año') is not null
drop  rule RG_año

--creacion de una regla

create rule RG_año
as @año between 1990 and datepart(year,getdate())

---asociacion de la regla al tipo de datos

exec sp_bindrule RG_año,'tipo_año'

exec sp_help tipo_año

--creacion de la tabla

create table empleados(
documento char(8),
nombre varchar(30),
añoingreso tipo_año )

---insercion de un registros.

insert into empleados values('22222222','Juan Lopez',1980)
insert into empleados values('22222222','Juan Lopez',1990)
--intento de eliminar la regla. 
drop rule RG_año

--desociacion de la regla.

exec sp_unbindrule tipo_año
---eliminacion de la regla. 
drop rule RG_año

insert into empleados values('22222222','Juan Lopez',1980)

---Intente eliminar el tipo de datos "tipo_año":

exec sp_droptype tipo_año


--elimine la tabla 

drop table empleados
--verificacion del tipo de dato.  

exec sp_help tipo_año