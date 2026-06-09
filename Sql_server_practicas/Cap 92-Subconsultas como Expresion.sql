/*
Una subconsulta puede reemplazar una expresión. Dicha subconsulta debe devolver
un valor escalar (o una lista de valores de un campo).

Las subconsultas que retornan un solo valor escalar se utiliza con
un operador de comparación o en lugar de una expresión:

select CAMPOS
  from TABLA
  where CAMPO OPERADOR (SUBCONSULTA);

 select CAMPO OPERADOR (SUBCONSULTA)
  from TABLA;

   select titulo,precio,
  precio-(select max(precio) from libros) as diferencia
  from libros
  where titulo='Uno';

  select titulo,autor, precio
  from libros
  where precio=
   (select max(precio) from libros);


    update TABLA set CAMPO=NUEVOVALOR
  where CAMPO= (SUBCONSULTA);

  delete from TABLA
  where CAMPO=(SUBCONSULTA);

*/

--Practica de los conceptos teoricos

if object_id('libros') is not null
drop table libros

create table libros(
codigo int identity,
titulo varchar(40),
autor varchar(30),
editorial varchar(20),
precio decimal(5,2)
)

go

insert into libros values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',20.00);
insert into libros values('Alicia en el pais de las maravillas','Lewis Carroll','Plaza',35.00);
insert into libros values('Aprenda PHP','Mario Molina','Siglo XXI',40.00);
insert into libros values('El aleph','Borges','Emece',10.00);
insert into libros values('Ilusiones','Richard Bach','Planeta',15.00);
insert into libros values('Java en 10 minutos','Mario Molina','Siglo XXI',50.00);
insert into libros values('Martin Fierro','Jose Hernandez','Planeta',20.00);
insert into libros values('Martin Fierro','Jose Hernandez','Emece',30.00);
insert into libros values('Uno','Richard Bach','Planeta',10.00);

select * from libros 

select titulo, precio, 
precio -(select max(precio) from libros) [diferencia] 
from libros
where titulo ='Uno'

select titulo 'titulo 1', autor, precio 
from libros 
where (precio =(select max(precio) from libros))


update libros 
set precio =45
where precio = (select max(precio) from libros)

select * from libros 

delete from libros 
where (precio =(select min(precio) from libros))

select * from libros 


--Primera Practica

if object_id('alumnos') is not null
drop table alumnos


create table alumnos(
documento char(8),
nombre varchar(30),
nota decimal(4,2),
primary key(documento),
constraint CK_alumnos_notas_valores check(nota>=0 and nota<=10)
)

 insert into alumnos values('30111111','Ana Algarbe',5.1);
 insert into alumnos values('30222222','Bernardo Bustamante',3.2);
 insert into alumnos values('30333333','Carolina Conte',4.5);
 insert into alumnos values('30444444','Diana Dominguez',9.7);
 insert into alumnos values('30555555','Fabian Fuentes',8.5);
 insert into alumnos values('30666666','Gaston Gonzalez',9.70);

 select * from alumnos

 select *  from alumnos
 where nota= (select max(nota) [nota maxima] from alumnos)

  select *  from alumnos
 where nota= (select nombre, max(nota) [nota maxima] from alumnos)

  select alumnos.*
  from alumnos
  where nota=
   (select max(nota) from alumnos);

 select alumnos.* from alumnos

 select cp.* from alumnos cp

 update alumnos 
 set nota =4
 where nota =(select min(nota) from alumnos)

 select * from alumnos

 --- consulta para seleccionar el promedio. 
select alumnos.*,
(select avg(nota) from alumnos)-nota as [diferencia]
from alumnos
where nota<(select avg(nota) from alumnos)

