if object_id('comidas') is not null
drop table comidas
create table comidas(
  codigo tinyint identity,
  nombre varchar(30),
  precio decimal(4,2)
)

create table postres(
  codigo tinyint identity,
  nombre varchar(30),
  precio decimal(4,2)
)

insert into comidas values('ravioles',5);
insert into comidas values('tallarines',4);
insert into comidas values('milanesa',7);
insert into comidas values('cuarto de pollo',6);

insert into postres values('flan',2.5);
insert into postres values('porcion torta',3.5);

select c.nombre as 'plato principal',
  p.nombre as 'postre', c.precio,p.precio,
  c.precio+p.precio as 'total'
  from comidas as c
  cross join postres as p;

  select * from postres
  select * from comidas

  if object_id('mujeres') is not null
  drop table mujeres
  if object_id('varones') is not null
  drop table varones
  create table mujeres(
  nombre varchar(30),
  domicilio varchar(30),
  edad int)


  create table varones(
  nombre varchar(30),
  domicilio varchar(30),
  edad int
  )

   insert into mujeres values('Maria Lopez','Colon 123',45);
 insert into mujeres values('Liliana Garcia','Sucre 456',35);
 insert into mujeres values('Susana Lopez','Avellaneda 98',41);
 insert into varones values('Juan Torres','Sarmiento 755',44);
 insert into varones values('Marcelo Oliva','San Martin 874',56);
 insert into varones values('Federico Pereyra','Colon 234',38);
 insert into varones values('Juan Garcia','Peru 333',50);

 select * from mujeres
 select * from varones

 select * from mujeres 
 cross join varones

 select * from mujeres m
 cross join varones v
 where m.edad >40

 select * from varones v
 cross join mujeres  m
 where m.edad -v.edad  <10

  select * from varones v
 cross join mujeres  m
 where m.edad -v.edad  between -10 and 10

 ----Segunda Practica

 if object_id('tareas') is not null
 drop table tareas
 if object_id('guardias') is not null
 drop table guardias

 create table guardias(
 documento char(8),
 nombre varchar(30),
 sexo char(1),
 domicilio varchar(30),
 primary key (documento))

 create table tareas(
 codigo tinyint identity,
 domicilio varchar(30),
 descripcion varchar(30),
 horario char(2),
 primary key(codigo))

 select * from guardias
 select * from tareas

  insert into guardias values('22333444','Juan Perez','m','Colon 123');
 insert into guardias values('24333444','Alberto Torres','m','San Martin 567');
 insert into guardias values('25333444','Luis Ferreyra','m','Chacabuco 235');
 insert into guardias values('23333444','Lorena Viale','f','Sarmiento 988');
 insert into guardias values('26333444','Irma Gonzalez','f','Mariano Moreno 111');

  insert into tareas values('Colon 1111','vigilancia exterior','AM');
 insert into tareas values('Urquiza 234','vigilancia exterior','PM');
 insert into tareas values('Peru 345','vigilancia interior','AM');
 insert into tareas values('Avellaneda 890','vigilancia interior','PM');

 select * from guardias cross join tareas


 select * from guardias cross join tareas
 where sexo in ('f','m') and descripcion like '%interior%'

  select * from guardias cross join tareas
 where sexo in ('f','m') and descripcion like '%exterior%'

 and sexo ='m' and descripcion like '%exterior%'


  select nombre,t.domicilio,descripcion
  from guardias as g
  cross join tareas as t
  where (g.sexo='f' and t.descripcion='vigilancia interior') or
  (g.sexo='m' and t.descripcion='vigilancia exterior');