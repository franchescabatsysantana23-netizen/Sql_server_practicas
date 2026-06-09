/*
Tipo de datos 
varchar: se usa para almacenar cadenas de caracteres. Una cadena es una secuencia de caracteres.
integer: se usa para guardar valores numéricos enteros, de -2000000000 a 2000000000 aprox.
float: se usa para almacenar valores numéricos con decimales.
*/


select * from libros

alter table libros modify 
precio float not null , cantidad decimal not null;
insert into libros (titulo,autor,editorial,precio, cantidad)
  values ('El aleph','Borges','Emece',25.50, 100);
insert into libros (titulo,autor,editorial,precio,cantidad)
  values ('Matematica estas ahi','Paenza','Siglo XXI',18.8,200);
insert into libros (titulo,autor,editorial,precio,cantidad)
  values ('Alicia en el pais de las maravillas','Lewis Carroll','Atlantida',10,200);
insert into libros (titulo,autor,editorial,precio,cantidad)
  values ('Alicia en el pais','Lewis Carroll','Atlantida',10,200);


  if object_id('peliculas') is not null drop table peliculas
  select * from peliculas

  create table peliculas(
  nombre varchar(20) not null,
  actor varchar(20) not null,
  duracion integer not null,
  cantidad integer not null)

  select * from peliculas

  insert into peliculas (nombre,actor,duracion,cantidad) values
  ('mision imposible','tom cruise','128',3),
  ('mision imposible 2','tom cruise','130',2),
  ('mujer bonita','julia Roberts','118',3),
  ('elsa y fred','china zorrilla','110',2)

  select * from peliculas

create table empleado(
nombre varchar(20),
documento varchar(8),
sexo varchar(1),
domicilio varchar(30),
sueldobasico float);

insert into empleado values
('Ana Acosta','22335556','f','colon 134',650),
('Bartolome Barrios','27888999','m','Urquiza 479',800)

select * from empleado