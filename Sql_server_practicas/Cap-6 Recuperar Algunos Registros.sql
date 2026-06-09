if object_id('agenda') is not null
drop table agenda
select * from agenda

create table agenda(
apellido varchar(30),
nombre varchar(30),
domicilio varchar(30),
telefono varchar(11))

insert into agenda values
('Acosta','Ana','Colon 123','4234567'),
('Bustamante','Betina','Avellanada 135','4458787'),
('Lopez','Hector','Salta 545','4887788'),
('Lopez','Luis','Urquiza 333','4545454'),
('Lopez','Marisa','Urquiza 333','4545454')
select * from agenda
select * from agenda where nombre ='Marisa'

select nombre, domicilio from agenda where apellido ='Lopez'
select nombre from agenda where telefono ='4545454'



if object_id('libros') is not null
drop table libros

select * from libros

create table libros (
titulo varchar(20),
autor varchar(20),
editorial varchar(15))

exec sp_columns libros

insert into libros values
('El aleph','Borges','Emece'),
('Martin Fierro','Jose Hernandez','Emece'),
('Martin Fierro','Jose Hernandez','Planeta'),
('Aprenda PHP','Mario Molina','Siglo XXI')

select * from libros
select * from libros 
where autor ='Borges'

select titulo from libros 
where editorial = 'Emece'

select titulo from libros 
where titulo ='Martin Fierro'