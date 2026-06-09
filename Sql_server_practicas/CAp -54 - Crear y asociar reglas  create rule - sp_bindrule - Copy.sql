/*
RESTRICCIONES (constraints), que se establecen en tablas y campos y son controlados automáticamente por SQL Server. 
Hay 3 tipos:
I) DE LOS CAMPOS (hace referencia a los valores válidos para un campo determinado). 
Pueden ser:

a) DEFAULT: especifica un valor por defecto para un campo cuando no se inserta 
explícitamente en un comando "insert".

b) CHECK: especifica un rango de valores que acepta un campo, se emplea en inserciones
y actualizaciones ("insert" y "update").

II) DE LA TABLA (asegura un identificador único para cada registro de una tabla).
Hay 2 tipos:

a) PRIMARY KEY: identifica unívocamente cada uno de los registros; asegura 
que no haya valores duplicados ni valores nulos. Se crea un índice automáticamente.

b) UNIQUE: impide la duplicación de claves alternas (no primarias). 
Se permiten valores nulos. Se crea un índice automáticamente.

III) REFERENCIAL: lo veremos más adelante.

REGLAS (rules) y
VALORES PREDETERMINADOS (defaults).

Las reglas especifican los valores que se pueden ingresar en un campo, 
asegurando que los datos se encuentren en un intervalo de valores específico,
coincidan con una lista de valores o sigan un patrón.
Un campo puede tener solamente UNA regla asociado a él.

Sintaxis de creacion de una regla.
 create rule NOMBREREGLA
 as @VARIABLE CONDICION

 Por convención, nombraremos las reglas comenzando con "RG", 
 el nombre del campo al que se asocia y alguna palabra que haga referencia a la condición.

  create rule RG_sueldo_intervalo
 as @sueldo between 100 and 1000

 comando para relacionar la regla a la tabla.
exec sp_bindrule NOMBREREGLA, 'TABLA.CAMPO';

Ejemplo de una sintaxis
 exec sp_bindrule RG_sueldo_intervalo, 'empleados.sueldo';

La regla debe ser compatible con el tipo de datos del campo al cual se asocia
No se puede crear una regla para campos de tipo text, image, o timestamp.

 una restricción "check" se almacena con la tabla, cuando ésta se elimina, 
 las restricciones también se borran.

 Las reglas son objetos diferentes e independientes de las tablas,
 si eliminamos una tabla, las asociaciones desaparecen, pero las reglas siguen existiendo
 en la base de datos.

 Con "sp_helpconstraint" podemos ver las reglas asociadas a los campos de una tabla.

Con "sp_help" podemos ver todos los objetos de la base de datos activa, incluyendo las reglas,
en tal caso en la columna "Object_type" aparece "rule".

*/


/*

if object_id('empleados') is not null
  drop table empleados;

create table empleados (
  documento varchar(8) not null,
  nombre varchar(30),
  seccion varchar(20),
  fechaingreso datetime,
  fechanacimiento datetime,
  hijos tinyint,
  sueldo decimal(6,2)
);

go

-- Recuerde que las reglas son objetos independientes de las tablas (no se eliminan al 
-- borrar la tabla), así que debemos eliminarlas con las siguientes intrucciones:
if object_id ('RG_documento_patron') is not null
  drop rule RG_documento_patron;
if object_id ('RG_empleados_seccion') is not null
  drop rule RG_empleados_seccion;
if object_id ('RG_empleados_fechaingreso') is not null
  drop rule RG_empleados_fechaingreso;
if object_id ('RG_hijos') is not null
  drop rule RG_hijos;
if object_id ('RG_empleados_sueldo') is not null
  drop rule RG_empleados_sueldo;
if object_id ('RG_empleados_sueldo2') is not null
  drop rule RG_empleados_sueldo2;

  go

insert into empleados 
   values('22222222','Ana Acosta','Contaduria','1990-10-10','1972-10-10',2,700);
insert into empleados 
   values('23333333','Carlos Costa','Contaduria','1990-12-10','1972-05-04',0,750);
insert into empleados 
   values('24444444','Daniel Duarte','Sistemas','1995-05-05','1975-10-06',1,880);
insert into empleados 
   values('25555555','Fabiola Fuentes','Secretaria','1998-02-11','1978-02-08',3,550);
insert into empleados 
   values('26666666','Gaston Garcia','Secretaria','1999-05-08','1981-01-01',3,670);
insert into empleados 
   values('27777777','Ines Irala','Gerencia','2000-04-10','1985-12-12',0,6000);

go

-- Creamos una regla que establezca un patrón para el documento:
create rule RG_documento_patron
   as @documento like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]';

go

-- Ejecutamos el procedimiento almacenado del sistema "sp_help" para 
-- ver si la regla creada anteriormente fue creada:
exec sp_help;

-- Ejecutamos el procedimiento almacenado del sistema "sp_helpconstraint" para ver si está asociada la regla
-- a algún campo de "empleados" (No aparece porque aún no la asociamos):
exec sp_helpconstraint empleados;

-- Si ingresamos un registro con un documento que no cumpla la regla, SQL Server lo acepta porque la regla
-- aún no está asociada al campo:
insert into empleados values('ab888888','Juan Juarez','Secretaria','2001-04-11','1986-11-12',0,600);

-- Asociamos la regla "RG_documento_patron" al campo "documento":
exec sp_bindrule RG_documento_patron, 'empleados.documento';

-- Volvemos a ejecutar "sp_helpconstraint" (aparece la regla):
exec sp_helpconstraint empleados;

go

-- Creamos una regla para restringir los valores que se pueden ingresar en un campo "seccion":
create rule RG_empleados_seccion
 as @seccion in ('Secretaria','Contaduria','Sistemas','Gerencia');

go

-- La asociamos al campo "seccion":
exec sp_bindrule RG_empleados_seccion, 'empleados.seccion';

go

-- Creamos una regla para restringir los valores que se pueden ingresar en el campo "fechaingreso",
-- para que no sea posterior a la fecha actual:
create rule RG_empleados_fechaingreso
 as @fecha <= getdate();

go

-- Asociamos la regla anteriormente creada a los campos "fechaingreso" y "fechanacimiento":
exec sp_bindrule RG_empleados_fechaingreso, 'empleados.fechaingreso';
exec sp_bindrule RG_empleados_fechaingreso, 'empleados.fechanacimiento';

go

-- Creamos una regla para restringir los valores que se pueden ingresar en el campo "hijos":
create rule RG_hijos
 as @hijos between 0 and 20;

go

-- La asociamos al campo "hijos":
exec sp_bindrule RG_hijos, 'empleados.hijos';

go

-- Creamos una regla para restringir los valores que se pueden ingresar en un campo "sueldo":
create rule RG_empleados_sueldo
 as @sueldo>0 and @sueldo<= 5000;

go

-- La asociamos al campo "sueldo":
exec sp_bindrule RG_empleados_sueldo, 'empleados.sueldo';

go

-- Creamos otra regla para restringir los valores que se pueden ingresar en un campo "sueldo":
create rule RG_empleados_sueldo2
 as @sueldo>0 and @sueldo<= 7000;

go
 
-- La asociamos al campo "sueldo" (la nueva regla reeemplaza la asociación anterior):
exec sp_bindrule RG_empleados_sueldo2, 'empleados.sueldo';

insert into empleados values('29999999','Luis Lopez','Secretaria','2002-03-03','1990-09-09',0,6000);

exec sp_help;

exec sp_helpconstraint empleados;

*/

