/*

Empleando la opción "drop_existing" junto con "create index" permite regenerar un índice, con ello evitamos eliminarlo
y volver a crearlo. La sintaxis es la siguiente:

 create TIPODEINDICE index NOMBREINDICE
 on TABLA(CAMPO)
 with drop_existing;

 - tipo: cambiándolo de no agrupado a agrupado (siempre que no exista uno agrupado para la misma tabla). 
 - campo: se puede cambiar el campo por el cual se indexa, agregar campos, eliminar algún campo de un índice compuesto.
 - único: se puede modificar un índice para que los valores sean únicos o dejen de serlo.

  create nonclustered index I_libros
 on libros(titulo);

  create clustered index I_libros
 on libros(titulo)
 with drop_existing;

  create clustered index I_libros
 on libros(titulo,editorial)
 with drop_existing;

*/

if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15)
);

go

-- Creamos un índice no agrupado para el campo "titulo":
create nonclustered index I_libros_titulo
 on libros(titulo);

exec sp_helpindex libros;

-- Vamos a agregar el campo "autor" al índice "I_libros_titulo"
-- y vemos si se modificó:
create index I_libros_titulo
 on libros(titulo,autor)
 with drop_existing;

exec sp_helpindex libros;

-- Lo convertimos en agrupado:
create clustered index I_libros_titulo
 on libros(titulo,autor)
 with drop_existing;

exec sp_helpindex libros;

-- Quitamos un campo "autor":
create clustered index I_libros_titulo
 on libros(titulo)
 with drop_existing;

exec sp_helpindex libros;


---Primera Practica

if object_id('alumnos') is not null
drop table alumnos

create table alumnos(
  legajo char(5) not null,
  documento char(8) not null,
  apellido varchar(30),
  nombre varchar(30),
  notafinal decimal(4,2)
 );

 select * from alumnos 

 create nonclustered index I_alumnos_legajo
 on alumnos(legajo)

 --visualizacion de los indices relacionados a la tabla alumnos. 
 exec sp_helpindex alumnos

 create nonclustered index I_alumnos_legajo
 on alumnos(legajo, nombre)
 with drop_existing

  exec sp_helpindex alumnos

  create clustered index UQ_alumnos_documento
  on alumnos(documento)
  with drop_existing 
 
 alter table alumnos 
 add constraint UQ_alumnos_legajo
 unique nonclustered(legajo)

exec sp_helpindex alumnos

 
create clustered index UQ_alumnos_legajo
on alumnos(legajo)
with drop_existing

 alter table alumnos 
 add constraint UQ_alumnos_legajo
 unique clustered(legajo)

create nonclustered index I_alumnos_legajo
  on alumnos(legajo)
  with drop_existing;

   create nonclustered index I_alumnos_nombres
 on alumnos(apellido, nombre)
 with drop_existing


    create nonclustered index I_alumnos_nombres
 on alumnos(apellido)
 with drop_existing

 create nonclustered index I_alumnos_legajo
  on alumnos(legajo)
  with drop_existing;

  exec sp_helpindex alumnos