
/*muestra las tablas creadas por los usuarios */
exec sp_tables @table_owner='dbo'
use bd1 ---> para usar la bases de datos bd1

/*exec sp_columns +nombreTabla --> nos permite visualizar la estructura de una tabla. */
exec sp_columns usuarios
/*drop table +nombreTabla --> nos permite eliminar una tabla por completo. */

/*evalua el objeto si existe lo elimina, si no envia un mensaje de error. */
if object_id('usuarioss') is not null
  drop table usuarios
  drop table usuarioss
  select * from usuarios

  // nos permite crear una bases de datos
  create database bd1

  /*creacion de la tabla usuarios */
  create table usuarios(
  nombre varchar(20),
  clave varchar(10));

  -------Practicas SQL
  if object_id('agenda') is not null drop table agenda
  drop table Agenda
  create table Agenda(
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11))

  /*para visualizar la estructura de la tabla agenda*/
  exec sp_columns Agenda
  exec sp_tables @table_owner ='dbo'
  select * from Agenda

  if object_id('libros') is not null drop table libros
  exec sp_tables @table_owner ='dbo' /*podemos verificar si existe una tabla*/

  /* crear tabla libros.*/
    exec sp_tables @table_owner ='dbo' ---> permite visualizar las tablas ya existentes. 
  create table libros(
  titulo varchar(20),
  autor varchar(30),
  editorial varchar(15))

  drop table libros /*permite eliminar la tabla libros */

  insert into libros (titulo,autor,editorial) values 
  ('pepito','pepito','susaeta'),
  (' juancito','perez','santillana'),
  (' cuento de juancito2','pepito manuel ','susaeta'),
  (' de juancito1 ','juancito1','susaeta')

  select * from libros
  select * from agenda
  /*visualizacion de tablas existentes */
  exec sp_tables @table_owner ='dbo'

  insert into agenda (apellido,nombre,domicilio, telefono)
  values('santana','franchesca','maria montez 339','8097071181'),
        ('liriano ','batsy','maria montez 339','8097562345'),
		('Moreno','Alberto','Colon 123','4234567'),
		('Torres','Juan','Avellaneda 135','4458787')

	/*insert con select de un campo en especifico*/
	/* insert mezclando values e select */
		insert into libros (titulo , autor,editorial) values 
		('la auroroa',(select 
		nombre from agenda where nombre ='Juan'),'susaeta')
		select * from libros
		select * from agenda


		/* otra forma de realizar inserciones */

		select * from libros

		INSERT INTO OtraDB..UnaTablaX (
    [nombre],
    [apellido],
    [region],
    [ciudad]
)
SELECT
    p.[nombre],
    p.[apellido],
    r.[value],
    c.[value]
FROM
    UnaDB..Persona p
    INNER JOIN UnaDB.Regiones r ON r.[id] = p.[regionId]
    INNER JOIN UnaDB.Ciudades c ON c.[id] = p.[ciudadId]
WHERE 
    p.[id] = 1


	 insert into libros (titulo,autor,editorial)
  values ('El aleph','Borges','Planeta');
 insert into libros (titulo,autor,editorial) 
  values ('Martin Fierro','Jose Hernandez','Emece');
 insert into libros (titulo,autor,editorial)
  values ('Aprenda PHP','Mario Molina','Emece');

  select * from libros