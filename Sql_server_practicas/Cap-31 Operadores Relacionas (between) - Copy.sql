---Primera Practica

--1- Elimine la tabla "visitas", si existe:
 if object_id('visitas') is not null
  drop table visitas;

--2- Créela con la siguiente estructura:
 create table visitas (
  numero int identity,
  nombre varchar(30) default 'Anonimo',
  mail varchar(50),
  pais varchar (20),
  fechayhora datetime,
  primary key(numero)
);

select * from visitas

--3- Ingrese algunos registros:
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Gustavo Gonzalez','GustavoGGonzalez@gotmail.com','Chile','2006-10-10 21:30');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Juancito','JuanJosePerez@gmail.com','Argentina','2006-09-12 16:20');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25');
 insert into visitas (nombre,mail,pais)
  values ('Federico1','federicogarcia@xaxamail.com','Argentina');


  /*
  4- Seleccione los usuarios que visitaron la página entre el '2006-09-12' y '2006-10-11' (5 
registros)
Note que incluye los de fecha mayor o igual al valor mínimo y menores al valor máximo, y que los 
valores null no se incluyen.
5- Recupere las visitas cuyo número se encuentra entre 2 y 5 (4 registros)
Note que incluye los valores límites. 
  */

  select * from visitas
  -----------------------------------------------------------------------------------
  select * from visitas 
  where fechayhora between '2006-09-12' and '2006-10-11'
  -----------------------------------------------------------------------------------
  select * from visitas 
  where numero between 2 and 5

  ----------------------------------------------------------------------------------
  ---Segunda Practica

 -- Una concesionaria de autos vende autos usados y almacena la información en una tabla llamada 
--"autos".
--1- Elimine la tabla "autos" si existe:
 if object_id('autos') is not null
  drop table autos;

--2- Cree la tabla con la siguiente estructura:
 create table autos(
  patente char(6),
  marca varchar(20),
  modelo char(4),
  precio decimal(8,2),
  primary key(patente)
 );

 select * from autos
--3- Ingrese algunos registros:
 insert into autos
  values('ACD123','Fiat 128','1970',15000);
 insert into autos
  values('ACG234','Renault 11','1980',40000);
 insert into autos
  values('BCD333','Peugeot 505','1990',80000);
 insert into autos
  values('GCD123','Renault Clio','1995',70000);
 insert into autos
  values('BCC333','Renault Megane','1998',95000);
 insert into autos
  values('BVF543','Fiat 128','1975',20000);
  /*
4- Seleccione todos los autos cuyo modelo se encuentre entre '1970' y '1990' usando el operador 
"between" y ordénelos por dicho campo(4 registros)

5- Seleccione todos los autos cuyo precio esté entre 50000 y 100000.*/

select * from autos 
where modelo between '1970' and '1990'

select * from autos 
where precio between 50000 and 100000