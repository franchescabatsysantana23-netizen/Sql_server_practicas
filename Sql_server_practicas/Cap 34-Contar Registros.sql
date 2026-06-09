/*
La función "count()" cuenta la cantidad de registros de una tabla, incluyendo los que tienen valor nulo.
*/

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

go

insert into libros
  values('El aleph','Borges','Emece',15.90);
insert into libros
  values('Antología poética','J. L. Borges','Planeta',null);
insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll',null,19.90);
insert into libros
  values('Matematica estas ahi','Paenza','Siglo XXI',15);
insert into libros
  values('Martin Fierro','Jose Hernandez',default,40);
insert into libros
  values('Aprenda PHP','Mario Molina','Nuevo siglo',null);
insert into libros
  values('Uno','Richard Bach','Planeta',20);

  select * from libros

  select count(*) from libros
  select count(*) from libros 
  where editorial ='Planeta'
  select count(precio) from libros

  ---Practica 
 if object_id('medicamentos') is not null
  drop table medicamentos;

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

  select * from medicamentos
  select count(*) from medicamentos
  select count(laboratorio) from medicamentos
  select count(*) [total] from medicamentos 
  where (precio is not null) and (cantidad is not null)

  select count(precio),count(cantidad) from medicamentos

  select count(precio) [conocidos] from medicamentos 
  where laboratorio like 'B%'
  select count(numerolote) [total] from medicamentos

