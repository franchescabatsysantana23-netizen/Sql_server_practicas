/*
integer o int: su rango es de -2000000000 a 2000000000 aprox
smallint: Puede contener hasta 5 digitos. Su rango va desde –32000 hasta 32000 aprox.
tinyint: Puede almacenar valores entre 0 y 255.
bigint: De –9000000000000000000 hasta 9000000000000000000 aprox.
smallmoney: Entre –200000.3648 y 200000.3647 aprox.
Tipo		Bytes de almacenamiento
_______________________________________
int		4
smallint	2
tinyint		1
bigint		8

decimal		2 a 17

float		4 u 8
real		4 u 8

money		8
smallmoney	4

*/

create table cuentas(
numeroCuentas char(4),
documento varchar(20),
nombre varchar(50),
saldo decimal,
primary key(numeroCuentas))

select * from cuentas
exec sp_columns cuentas
 insert into cuentas
  values('1234','25666777','Pedro Perez',500000.60),
 ('2234','27888999','Juan Lopez',-250000),
 ('3344','27888999','Juan Lopez',4000.50),
  ('3346','32111222','Susana Molina',1000)

  select * from cuentas
  select numeroCuentas,saldo from cuentas 
  where nombre ='Juan Lopez'

  select * from cuentas 
  where saldo <0
    select * from cuentas 
  where saldo >=3000
  if object_id('empleados') is not null
  drop table empleados

  create table empleados(
  nombre varchar(30),
  documento char(8),
  sexo char(1),
  domicilio varchar(30),
  sueldobasico decimal(7,2),
  cantidadhijos tinyint)
  select * from empleados
  exec sp_columns empleados

   insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
  values ('Juan Perez','22333444','m','Sarmiento 123',500,2);
 insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
  values ('Ana Acosta','24555666','f','Colon 134',850,0);
 insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
  values ('Bartolome Barrios','27888999','m','Urquiza 479',10000.80,4);

  insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
  values ('Susana Molina','29000555','f','Salta 876',800.888,3);
    insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
  values ('Susana Molina','29000555','f','Salta 876',800000000.888,3);

  select * from empleados
  where sueldobasico>=900

  select * from empleados 
  where cantidadhijos>0
