/*
Una combinación externa derecha ("right outer join" o "right join") opera del mismo modo sólo que la tabla derecha es la que
localiza los registros en la tabla izquierda.
El resultado mostrará el título y nombre de la editorial


*/
---Teorico de la Unidad
if object_id('libros') is not null
  drop table libros;
if object_id('editoriales') is not null
  drop table editoriales;


  create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30) default 'Desconocido',
  codigoeditorial tinyint not null,
  precio decimal(5,2)
);

create table editoriales(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
);

go

insert into editoriales values('Planeta');
insert into editoriales values('Emece');
insert into editoriales values('Siglo XXI');

insert into libros values('El aleph','Borges',1,20);
insert into libros values('Martin Fierro','Jose Hernandez',1,30);
insert into libros values('Aprenda PHP','Mario Molina',2,50);
insert into libros values('Java en 10 minutos',default,4,45);

-- Solicitamos el título y nombre de la editorial de los libros
-- empleando un "right join":
select titulo,nombre
  from libros as l
  right join editoriales as e
  on codigoeditorial = e.codigo;

-- Realizamos la misma consulta anterior agregando un "where" que restringa
-- el resultado considerando solamente los registros que encuentran
-- coincidencia en la tabla izquierda:
 select titulo,nombre
  from libros as l
  right join editoriales as e
  on e.codigo=codigoeditorial
  where codigoeditorial is not null;

-- Mostramos las editoriales que no están presentes en "libros" 
-- (que no encuentran coincidencia en "editoriales"):
 select titulo,nombre
  from libros as l
  right join editoriales as e
  on e.codigo=codigoeditorial
  where codigoeditorial is null;

  --Primera Practica

   if (object_id('clientes')) is not null
   drop table clientes;
  if (object_id('provincias')) is not null
   drop table provincias;

 create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia tinyint not null,
  primary key(codigo)
 );

 create table provincias(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
 );

--2- Ingrese algunos registros para ambas tablas:
 insert into provincias (nombre) values('Cordoba');
 insert into provincias (nombre) values('Santa Fe');
 insert into provincias (nombre) values('Corrientes');

 insert into clientes values ('Lopez Marcos','Colon 111','Córdoba',1);
 insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje',1);
 insert into clientes values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
 insert into clientes values ('Perez Luis','Sarmiento 444','Rosario',2);
 insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe',2);
 insert into clientes values ('Torres Fabiola','Alem 777','La Plata',4);
 insert into clientes values ('Garcia Luis','Sucre 475','Santa Rosa',5);

 select * from clientes 

 ---3- Muestre todos los datos de los clientes, incluido el nombre de la provincia empleando un right join

 select c.nombre,c.domicilio, c.ciudad,
 p.nombre from provincias p right join clientes c 
 on (c.codigoprovincia =p.codigo)

 ---4- Obtenga la misma salida que la consulta anterior pero empleando un "left join".
  select c.nombre,c.domicilio, c.ciudad,
 p.nombre from clientes c left join provincias p 
 on (p.codigo=c.codigoprovincia)

 ---5- Empleando un "right join", muestre solamente los clientes de las provincias que existen en "provincias" (5 registros)
 select c.nombre,c.domicilio, c.ciudad,
 p.nombre from provincias p right join clientes c
 on (p.codigo =c.codigoprovincia)
 where p.codigo is not null

 --6- Muestre todos los clientes cuyo código de provincia NO existe en "provincias" ordenados por ciudad (2 registros)

  select c.nombre,c.domicilio, c.ciudad,
 p.nombre from provincias p right join clientes c
 on (p.codigo =c.codigoprovincia)
 where p.codigo is null
 order by c.ciudad


 ---------------------------------------------------------------------------------------------

  select c.nombre,domicilio,ciudad, p.nombre
  from provincias as p
  right join clientes as c
  on codigoprovincia = p.codigo;

 select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo;

 select c.nombre,domicilio,ciudad, p.nombre
  from provincias as p
  right join clientes as c
  on codigoprovincia = p.codigo
  where p.codigo is not null;

 select c.nombre,domicilio,ciudad, p.nombre
  from provincias as p
  right join clientes as c
  on codigoprovincia = p.codigo
  where p.codigo is null
  order by ciudad;