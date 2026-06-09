use bd1
go
Select * from libros
where autor ='Borges' 

/*
=	igual
<>	distinto
>	mayor
<	menor
>=	mayor o igual
<=	menor o igual
*/

select * from  libros 

select * from libros 
where editorial <>'Emece'
if object_id('libros') is not null
drop table libros
select * from libros

create table libros (
titulo varchar(30),
autor varchar(30),
editorial varchar(15),
precio float)

select * from libros

insert into libros values
('El aleph','Borges','Emece',24.50),
('Martin Fierro','Jose Hernandez','Emece',16.00),
('Aprenda PHP','Mario Molina','Emece',35.40),
('Cervantes y el quijote','Borges','Paidos',50.90)

select * from libros

select * from libros 
where autor <>'Borges'

select titulo,precio from libros
where precio >20
select * from libros 
where precio <=30

if object_id('articulos') is not null
drop table articulos

create table articulos(
codigo integer,
nombre varchar(20),
descripcion varchar(30),
precio float,
cantidad integer)

exec sp_columns articulos
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (1,'impresora','Epson Stylus C45',400.80,20);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (2,'impresora','Epson Stylus C85',500,30);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (3,'monitor','Samsung 14',800,10);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (4,'teclado','ingles Biswal',100,50);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (5,'teclado','español Biswal',90,50);


  select * from articulos
  where nombre like 'impre%'
  select * from articulos 
  where nombre ='impresora'
  select * from articulos 
  where precio >=400
  select codigo, nombre from articulos 
  where cantidad<30
  select nombre,descripcion from articulos 
  where precio <>100

  select * from articulos 
  where not nombre like 'impre%'

  if object_id('peliculas ') is not null
  drop table peliculas

  select * from peliculas

  create table peliculas(
  titulo varchar(20),
  actor varchar(20),
  duracion integer,
  cantidad integer)

  select * from peliculas

 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mision imposible','Tom Cruise',120,3);
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mision imposible 2','Tom Cruise',180,4);
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mujer bonita','Julia R.',90,1);
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Elsa y Fred','China Zorrilla',80,2);

  select * from peliculas 
  where duracion <=90 
  select titulo from peliculas 
  where actor <>'Tom Cruise'
  select titulo from peliculas 
  where not actor ='Tom Cruise'
  select titulo from peliculas 
  where not actor like '%Tom%'

  select titulo, actor, cantidad from peliculas 
  where cantidad>2

  if object_id('articulos') is not null
  drop table articulos 

  create table articulos(
  codigo integer,
  nombre varchar(20),
  descripcion varchar(30),
  precio float,
  cantidad integer)

  exec sp_columns articulos 

   insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (1,'impresora','Epson Stylus C45',400.80,20);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (2,'impresora','Epson Stylus C85',500,30);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (3,'monitor','Samsung 14',800,10);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (4,'teclado','ingles Biswal',100,50);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (5,'teclado','español Biswal',90,50);

  select * from articulos

  delete from articulos 
  where precio >=500

  delete from articulos 
  where nombre ='impresora'
  delete from articulos 
  where precio <>4

  Create view insercionRegistros 
  AS
  select * from articulos where precio >400

  select * from insercionRegistros 


 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (1,'impresora','Epson Stylus C45',400.80,20);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (2,'impresora','Epson Stylus C85',500,30);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (3,'monitor','Samsung 14',800,10);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (4,'teclado','ingles Biswal',100,50);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (5,'teclado','español Biswal',90,50);



