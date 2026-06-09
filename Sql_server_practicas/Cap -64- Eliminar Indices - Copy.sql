/*
Los índices creados con "create index" se eliminan con "drop index"; la siguiente es la sintaxis básica:

 drop index NOMBRETABLA.NOMBREINDICE;
Eliminamos el índice "I_libros_titulo":

 drop index libros.I_libros_titulo;

 Los índices que SQL Server crea automáticamente al 
 establecer una restricción "primary key" o "unique" no pueden eliminarse con "drop index", 
 se eliminan automáticamente cuando quitamos la restricción.

 if exists (select name from sysindexes
  where name = 'NOMBREINDICE')
   drop index NOMBRETABLA.NOMBREINDICE;

    if exists (select *from sysindexes
  where name = 'I_libros_titulo')
   drop index libros.I_libros_titulo;

*/

if object_id('libros') is not null
drop table libros

create table libros(
codigo int identity,
titulo varchar(40),
autor varchar(30),
editorial varchar(15)
)

create index I_libros_titulo
on libros(titulo)

exec sp_helpindex libros

drop index libros.I_libros_titulo
exec sp_helpindex libros

--Solicitamos que se elimine el índice "I_libros_titulo" si existe:
if exists (select name from sysindexes
  where name = 'I_libros_titulo')
   drop index libros.I_libros_titulo;

   --Primera Practica
   ---eliminacion del objecto alumnos
   if object_id('alumnos') is not null 
   drop table alumnos
   ----creacion de una tabla 
   create table alumnos(
   legajo char(5) not null,
   documento char(8) not null,
   apellido varchar(30),
   nombre varchar(30),
   notafinal decimal(4,2))

   ---creacion de un indice.
   create index I_alumnos_apellido
   on alumnos(apellido)

   ---creacion de una primary key

   alter table alumnos
   add constraint PK_alumnos_legajo
   primary key clustered (legajo)

   --- visualizacion de los indices de una tabla. 
   exec sp_helpindex alumnos
   ----eliminacion de un indice de tipo primary key. 
   drop index PK_alumnos_legajo

   ---eliminacion del indice apellido

   drop index alumnos.I_alumnos_apellido 

   ---eliminacion de un registros del archivo sysindexes. 
   if exists(select name from sysindexes
    where name ='I_alumnos_apellido')
	drop index alumnos.I_alumnos_apellido
 
 --consulta de los indices 
    exec sp_helpindex alumnos

	alter table alumnos
	drop PK_alumnos_legajo

	--visualizacion de las restrinciones de una PK
	exec sp_helpconstraint alumnos

	   if exists(select name from sysindexes
    where name ='I_alumnos_appellido')
	drop index alumnos.I_alumnos_appellido

