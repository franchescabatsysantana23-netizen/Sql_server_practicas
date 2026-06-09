/*
Un valor predeterminado no puede eliminarse si no se ha desasociado previamente.
exec sp_unbindefault 'TABLA.CAMPO'; --permite desasociar el valor predeterminado por defecto.
 exec sp_unbindefault 'empleados.sueldo';
 drop default NOMBREVALORPREDETERMINADO; -eliminacion de valor predeterminado. 
*/

if object_id ('empleados') is not null
  drop table empleados;

if object_id ('VP_cero') is not null
   drop default VP_cero;
   go
if object_id ('VP_datodesconocido') is not null
   drop default VP_datodesconocido;

   
create table empleados(
  nombre varchar(30),
  domicilio varchar(30),
  barrio varchar(15),
  sueldo decimal(6,2)
);

go

-- Creamos un valor predeterminado que inserta el valor "0":
create default VP_cero
  as 0;

go

-- Lo asociamos al campo "sueldo":
exec sp_bindefault VP_cero, 'empleados.sueldo';

go

-- Creamos un valor predeterminado con el valor "Desconocido":
create default VP_datodesconocido
  as 'Desconocido';

go
 
-- Lo asociamos al campo "domicilio" y al campo "barrio":
exec sp_bindefault VP_datodesconocido, 'empleados.domicilio';
exec sp_bindefault VP_datodesconocido, 'empleados.barrio';

-- Veamos los valores predeterminados asociados a los campos de la tabla "empleados":
exec sp_helpconstraint empleados;

-- Quitamos la asociación al campo "barrio":
exec sp_unbindefault 'empleados.barrio';

exec sp_helpconstraint empleados;

exec sp_help;

-- Aun no podemos eliminarlo porque está asociado al campo "domicilio",
-- quitamos la asociación y luego lo eliminamos:
exec sp_unbindefault 'empleados.domicilio';

drop default VP_datodesconocido; -- eliminacion de valor predeterminado. 

---Primera Practica

if object_id('libros') is not null
drop table libros


 if object_id ('VP_cero') is not null
   drop default VP_cero;
 if object_id ('VP_desconocido') is not null
   drop default VP_desconocido;
 if object_id ('RG_positivo') is not null
   drop rule RG_positivo;

   exec sp_help VP_cero


    create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(20),
  precio decimal(5,2),
  cantidad smallint
 );
 create rule RG_positivo
 As  @precio >0

 exec sp_bindrule RG_positivo, 'libros.precio'
 exec sp_bindrule RG_positivo, 'libros.cantidad'

 create default VP_cero
 as 0


 drop default VP_cero

 exec sp_helpconstraint VP_cero

 select * from sysobjects
 where xtype ='D'

exec  sp_helptext VP_ceroexec  

exec sp_help VP_cero

exec sp_helpconstraint empleados 
exec sp_unbindefault 'empleados.sueldo'
drop default VP_cero

exec sp_bindefault VP_cero, 'libros.precio'
exec sp_bindefault VP_cero,'libros.cantidad'

create default VP_desconocido 
as 'desconocido'
exec sp_bindefault VP_desconocido,'libros.autor'
exec sp_bindefault VP_desconocido,'libros.editorial'

exec sp_help VP_cero

exec sp_helpconstraint libros

insert into libros (titulo) values('prueba')
exec sp_unbindefault 'libros.precio'
exec sp_unbindefault 'libros.cantidad'
select * from libros

drop default VP_cero

 select * from sysobjects
  where xtype='D' and
  name like '%seccion%';