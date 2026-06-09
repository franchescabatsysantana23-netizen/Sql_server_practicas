/*
La clasula order by nos permite ordenar una consulta.
esta puede contener distintos ordenamientos ascedente y descendentes.
*/

if object_id ('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  primary key (codigo)
);

select * from libros

go

insert into libros (titulo,autor,editorial,precio) values('El aleph','Borges','Emece',25.33);
insert into libros values('Java en 10 minutos','Mario Molina','Siglo XXI',50.65);
insert into libros (titulo,autor,editorial,precio) values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',19.95);
insert into libros (titulo,autor,editorial,precio) values('Alicia en el pais de las maravillas','Lewis Carroll','Planeta',15);


select * from libros 
order by titulo

select * from libros 
order by titulo,editorial

/*ordena los titulos*/
select * from libros 
order by titulo asc,editorial desc

/*ordena los registros apartir de la posicion 3.*/
select * from libros 
order by 3

select titulo, autor, precio from libros 
order by precio desc

select titulo, autor, precio from libros 
order by precio asc

 select titulo, autor, editorial,precio+(precio*0.1) as 'precio con descuento'
  from libros order by precio desc;

  ---Primera Practica 

  if object_id('visitas') is not null
  drop table visitas;

--2- Créela con la siguiente estructura:

 create table visitas (
  numero int identity,
  nombre varchar(30) default 'Anonimo',
  mail varchar(50),
  pais varchar (20),
  fecha datetime,
  primary key(numero)
)
select * from visitas

---3- Ingrese algunos registros:
 insert into visitas (nombre,mail,pais,fecha)
  values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','Chile','2006-10-10 21:30');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-12 16:20');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25');


  /*
  4- Ordene los registros por fecha, en orden descendente.
5- Muestre el nombre del usuario, pais y el nombre del mes, ordenado por pais (ascendente) y nombre 
del mes (descendente)
6- Muestre el pais, el mes, el día y la hora y ordene las visitas por nombre del mes, del día y la 
hora.
7- Muestre los mail, país, ordenado por país, de todos los que visitaron la página en octubre (4 
registros)
  */

  select * from visitas 
  order by fecha desc

  select nombre,pais,fecha,datename(month,fecha) [name fecha] from visitas
  order by pais asc, nombre desc

  select pais,datepart(day,fecha) [dia],
  datepart(month,fecha) [mes] , datepart(hour,fecha) [hora] from visitas 
  order by [mes],[dia],[hora]

  select mail,pais, fecha from visitas 
  where DATEPART(month,fecha)=10
  order by pais