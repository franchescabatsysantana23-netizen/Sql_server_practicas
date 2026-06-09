/*
La palabra clave "top" se emplea para obtener sólo una cantidad limitada de registros, los primeros n registros de una consulta.
Cuando se combina con "order by" es posible emplear también la cláusula "with ties". Esta cláusula permite incluir en la selección, 
todos los registros que tengan el mismo valor del campo por el que se ordena en la última posición.
Ejemplo:
select top 2 * from libros;
select top 3 with ties
  * from libros
  order by autor;
*/

if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(20),
  editorial varchar(20)
);
insert into libros values ('Uno','Richard Bach','Planeta');
insert into libros values ('El aleph','Borges','Emece');
insert into libros values ('Alicia en el pais...','Carroll','Planeta');
insert into libros values ('Aprenda PHP','Mario Molina','Siglo XXI');
insert into libros values ('Java en 10 minutos','Mario Molina','Siglo XXI');
insert into libros values ('Java desde cero','Mario Molina','Emece');
insert into libros values ('Ilusiones','Richard Bach','Planeta');

select * from libros

select top 2 * from libros
select top 3 titulo, autor 
from libros
order by autor

select top 3 with ties titulo, autor
from libros 
order by autor

select top 50 percent * 
from libros insert into empleados
  values ('22222222','Alberto Lopez','c','Sistemas');
 insert into empleados
  values ('23333333','Beatriz Garcia','c','Administracion');
 insert into empleados
  values ('24444444','Carlos Fuentes','s','Administracion');
 insert into empleados
  values ('25555555','Daniel Garcia','s','Sistemas');
 insert into empleados
  values ('26666666','Ester Juarez','c','Sistemas');
 insert into empleados
  values ('27777777','Fabian Torres','s','Sistemas');
 insert into empleados
  values ('28888888','Gabriela Lopez',null,'Sistemas');
 insert into empleados
  values ('29999999','Hector Garcia',null,'Administracion');
order by autor

---Primera Practica 

 if object_id('empleados') is not null
  drop table empleados;

 create table empleados (
  documento varchar(8) not null,
  nombre varchar(30),
  estadocivil char(1),--c=casado, s=soltero,v=viudo
  seccion varchar(20)
 );
  insert into empleados
  values ('22222222','Alberto Lopez','c','Sistemas');
 insert into empleados
  values ('23333333','Beatriz Garcia','c','Administracion');
 insert into empleados
  values ('24444444','Carlos Fuentes','s','Administracion');
 insert into empleados
  values ('25555555','Daniel Garcia','s','Sistemas');
 insert into empleados
  values ('26666666','Ester Juarez','c','Sistemas');
 insert into empleados
  values ('27777777','Fabian Torres','s','Sistemas');
 insert into empleados
  values ('28888888','Gabriela Lopez',null,'Sistemas');
 insert into empleados
  values ('29999999','Hector Garcia',null,'Administracion');

  select * from empleados

  /*
4- Muestre los 5 primeros registros (5 registros)
5- Muestre nombre y seccion de los 4 primeros registros ordenados por sección (4 registros)
6- Realice la misma consulta anterior pero incluya todos los registros que tengan el mismo valor en 
"seccion" que el último (8 registros)
7- Muestre nombre, estado civil y seccion de los primeros 4 empleados ordenados por estado civil y 
sección (4 registros)
8- Realice la misma consulta anterior pero incluya todos los valores iguales al último registro 
retornado (5 registros)
  */

  select top 5 * from empleados

  select top 4 nombre, seccion from empleados
  order by seccion

    select top 4 with ties nombre, seccion from empleados
  order by seccion

  select top 4 nombre, estadocivil, seccion from empleados
  order by estadocivil,seccion

  
  select top 4 with ties nombre, estadocivil, seccion from empleados
  order by estadocivil,seccion