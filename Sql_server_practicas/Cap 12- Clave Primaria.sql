if object_id('libros') is not null
drop table libros

select * from libros
create table libros(
codigo int not null,
titulo varchar(40),
autor varchar(20),
editorial varchar(15),
primary key(codigo))

insert into libros (codigo,titulo,autor,editorial) values
(1,'El aleph','Borges','Emece'),
(2,'Martin Fierro','Jose Hernandez','Planeta'),
(3,'Aprenda PHP','Mario Molina','Nuevo Siglo')

select * from libros

insert into libros (codigo,titulo,autor,editorial) values
(null,'El aleph','Borges','Emece')

update libros 
set codigo =1
where titulo ='Martin Fierro'

---Segundo Ejercicio

if object_id('alumnos') is not null
drop table alumnos

create table alumnos(
legajo varchar(4) not null,
documento varchar(8),
nombre varchar(30),
domicilio varchar(30),
primary key(documento),
primary key(legajo))


create table alumnos(
legajo varchar(4) not null,
documento varchar(8),
nombre varchar(30),
domicilio varchar(30),
primary key(documento),
)
select * from alumnos
exec sp_columns alumnos

insert into alumnos (legajo,documento,nombre,domicilio)
  values('A233','22345345','Perez Mariana','Colon 234');
 insert into alumnos (legajo,documento,nombre,domicilio)
  values('A567','23545345','Morales Marcos','Avellaneda 348');


   insert into alumnos (legajo,documento,nombre,domicilio)
  values('A567','23545345','Morales Marcos','Avellaneda 348');

   insert into alumnos (legajo,documento,nombre,domicilio)
  values('A567',null,'Morales Marcos','Avellaneda 348');

  select * from medicamentos



