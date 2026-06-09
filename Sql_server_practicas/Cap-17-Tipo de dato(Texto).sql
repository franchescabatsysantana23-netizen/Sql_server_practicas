/*
varchar(x): define una cadena de caracteres de longitud variable que va hasta el argumento x
su rango va de 1 a 8000 caracteres.
char(x): define una cadena de longitud fija determinada por el argumento "x"
su rango va de 1 a 8000 caracteres.
text: guarda datos binarios de longitud variable, puede contener hasta 2000000000 caracteres.
nvarchar(x): es similar a "varchar", excepto que permite almacenar caracteres Unicode, 
su rango va de 0 a 4000 caracteres porque se emplean 2 bytes por cada caracter.
nchar(x): es similar a "char" excpeto que acepta caracteres Unicode, su rango va de 
0 a 4000 caracteres porque se emplean 2 bytes por cada caracter.
ntext: es similar a "text" excepto que permite almacenar caracteres Unicode,
puede contener hasta 1000000000 caracteres. No admite argumento para especificar su longitud.

*/
---Practica 1
if object_id('autos') is not null
drop table autos

create table autos(
patente char(6),
marca varchar(20),
modelo char(4),
precio float,
primary key(patente))
select * from autos

insert into autos
  values('ACD123','Fiat 128','1970',15000);
 insert into autos
  values('ACG234','Renault 11','1990',40000);
 insert into autos
  values('BCD333','Peugeot 505','1990',80000);
 insert into autos
  values('GCD123','Renault Clio','1990',70000);
 insert into autos
  values('BCC333','Renault Megane','1998',95000);
 insert into autos
  values('BVF543','Fiat 128','1975',20000);

  select * from autos 
  where modelo ='1990'

  if object_id('clientes') is not null
  drop table clientes

  create table clientes(
  documento char(8),
  apellido varchar(20),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11))

  select * from clientes

  ---inserccion multiple
 insert into clientes
  values('2233344','Perez','Juan','Sarmiento 980','4342345');
 insert into clientes (documento,apellido,nombre,domicilio)
  values('2333344','Perez','Ana','Colon 234');
 insert into clientes
  values('2433344','Garcia','Luis','Avellaneda 1454','4558877');
 insert into clientes
  values('2533344','Juarez','Ana','Urquiza 444','4789900');

  ---insercion multiple
  insert into clientes values
  ('2233344','Perez','Juan','Sarmiento 980','4342345'),
  ('2333344','Perez','Ana','Colon 234',null),
  ('2433344','Garcia','Luis','Avellaneda 1454','4558877'),
  ('2533344','Juarez','Ana','Urquiza 444','4789900')
  select * from clientes

  truncate table clientes
  exec sp_columns clientes  ---permite visualizar la estructura de una tabla

  select IDENT_SEED('cliente') --- visualiza el inicio del incremento de los valores en una tabla.
  select IDENT_INCR('cliente') --- visualiza el valor del incremento de un registro. 

  select * from clientes
  where apellido ='Perez'