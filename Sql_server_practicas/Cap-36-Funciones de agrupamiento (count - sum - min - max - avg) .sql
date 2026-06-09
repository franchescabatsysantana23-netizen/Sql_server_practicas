/*

Las relaciones entre las funciones de agrupamiento y los tipos de datos es la siguiente:
- count: se puede emplear con cualquier tipo de dato.
- min y max: con cualquier tipo de dato.
- sum y avg: sólo en campos de tipo numérico.
La función "sum()" retorna la suma de los valores que contiene el campo especificado
Para averiguar el valor máximo o mínimo de un campo usamos las funciones "max()" y "min()" respectivamente.
La función "avg()" retorna el valor promedio de los valores del campo especificado.
*/

if object_id('libros') is not null
drop table libros
create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(30) default 'Desconocido',
  editorial varchar(15),
  precio decimal(5,2),
  cantidad tinyint,
  primary key(codigo)
);
go

insert into libros
  values('El aleph','Borges','Planeta',15,null);
insert into libros
  values('Martin Fierro','Jose Hernandez','Emece',22.20,200);
insert into libros
  values('Antologia poetica','J.L. Borges','Planeta',null,150);
insert into libros
  values('Aprenda PHP','Mario Molina','Emece',18.20,null);
insert into libros
  values('Cervantes y el quijote','Bioy Casares- J.L. Borges','Paidos',null,100);
insert into libros
  values('Manual de PHP', 'J.C. Paez', 'Siglo XXI',31.80,120);
insert into libros
  values('Harry Potter y la piedra filosofal','J.K. Rowling',default,45.00,90);
insert into libros
  values('Harry Potter y la camara secreta','J.K. Rowling','Emece',46.00,100);
insert into libros (titulo,autor,cantidad)
  values('Alicia en el pais de las maravillas','Lewis Carroll',220);
insert into libros (titulo,autor,cantidad)
  values('PHP de la A a la Z',default,0);

  select * from libros
  select sum(cantidad) [Total Libros] from libros
   select sum(cantidad)
  from libros
  where editorial='Emece';
   select max(precio)
  from libros;
   select min(precio)
  from libros
  where autor like '%Rowling%';
  select avg(precio)
  from libros
  where titulo like '%PHP%';

  ---Primera Practica
 if object_id('empleados') is not null
  drop table empleados;
  /*Creaccion  de tabla empleados */
 create table empleados(
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  seccion varchar(20),
  sueldo decimal(6,2),
  cantidadhijos tinyint,
  primary key(documento)
 );
 /*Insercion de Registros...*/
 select * from empleados
  insert into empleados
  values('Juan Perez','22333444','Colon 123','Gerencia',5000,2);
 insert into empleados
  values('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0);
 insert into empleados
  values('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1);
 insert into empleados
  values('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3);
 insert into empleados
  values('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0);
 insert into empleados
  values('Yolanda Perez','35111222','Colon 180','Administracion',3200,1);
 insert into empleados
  values('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3);
 insert into empleados
  values('Martina Rodriguez','30141414','Sarmiento 1234','Administracion',3800,4);
 insert into empleados
  values('Andres Costa','28444555',default,'Secretaria',null,null);

  /*
  4- Muestre la cantidad de empleados usando "count" (9 empleados)
5- Muestre la cantidad de empleados con sueldo no nulo de la sección "Secretaria" (2 empleados)
6- Muestre el sueldo más alto y el más bajo colocando un alias (5000 y 2000)
7- Muestre el valor mayor de "cantidadhijos" de los empleados "Perez" (3 hijos)	
8- Muestre el promedio de sueldos de todo los empleados (3400. Note que hay un sueldo nulo y no es 
tenido en cuenta)
9- Muestre el promedio de sueldos de los empleados de la sección "Secretaría" (2100)
10- Muestre el promedio de hijos de todos los empleados de "Sistemas" (2)  
  */
  select * from empleados

  select count(*) as [Total Registros] from empleados
  select COUNT(sueldo) from empleados
  where seccion like '%secre%'

  select min(sueldo) [Sueldo Minimo],max(sueldo) [Sueldo Maximo] from empleados

  select max(cantidadhijos) [Hijos Maximos] from empleados 
  where nombre like '%Perez%'

  select avg(sueldo) [Promedio Empleados] from empleados 
  select avg(sueldo) [Promedio Secretaria] from empleados
  where seccion like '%Secre%'
  
  select avg(cantidadhijos) 'promedio' from empleados 
  where seccion like '%Sis%'