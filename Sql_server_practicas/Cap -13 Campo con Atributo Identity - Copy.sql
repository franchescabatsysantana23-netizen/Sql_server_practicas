/*
Primera Practica
*/

if object_id('') is not null
drop table medicamentos
go
create table medicamentos(
codigo int identity,
nombre varchar(20) not null,
laboratorio varchar(20),
precio float,
cantidad integer)
exec sp_columns medicamentos
select * from medicamentos

insert into medicamentos values
('Sertal','Roche',5.2,100),
('Buscapina','Roche',4.10,200),
('Amoxidal 500','Bayer',15.60,100)

insert into medicamentos values
(1,'Sertal','Roche',5.2,100)
delete from medicamentos 
where codigo =4
---Segunda practica

if object_id('peliculas') is not null
drop table peliculas

select * from peliculas

 create table peliculas(
  codigo int identity,
  titulo varchar(40),
  actor varchar(20),
  duracion int,
  primary key(codigo)
 );

  exec sp_columns peliculas;


   insert into peliculas (titulo,actor,duracion)
  values('Mision imposible','Tom Cruise',120);
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la piedra filosofal','Daniel R.',180);
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la camara secreta','Daniel R.',190);
 insert into peliculas (titulo,actor,duracion)
  values('Mision imposible 2','Tom Cruise',120);
 insert into peliculas (titulo,actor,duracion)
  values('La vida es bella','zzz',220);

  insert into peliculas  values
  ('La vida es bella','zzz',220);

  update peliculas
  set codigo =6
  where codigo =1

  delete from peliculas 
  where titulo ='La vida es bella'