/*
if object_id('libros') is not null
  drop table libros;
if object_id('editoriales') is not null
  drop table editoriales;

create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
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
insert into libros values('Aprenda PHP','Mario Molina',3,50);
insert into libros values('Uno','Richard Bach',3,15);
insert into libros values('Java en 10 minutos',default,4,45);

-- Contamos la cantidad de libros de cada editorial consultando ambas tablas:
select nombre as editorial,
  count(*) as cantidad
  from editoriales as e
  join libros as l
  on codigoeditorial=e.codigo
  group by e.nombre;

-- Buscamos el libro más costoso de cada editorial con un "left join":
select nombre as editorial,
  max(precio) as 'mayor precio'
  from editoriales as e
  left join libros as l
  on codigoeditorial=e.codigo
  group by nombre;

*/

---Primera Practica

if object_id('visitantes') is not null
drop table visitantes

if object_id('ciudades') is not null
drop table ciudades

create table visitantes(
  nombre varchar(30),
  edad tinyint,
  sexo char(1) default 'f',
  domicilio varchar(30),
  codigociudad tinyint not null,
  mail varchar(30),
  montocompra decimal (6,2)
 );

  create table ciudades(
  codigo tinyint identity,
  nombre varchar(20)
 );

 insert into ciudades values('Cordoba');
 insert into ciudades values('Carlos Paz');
 insert into ciudades values('La Falda');
 insert into ciudades values('Cruz del Eje');

  insert into visitantes values 
   ('Susana Molina', 35,'f','Colon 123', 1, null,59.80);
 insert into visitantes values 
   ('Marcos Torres', 29,'m','Sucre 56', 1, 'marcostorres@hotmail.com',150.50);
 insert into visitantes values 
   ('Mariana Juarez', 45,'f','San Martin 111',2,null,23.90);
 insert into visitantes values 
   ('Fabian Perez',36,'m','Avellaneda 213',3,'fabianperez@xaxamail.com',0);
 insert into visitantes values 
   ('Alejandra Garcia',28,'f',null,2,null,280.50);
 insert into visitantes values 
   ('Gaston Perez',29,'m',null,5,'gastonperez1@gmail.com',95.40);
 insert into visitantes values 
   ('Mariana Juarez',33,'f',null,2,null,90);


   select * from visitantes


   /*
 4- Cuente la cantidad de visitas por ciudad mostrando el nombre de la ciudad (3 filas)
5- Muestre el promedio de gastos de las visitas agrupados por ciudad y sexo (4 filas)
6- Muestre la cantidad de visitantes con mail, agrupados por ciudad (3 filas)
7-Obtenga el monto de compra más alto de cada ciudad (3 filas)

   */

   select * from visitantes
   select * from ciudades

   --5- Muestre el promedio de gastos de las visitas agrupados por ciudad y sexo (4 filas)
   select avg(v.montocompra) promedio,
   c.nombre, v.sexo
   from visitantes v
    join ciudades c
   on (c.codigo =v.codigociudad)
   group by c.nombre,v.sexo

   -- 4- Cuente la cantidad de visitas por ciudad mostrando el nombre de la ciudad (3 filas)
   select count(*) total,
   c.nombre
   from visitantes v
   join ciudades c
   on (c.codigo =v.codigociudad)
   group by c.nombre

   ----6- Muestre la cantidad de visitantes con mail, agrupados por ciudad (3 filas)
   select * from visitantes


     select count(v.nombre) total,
   c.nombre
   from visitantes v
   inner join ciudades c
   on (c.codigo =v.codigociudad)
   group by c.nombre


 --  7-Obtenga el monto de compra más alto de cada ciudad (3 filas)

   select max(v.montocompra) maximo,
   c.nombre
   from visitantes v
   left join ciudades c
   on (c.codigo =v.codigociudad)
   where c.nombre is not null
   group by c.nombre

   --aplicado con join

      select max(v.montocompra) maximo,
   c.nombre
   from visitantes v
   inner join ciudades c
   on (c.codigo =v.codigociudad)
   group by c.nombre
