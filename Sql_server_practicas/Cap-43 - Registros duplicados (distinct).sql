/*
Con la cláusula "distinct" se especifica que los registros con ciertos datos duplicados sean obviadas en el resultado

*/

if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  primary key(codigo)
);

insert into libros
  values('El aleph','Borges','Planeta');
insert into libros
  values('Martin Fierro','Jose Hernandez','Emece');
insert into libros
  values('Martin Fierro','Jose Hernandez','Planeta');
insert into libros
  values('Antologia poetica','Borges','Planeta');
insert into libros
  values('Aprenda PHP','Mario Molina','Emece');
insert into libros
  values('Aprenda PHP','Lopez','Emece');
insert into libros
  values('Manual de PHP', 'J. Paez', null);
insert into libros
  values('Cervantes y el quijote',null,'Paidos');
insert into libros
  values('Harry Potter y la piedra filosofal','J.K. Rowling','Emece');
insert into libros
  values('Harry Potter y la camara secreta','J.K. Rowling','Emece');
insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos');
insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll','Planeta');
insert into libros
  values('PHP de la A a la Z',null,null);
insert into libros
  values('Uno','Richard Bach','Planeta');

  select * from libros

-- Para obtener la lista de autores sin repetición
select distinct autor from libros;

-- Para obtener la lista de autores conocidos, es decir, no incluyendo "null" 
-- en la lista:
select distinct autor from libros
  where autor is not null;

-- Contamos los distintos autores
select count(distinct autor)
  from libros;

-- Nombres de las editoriales sin repetir:
select distinct editorial from libros;

--  Cantidad de editoriales distintas:
select count(distinct editorial) from libros;

-- Distintos autores de la editorial "Planeta":
select distinct autor from libros
  where editorial='Planeta';

-- Distintos autores que tiene cada editorial empleando "group by":
select editorial,count(distinct autor)
  from libros
  group by editorial;

-- Mostramos los títulos y editoriales de los libros sin repetir 
-- títulos ni editoriales:
select distinct titulo,editorial
  from libros
  order by titulo;

  ---Primera Practica

  if object_id('clientes') is not null
  drop table clientes;

  create table clientes (
  codigo int identity,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  provincia varchar (20),
  primary key(codigo)
);

 insert into clientes
  values ('Lopez Marcos','Colon 111','Cordoba','Cordoba');
 insert into clientes
  values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba');
 insert into clientes
  values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba');
 insert into clientes
  values ('Perez Luis','Sarmiento 444','Rosario','Santa Fe');
 insert into clientes
  values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba');
 insert into clientes
  values ('Gomez Ines','San Martin 666','Santa Fe','Santa Fe');
 insert into clientes
  values ('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba');
 insert into clientes
  values ('Lopez Carlos',null,'Cruz del Eje','Cordoba');
 insert into clientes
  values ('Ramos Betina','San Martin 999','Cordoba','Cordoba');
 insert into clientes
  values ('Lopez Lucas','San Martin 1010','Posadas','Misiones');

  select * from clientes

  /*
4- Obtenga las provincias sin repetir (3 registros)
5- Cuente las distintas provincias.
6- Se necesitan los nombres de las ciudades sin repetir (6 registros)
7- Obtenga la cantidad de ciudades distintas.
8- Combine con "where" para obtener las distintas ciudades de la provincia de Cordoba (3 registros)
9- Contamos las distintas ciudades de cada provincia empleando "group by" (3 registros)
  */

  select distinct provincia from clientes
  select count(distinct provincia) from clientes
  select distinct ciudad from clientes
    select count (distinct ciudad) from clientes
	select distinct ciudad from clientes
	where  provincia like 'Cor%'

	select provincia, count(ciudad) [Total Ciudades] from clientes
	group by provincia

	---Segunda Practica 

	 if object_id('inmuebles') is not null
  drop table inmuebles;

   create table inmuebles (
  documento varchar(8) not null,
  apellido varchar(30),
  nombre varchar(30),
  domicilio varchar(20),
  barrio varchar(20),
  ciudad varchar(20),
  tipo char(1),--b=baldio, e: edificado
  superficie decimal (8,2)
 );
 select * from inmuebles

  insert into inmuebles
  values ('11000000','Perez','Alberto','San Martin 800','Centro','Cordoba','e',100);
 insert into inmuebles
  values ('11000000','Perez','Alberto','Sarmiento 245','Gral. Paz','Cordoba','e',200);
 insert into inmuebles
  values ('12222222','Lopez','Maria','San Martin 202','Centro','Cordoba','e',250);
 insert into inmuebles
  values ('13333333','Garcia','Carlos','Paso 1234','Alberdi','Cordoba','b',200);
 insert into inmuebles
  values ('13333333','Garcia','Carlos','Guemes 876','Alberdi','Cordoba','b',300);
 insert into inmuebles
  values ('14444444','Perez','Mariana','Caseros 456','Flores','Cordoba','b',200);
 insert into inmuebles
  values ('15555555','Lopez','Luis','San Martin 321','Centro','Carlos Paz','e',500);
 insert into inmuebles
  values ('15555555','Lopez','Luis','Lopez y Planes 853','Flores','Carlos Paz','e',350);
 insert into inmuebles
  values ('16666666','Perez','Alberto','Sucre 1877','Flores','Cordoba','e',150);
  /*
4- Muestre los distintos apellidos de los propietarios, sin repetir (3 registros)
5- Muestre los distintos documentos de los propietarios, sin repetir (6 registros)
6- Cuente, sin repetir, la cantidad de propietarios de inmuebles de la ciudad de Cordoba (5)
7- Cuente la cantidad de inmuebles con domicilio en 'San Martin', sin repetir la ciudad (2)
8- Muestre los apellidos y nombres, sin repetir (5 registros)
Note que hay 2 personas con igual nombre y apellido que aparece una sola vez.
9- Muestre la cantidad de inmuebles que tiene cada propietario agrupando por documento, sin repetir 
barrio (6 registros)  
  */
  --4
  select distinct apellido from inmuebles
  --5
  select distinct documento from inmuebles
  --6
  select count(distinct documento) from inmuebles
  where ciudad like 'Cordoba'
  --7
  select count(distinct ciudad) from inmuebles
  where domicilio like '%San Martin%'
  --8
  select distinct apellido, nombre  from inmuebles
  --9
  select documento, count(distinct documento) from inmuebles
  group by documento