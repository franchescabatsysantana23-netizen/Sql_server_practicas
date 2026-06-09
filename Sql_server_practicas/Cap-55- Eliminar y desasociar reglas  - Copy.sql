/*
"sp_unbindrule": permite desasociar una regla de una tabla.
ejemplo de sintaxis: 
exec sp_unbindrule 'TABLA.CAMPO';
 drop rule NOMBREREGLA;
 exec sp_unbindrule 'empleados.sueldo';
  drop rule RG_sueldo_100a1000;

*/

if object_id ('empleados') is not null
  drop table empleados;

if object_id ('RG_sueldo_100a1000') is not null
   drop rule RG_sueldo_100a1000;

create table empleados(
  documento char(8),
  nombre varchar(30) not null,
  seccion varchar(20),
  sueldo decimal(6,2),
  primary key(documento)
);

go

-- Creamos una regla para restringir los valores que se pueden ingresar
-- en un campo "sueldo":
create rule RG_sueldo_100a1000
   as @sueldo between 100 and 1000;

go

-- Asociamos la regla creada anteriormente al campo "sueldo":
exec sp_bindrule RG_sueldo_100a1000, 'empleados.sueldo';

-- Vemos si la regla está asociada a algún campo de "empleados":
exec sp_helpconstraint empleados;

-- Quitamos la asociación:
exec sp_unbindrule 'empleados.sueldo';

-- Ahora que hemos quitado la asociación, podemos ingresar el valor
-- "1200" en el campo "sueldo":
insert into empleados values ('30111222','Pedro Torres','Contaduria',1200);

-- Vemos si la regla está asociada a algún campo de "empleados":
exec sp_helpconstraint empleados;

-- Ejecutamos el procedimiento "sp_help" para verificar que la regla aún existe:
exec sp_help;

-- Ahora si podemos borrar la regla:
drop rule RG_sueldo_100a1000;

if object_id('vehiculos') is not null
drop table vehiculos

if object_id('RG_patente_patron') is not null
drop rule RG_patente_patron

if object_id('RG_patente_patron') is not null
drop rule RG_patente_patron

if object_id('RG_vehiculos_tipo2') is not null
drop rule RG_vehiculos_tipo2

exec sp_help

create table vehiculos(
patente char(6),
tipo char(1),
horallegada datetime not null,
horasalida datetime)

create rule RG_patente_patron
as @patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]';

exec sp_bindrule RG_patente_patron, 'vehiculos.patente'

exec sp_helpconstraint vehiculos
 insert into vehiculos values ('FGHIJK','a','1990-02-01 18:00',null);

 create rule RG_vehiculos_tipo
 as @tipo in ('a','m')

 drop rule RG_vehiculos_tipo

 exec sp_bindrule RG_vehiculos_tipo, 'vehiculos.tipo'
 exec sp_helpconstraint vehiculos

insert into vehiculos values('AAA111','c','2001-10-10 10:10',NULL);

create rule RG_vehiculos_tipo2
 as @tipo in ('a','c','m');

  exec sp_helpconstraint vehiculos --permite visualizar reglas, contrainst, reglas de tablas asociadas a una tabla. 

  exec sp_bindrule RG_vehiculos_tipo2, 'vehiculos.tipo'
  drop rule RG_vehiculos_tipo2

  exec sp_unbindrule  'vehiculos.tipo' --desasociacion de la regla del campo vehiculo tipo.

  if object_id('RG_vehiculos_tipo2') is not null
  drop rule RG_vehiculos_tipo2

  exec sp_unbindrule 'vehiculos.patente'
  drop rule RG_patente_patron
  exec sp_help 

  if object_id('RG_patente_patron') is not null
  drop rule RG_patente_patron



