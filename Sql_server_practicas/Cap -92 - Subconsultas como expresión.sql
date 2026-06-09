/*
Una subconsulta puede reemplazar una expresión.
Las subconsultas que retornan un solo valor escalar se utiliza con un operador de comparación o en lugar de una expresión:

 select CAMPOS
  from TABLA
  where CAMPO OPERADOR (SUBCONSULTA);

 select CAMPO OPERADOR (SUBCONSULTA)
  from TABLA;
*/

---contenido 

if object_id('libros') is not null
  drop table libros;

  create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20),
  precio decimal(5,2)
);

insert into libros values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',20.00);
insert into libros values('Alicia en el pais de las maravillas','Lewis Carroll','Plaza',35.00);
insert into libros values('Aprenda PHP','Mario Molina','Siglo XXI',40.00);
insert into libros values('El aleph','Borges','Emece',10.00);
insert into libros values('Ilusiones','Richard Bach','Planeta',15.00);
insert into libros values('Java en 10 minutos','Mario Molina','Siglo XXI',50.00);
insert into libros values('Martin Fierro','Jose Hernandez','Planeta',20.00);
insert into libros values('Martin Fierro','Jose Hernandez','Emece',30.00);
insert into libros values('Uno','Richard Bach','Planeta',10.00);

-- Obtenemos el título, precio de un libro específico y la diferencia entre
-- su precio y el máximo valor:

select titulo,precio,
  precio-(select max(precio) from libros) as diferencia
  from libros
  where titulo='Uno';

-- Mostramos el título y precio del libro más costoso:
select titulo,autor, precio
  from libros
  where precio=
   (select max(precio) from libros);

-- Actualizamos el precio del libro con máximo valor:
update libros set precio=45
  where precio=
   (select max(precio) from libros);

-- Eliminamos los libros con precio menor:
delete from libros
  where precio=
   (select min(precio) from libros);


   --Practica

   if object_id('alumnos') is not null
   drop table alumnos
   --creacion del objeto alumnos. 

   create table alumnos(
   documento char(8),
   nombre varchar(30),
   nota decimal(4,2),
   primary key(documento),
   constraint CK_alumnos_nota_valores
   check (nota>=0 and nota<=10))

 insert into alumnos values('30111111','Ana Algarbe',5.1);
 insert into alumnos values('30222222','Bernardo Bustamante',3.2);
 insert into alumnos values('30333333','Carolina Conte',4.5);
 insert into alumnos values('30444444','Diana Dominguez',9.7);
 insert into alumnos values('30555555','Fabian Fuentes',8.5);
 insert into alumnos values('30666666','Gaston Gonzalez',9.70);


 select * from alumnos
 /*
 4- Obtenga todos los datos de los alumnos con la nota más alta, empleando subconsulta.
 */

 select alumnos.* from alumnos
 where nota =(select max(nota) from alumnos)

 /*
 5- Realice la misma consulta anterior pero intente que la consulta interna retorne, además del 
máximo valor de nota, el nombre. 
Mensaje de error, porque la lista de selección de una subconsulta que va luego de un operador de 
comparación puede incluir sólo un campo o expresión (excepto si se emplea "exists" o "in").
 */
 
 select alumnos.* from alumnos
 where nota =(select max(nota),nombre from alumnos)


 /*
 6- Muestre los alumnos que tienen una nota menor al promedio, su nota, y la diferencia con el 
promedio.
 */

 select alumnos.*, (select avg(nota)  from alumnos) -nota [diferencia] from alumnos
 where nota <(select avg(nota) from alumnos)
 /*
 7- Cambie la nota del alumno que tiene la menor nota por 4.
 */

 update alumnos
 set nota=4
 where nota=(select min(nota) from alumnos)

 select * from alumnos 

 /*
 8- Elimine los alumnos cuya nota es menor al promedio.
 */
 delete from alumnos 
 where nota <(select avg(nota) from alumnos)