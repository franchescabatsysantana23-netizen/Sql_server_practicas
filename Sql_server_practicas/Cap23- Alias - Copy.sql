select * from libros 

Select titulo as nombre, autor from libros
select titulo as 'titulo del libro ', autor from libros
select titulo 'titulo del libro ', autor from libros

if object_id('libros') is not null 
drop table libros

create table libros(
codigo int identity, 
titulo  varchar(40) not null,
autor varchar(20) default 'Desconocido',
editorial varchar(20),
precio decimal(6,2),
cantidad tinyint default 0,
primary key(codigo))

insert into libros(titulo,autor,editorial,precio,cantidad)
values('El aleph','Borges','Emece',25,0),
('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100),
('Alicia en el pais de las maravillas ','Lewis Carroll','Emece',15,50)

select * from libros

select (precio *cantidad) as 'monto total', * from libros
select (precio -cantidad ) as 'Resta por Registros', * from libros 
where cantidad<>50

select titulo, autor, precio, (precio*0.1) 'Descuento', (precio-(precio*0.1))As 'total con descuento' from libros 
where editorial ='Emece'

select titulo +' '+autor 'Titulo y Autor' from libros