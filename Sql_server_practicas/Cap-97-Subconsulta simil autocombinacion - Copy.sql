/*
algunas sentencias en las cuales la consulta interna y la externa emplean la misma tabla pueden reemplazarse por una autocombinacion.
una lista de libros que han sido publicados por distintas editoriales. 
select distinct l1.titulo
  from libros as l1
  where l1.titulo in
  (select l2.titulo
    from libros as l2 
    where l1.editorial <> l2.editorial);






if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20),
  precio decimal(5,2)
);

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

-- Obtenemos la lista de los libros que han sido publicados por distintas editoriales
--  empleando una consulta correlacionada:
 select distinct l1.titulo
  from libros as l1
  where l1.titulo in
  (select l2.titulo
    from libros as l2 
    where l1.editorial <> l2.editorial);

-- El siguiente "join" retorna el mismo resultado:
select distinct l1.titulo
  from libros as l1
  join libros as l2
  on l1.titulo=l2.titulo
  where l1.editorial<>l2.editorial;

-- Buscamos todos los libros que tienen el mismo precio
-- que "El aleph" empleando subconsulta:
select titulo
  from libros
  where titulo<>'El aleph' and
  precio =
   (select precio
     from libros
     where titulo='El aleph');

-- Obtenemos la misma salida empleando "join":
select l1.titulo
  from libros as l1
  join libros  as l2
  on l1.precio=l2.precio
  where l2.titulo='el aleph' and
  l1.titulo<>l2.titulo;

-- Buscamos los libros cuyo precio supera el precio promedio 
-- de los libros por editorial:
select l1.titulo,l1.editorial,l1.precio
  from libros as l1
  where l1.precio >
   (select avg(l2.precio) 
   from libros as l2
    where l1.editorial= l2.editorial);

-- Obtenemos la misma salida pero empleando un "join" con "having":
 select l1.editorial,l1.titulo,l1.precio
  from libros as l1
  join libros as l2
   on l1.editorial=l2.editorial
   group by l1.editorial, l1.titulo, l1.precio
   having l1.precio > avg(l2.precio);


*/

---Contenido Practico
--Eliminacion del objeto deportes. 
if object_id('deportes') is not null
drop table deportes

create table deportes(
nombre varchar(15),
profesor varchar(30),
dia varchar(10),
cuota decimal(5,2))
--insercion de los distintos registros. 

 insert into deportes values('tenis','Ana Lopez','lunes',20);
 insert into deportes values('natacion','Ana Lopez','martes',15);
 insert into deportes values('futbol','Carlos Fuentes','miercoles',10);
 insert into deportes values('basquet','Gaston Garcia','jueves',15);
 insert into deportes values('padle','Juan Huerta','lunes',15);
 insert into deportes values('handball','Juan Huerta','martes',10);

 select * from deportes

 /*
 4- Muestre los nombres de los profesores que dictan más de un deporte empleando subconsulta
 */

 select nombre, profesor from deportes 
 order by nombre

 
 
 (select count(profesor) from deportes 
         group by profesor 
		 having count(*) >1)