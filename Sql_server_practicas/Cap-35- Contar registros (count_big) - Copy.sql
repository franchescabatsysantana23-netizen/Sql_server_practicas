/*
Retorna la cantidad de registros. Es similar a la función "count(*)", la diferencia es que
"count_big" retorna un valor "bigint" y "count", un "int".
"count_big(*)" cuenta la cantidad de registros de una tabla, incluyendo los valores nulos y duplicados.
"count_big(CAMPO)" retorna la cantidad de registros cuyo valor en el campo especificado entre 
paréntesis no es nulo.
"count_big(distinct CAMPO)" retorna la cantidad de registros cuyo valor en el campo especificado 
no es nulo, sin considerar los repetidos.
*/

select COUNT_BIG(*) from libros
select * from libros

if object_id ('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  primary key(codigo)
);

insert into libros values('El aleph','Borges','Emece',15.90);
insert into libros values('Antología poética','Borges','Planeta',null);
insert into libros values('Alicia en el pais de las maravillas','Lewis Carroll',null,19.90);
insert into libros values('Matematica estas ahi','Paenza','Siglo XXI',15);
insert into libros values('Martin Fierro','Jose Hernandez',default,40);
insert into libros values('Aprenda PHP','Mario Molina','Nuevo siglo',null);
insert into libros values('Uno','Richard Bach','Planeta',20);

select * from libros 

select count_big(*)
  from libros;

select count_big(*)
  from libros
  where editorial='Planeta';

select count_big(precio)
  from libros;

-- Contamos las editoriales (sin repetir):
select count_big(distinct editorial)
  from libros;

  ---Primera Practica

  if object_id('medicamentos') is not null
  drop table medicamentos

   create table medicamentos(
  codigo int identity,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(6,2),
  cantidad tinyint,
  fechavencimiento datetime not null,
  numerolote int default null,
  primary key(codigo)
 );

  insert into medicamentos
  values('Sertal','Roche',5.2,1,'2015-02-01',null);
 insert into medicamentos 
  values('Buscapina','Roche',4.10,3,'2016-03-01',null);
 insert into medicamentos 
  values('Amoxidal 500','Bayer',15.60,100,'2017-05-01',null);
 insert into medicamentos
  values('Paracetamol 500','Bago',1.90,20,'2018-02-01',null);
 insert into medicamentos 
  values('Bayaspirina',null,2.10,null,'2019-12-01',null); 
  insert into medicamentos 
  values('Amoxidal jarabe','Bayer',null,250,'2019-12-15',null);
  
  select COUNT_BIG(*) from medicamentos
  select distinct (COUNT_BIG( cantidad)) from medicamentos

  select COUNT_BIG(precio) [Total Precio], COUNT_BIG(cantidad) 'Total Cantidad' from medicamentos
 select *  from medicamentos