--Primera Practica 

if object_id('vehiculos') is not null
drop table vehiculos

if object_id('RG_patente_patron') is not null
drop rule RG_patente_patron

if object_id('RG_horallegada') is not null
drop rule RG_horallegada

if object_id('RG_vehiculos_tipo') is not null
drop rule RG_vehiculos_tipo

if object_id('RG_vehiculos_tipo2') is not null
drop rule RG_vehiculos_tipo2

if object_id('RG_menor_fechaactual') is not null
drop rule RG_menor_fechaactual

create table vehiculos(
patente char(8) not null,
tipo char(1),
horallegada datetime not null,
horasalida datetime
)
--insercion de registros

 insert into vehiculos values ('AAA111','a','1990-02-01 08:10',null);
 insert into vehiculos values ('BCD222','m','1990-02-01 08:10','1990-02-01 10:10');
 insert into vehiculos values ('BCD222','m','1990-02-01 12:00',null);
 insert into vehiculos values ('CC1234','a','1990-02-01 12:00',null);

 select * from vehiculos

 --creacion de una regla
 create rule RG_patente_patron
 as @patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]'

 exec sp_help   ---permite visualizar las restriciones que se han creado. 

 exec sp_helpconstraint vehiculos --permite visualizar los objecto, restrinciones asociada  a la tabla.

 exec sp_bindrule RG_patente_patron, 'vehiculos.patente'; -- permite vincular las reglas a la tabla, especificamente al campo especificado.

 select * from vehiculos

 insert into vehiculos values ('00000','m','1990-02-01 12:00',null);

 -- creacion de regla

 create rule RG_vehiculos_tipo
 as @tipo in ('a','m')

 exec sp_help
 exec sp_helpconstraint vehiculos

 exec sp_bindrule RG_vehiculos_tipo,'vehiculos.tipo'; ---Asociacion de la regla a la tabla.

 select * from vehiculos


 update vehiculos 
 set tipo ='Z'
 where (patente ='AAA111')

 create rule RG_vehiculos_tipo2
 as @tipo2 in ('a','c','m')

 exec sp_bindrule RG_vehiculos_tipo2, 'vehiculos.tipo';

 exec sp_helpconstraint vehiculos

 exec sp_help

 exec sp_bindrule RG_vehiculos_tipo,'vehiculos.tipo';

  update vehiculos set tipo='c' where patente='AAA111';

   exec sp_bindrule RG_menor_fechaactual, 'vehiculos.horallegada';

   create rule RG_menor_fechaactual
   as @horallegada = getdate()

 exec sp_bindrule RG_menor_fechaactual, 'vehiculos.horallegada';
 select * from vehiculos 

exec sp_bindrule RG_menor_fechaactual, 'vehiculos.horasalida'; --asociacion al campo fecha actual.

 insert into vehiculos values ('NOP555','a','1990-02-01 10:10','1990-02-01 08:30');

 alter table vehiculos 
 add constraint CK_vehiculos_llegada_salida
 check (horallegada<=horasalida)

 exec sp_helpconstraint vehiculos

 alter table vehiculos 
 add constraint DF_vehiculos_tipo
 default 'a'
 for tipo

alter table vehiculos
 drop constraint DF_vehiculos_tipo
 ---no permite ingresar por el default indicado va en conflicto con la regla previamente definida. 
 insert into vehiculos 
 values('STU456',default,'1990-02-01 10:10','1990-02-01 15:30')

 exec sp_helpconstraint vehiculos

 --insercion de registros permitida.
    insert into vehiculos 
 values('STU456',default,getdate(),getdate())

 select * from vehiculos

 sp_helpconstraint vehiculos 

