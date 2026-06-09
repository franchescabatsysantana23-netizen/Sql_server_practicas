/*
Las claves primarias pueden ser simples, formadas por un solo campo o compuestas, más de un campo.
Recordemos que una clave primaria identifica 1 solo registro en una tabla.
Para un valor del campo clave existe solamente 1 registro. Los valores no se repiten ni pueden ser nulos.
SQL Server controla que los valores para los campos establecidos como clave primaria no estén repetidos en la tabla;
*/

---Concepto 

if object_id('vehiculo') is not null
drop table vehiculo


create table vehiculos(
  patente char(6) not null,
  tipo char(1),--'a'=auto, 'm'=moto
  horallegada datetime,
  horasalida datetime,
  primary key(patente,horallegada)
);

select * from vehiculos

insert into vehiculos values('AIC124','a','8:05','12:30');
insert into vehiculos values('CAA258','a','8:05',null);
insert into vehiculos values('DSE367','m','8:30','18:00');
insert into vehiculos values('FGT458','a','9:00',null);
insert into vehiculos values('AIC124','a','16:00',null);
insert into vehiculos values('LOI587','m','18:05','19:55');


-- Si intentamos ingresar un registro con clave primaria repetida:
insert into vehiculos values('LOI587','m','18:05',null);

-- Si ingresamos un registro repitiendo el valor de uno de los campos
-- que forman parte de la clave, si lo acepta:
insert into vehiculos values('LOI587','m','21:30',null);

-- Si intentamos actualizar un registro repitiendo la clave primaria
-- (se genera un error):
update vehiculos set horallegada='8:05'
  where patente='AIC124' and horallegada='16:00';

-- Recordemos que los campos que forman parte de la clave primaria no 
-- aceptan valores nulos, aunque no se haya aclarado en la definición 
-- de la tabla (genera un error):
insert into vehiculos values('HUO690','m',null,null);

-- mostramos la estructura de la tabla 
-- (los campos que forman parte de la clave primaria (patente y horallegada)
--  tienen "NO" en la columna "IS_NULLABLE", es decir, no admiten valores nulos.):
exec sp_columns vehiculos;

---Primer Practica

if object_id('consultas') is not null
  drop table consultas;

  create table consultas(
  fechayhora datetime not null,
  medico  varchar(30) not null,
  documento char(8)not null,
  paciente varchar(30),
  obrasocial varchar(30),
  primary key(fechayhora,medico))

  insert into consultas values(getdate(),'sofia','22344566','perez','IPAM')
  select datetime

  select * from consultas

    insert into consultas values('2024-10-14 16:19:53.007','franchesca','22344566','perez','IPAM')


	---Segunda Practica

  if object_id('inscriptos') is not null
  drop table inscriptos;

  create table inscriptos(
  documento char(8) not null, 
  nombre varchar(30),
  deporte varchar(15) not null,
  año datetime,
  matricula char(1),
  primary key(documento,deporte,año)
 );

 select * from inscriptos

  insert into inscriptos
  values ('12222222','Juan Perez','tenis','2005','s');
 insert into inscriptos
  values ('23333333','Marta Garcia','tenis','2005','s');
 insert into inscriptos
  values ('34444444','Luis Perez','tenis','2005','n');
   insert into inscriptos
  values ('12222222','Juan Perez','futbol','2005','s');
 insert into inscriptos
  values ('12222222','Juan Perez','natacion','2005','s');
 insert into inscriptos
  values ('12222222','Juan Perez','basquet','2005','n');

   insert into inscriptos
  values ('12222222','Juan Perez','tenis','2006','s');
 insert into inscriptos
  values ('12222222','Juan Perez','tenis','2007','s');

  select * from inscriptos

  /*
7- Intente inscribir a un socio alumno en un deporte en el cual ya esté inscripto en un año en el 
cual ya se haya inscripto.
8- Intente actualizar un registro para que la clave primaria se repita.
*/
 insert into inscriptos
  values ('12222222','Juan Perez','tenis','2007','s');

  update inscriptos 
  set documento='34444444'
  where año='2007'

  
 update inscriptos set deporte='tenis'
  where documento='12222222' and
  deporte='futbol' and
  año='2005';

  sp_helpconstraint inscriptos  --- visualizacion de restricion de una tabla