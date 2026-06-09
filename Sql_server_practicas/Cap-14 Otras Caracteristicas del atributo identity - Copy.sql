/*
El atributo "identity" permite indicar el valor de inicio de la secuencia y el incremento,
La función "ident_seed()" retorna el valor de inicio del campo "identity" de la tabla que nombramos:
select ident_seed('libros');
La función "ident_incr()" retorna el valor de incremento del campo "identity" de la tabla nombrada:
select ident_incr('libros');
Hemos visto que en un campo declarado "identity" no puede ingresarse explícitamente un valor.
Para permitir ingresar un valor en un campo de identidad se debe activar la opción "identity_insert":
 set identity_insert libros on;
Para desactivar la opción "identity_insert" tipeamos:
 set identity_insert libros off;

*/
---Practica 1
if object_id('medicamentos ') is not null
drop table medicamentos

create table medicamentos(
codigo integer identity(10,1),
nombre varchar(20) not null,
laboratorio varchar(20),
precio float,
cantidad integer)

select * from medicamentos

insert into medicamentos (nombre, laboratorio,precio, cantidad)
values('Sertal','Roche',5.2,100),
('Buscapina','Roche',4.10,200),
('Amoxidal 500','Bayer',15.60,100)

insert into medicamentos (nombre, laboratorio,precio, cantidad)
values('prueba','Prueba',5.2,100)

--permite realizar una especie de insert a un campo identity. 
set identity_insert medicamentos on
exec sp_columns medicamentos
set identity_insert medicamentos off

select * from medicamentos
/*retorna el valor del inicio de un campo identity.*/
select ident_seed('medicamentos')

select ident_incr('medicamentos')

---Practica 2
if object_id('peliculas') is not null
drop table peliculas

create table peliculas(
codigo int identity(50,3),
titulo varchar(40),
actor varchar(20),
duracion int)
select * from peliculas

insert into peliculas(titulo,actor,duracion) values
('Mision Imposible','Tom Cruise',120),
('Harry Potter y la piedra filosofal','Daniel R.',180),
('Harry Potter y la camara secreta','Daniel R.',190)

set identity_insert peliculas on
set identity_insert peliculas off

insert into peliculas(titulo,actor,duracion) values
('Mision Imposible','Tom Cruise',120)

select IDENT_SEED('peliculas')
select IDENT_INCR('peliculas')
select IDENT_CURRENT('peliculas') --- muestra el ultimo valor de la tabla
select SCOPE_IDENTITY('peliculas') 

exec sp_columns peliculas