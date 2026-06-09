use bd1
---Primer Ejercicio

if object_id('medicamentos') is not null
drop table medicamentos

create table medicamentos(
codigo integer not null,
nombre varchar(20) not null,
laboratorio varchar(20),
precio float,
cantidad integer not null
)
select * from medicamentos
exec sp_columns medicamentos

insert into medicamentos values
(1,'Sertal Gotas',null,null,100),
(2,'Sertal Compuesto',null,8.90,150),
(3,'Buscapina','Roche',null, 200)

select * from medicamentos

insert into medicamentos values
(null,'Amoxidal Jarabe','Bayer',25,120)

select * from medicamentos 
where laboratorio is null

select * from medicamentos 
where laboratorio =''

select * from medicamentos 
where precio is null

select * from medicamentos 
where precio =0

select * from medicamentos 
where laboratorio is not null

select * from medicamentos 
where laboratorio <>''

select * from medicamentos 
where precio <>0
select * from medicamentos 
where precio is not null

---Segundo Ejercicios

if object_id('peliculas') is not null
drop table peliculas

select * from peliculas

create table peliculas(
codigo int not null,
titulo varchar(40) not null,
actor varchar(20),
duracion int
)
exec sp_columns peliculas

insert into peliculas(codigo,titulo,actor,duracion) values
(1,'Mision Imposible','Tom Cruise',120),
(2,'Harry potter y la piedra filosofal',null,180),
(3,'Harry potter y la camara secreta','Daniel R',null),
(0,'Mision Imposible 2','',150),
(4,'','L.Di Caprio',220),
(5,'Mujer Bonita','R.Gere-j. Roberts',0)

select * from peliculas
insert into peliculas(codigo,titulo,actor,duracion) values
(null,'Mujer Bonita','R.Gere-j. Roberts',190)

select * from peliculas 
where actor is null

select * from peliculas 
where actor =''

select * from peliculas

update peliculas 
set duracion =120
where duracion is null

update peliculas 
set actor =null
where actor =''
delete from peliculas 
where titulo =''





