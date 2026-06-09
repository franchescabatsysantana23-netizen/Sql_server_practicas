/*
creacion de la regla
 exec sp_bindrule NOMBREREGLA, 'TIPODEDATODEFINIDOPORELUSUARIO', 'futureonly';
 para desvincular un tipo de dato definido por el usuario.

 exec sp_unbindrule 'TIPODEDATODEFINIDOPORELUSUARIO';
 Un tipo de dato definido por el usuario puede tener una sola regla asociada.

 Cuando obtenemos información del tipo da dato definido por el usuario ejecutando "sp_help", 
 en la columna "rule_name" se muestra el nombre de la regla asociada a dicho tipo de dato; muestran "none" cuando no tiene regla asociada.

*/
--contenido practico

if object_id('alumnos') is not null
drop table alumnos

if object_id('docentes') is not null
drop table docentes

if exists(select * from systypes
where name ='tipo_documento')
exec sp_droptype tipo_documento


/*
Creamos un tipo de dato definido por el usuario llamado 
-- "tipo_documento" basado en el tipo "char" que permita 8 caracteres
-- y valores nulos:
*/

exec sp_addtype tipo_documento, 'char(8)','null'
exec sp_help tipo_documento

--Creacion de la tabla alumnos
create table alumnos(
documento tipo_documento,
nombre varchar(30))

---eliminacion de la regla asociada a documento si existe.

if object_id('RG_documento')is not null
drop rule RG_documento 

create rule RG_documento
as @documento like '[0-5][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'


-- Asociamos la regla al tipo de datos "tipo_documento" especificando que 
-- solamente se aplique a los futuros campos de este tipo:

exec sp_bindrule RG_documento, 'tipo_documento','futureonly' --vinculacion del tipo de dato. 
exec sp_helpconstraint alumnos -- visualizacion de las restrinciones en la tabla alumnos.

--creacion de la tabla docentes.

create table docentes(
documento tipo_documento,
nombre varchar(30))

exec sp_helpconstraint docentes

-- Ingresamos un registro en "alumnos" con valores para documento que infrinjan la regla,
-- Lo acepta porque en esta tabla no se aplica la regla. 
-- Pero no podríamos ingresar un valor como el anterior en la tabla "docentes"
-- la cual si tiene asociada la regla.

insert into alumnos values('a111111','Ana Acosta');

select * from alumnos

--retiro de la restrincion.
exec sp_unbindrule tipo_documento

--- vinculacion de restrincion sin uso de futureonly
exec sp_bindrule RG_documento, tipo_documento

-- visualizacion de restrincion en ambas tablas

exec sp_helpconstraint alumnos
exec sp_helpconstraint docentes

--Eliminamos si existe, la regla "RG_documento2":
--eliminacion de regla 2. 
if object_id('RG_documento2') is not null
drop rule RG_documento2

-- Creamos la regla llamada "RG_documento2" que permita 8 caracteres 
-- que solamente pueden ser dígitos del 0 al 9 para todas las posiciones:

create rule RG_documento2
  as @documento like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]';

  --asociamos la regla al tipo de datos "tipo_documento"(ya tiene una regla asociada ):
  exec sp_bindrule RG_documento2 , 'tipo_documento'

  --Veamos si la asociación fue reemplazada en el tipo de datos:
  exec sp_help tipo_documento -- visualizacion del tipo de dato, reglas del documento
  --visualizacion de la restrinciones 

  exec sp_helpconstraint alumnos
  exec sp_helpconstraint docentes

  --- Asociamos la regla "RG_documento" al campo "documento" de "alumnos":

  exec sp_bindrule RG_documento, 'alumnos.documento' --asociacion de la regla al campo documento. 
  exec sp_helpconstraint alumnos -- visualizacion de la restrincion creada. 
  exec sp_help tipo_documento -- visualizacion de los detalles de la regla. 

  -- Intentamos ingresar un valor para "documento" aceptado por la regla asociada al
-- tipo de dato pero no por la regla asociada al campo (no lo permite):

  insert into alumnos values('777777','Juan Lopez')

  select * from alumnos
  
-- Ingrese un valor para "documento" aceptado por la regla asociada al campo (si lo permite):
  insert into alumnos values ('55555555','Juan Lopez');
  
 ---contenido de la practica

 if object_id('empleados') is not null
 drop table empleados

 if object_id('clientes') is not null
 drop table clientes


 if exists(select * from systypes
 where name ='tipo_año')
 exec droptype tipo_año


  exec sp_addtype tipo_año,'int','null'
 /*
 Ejecute el procedimiento almacenado "sp_help" junto al nombre del tipo de dato definido 
anteriormente para obtener información del mismo:
 */

 sp_help tipo_año ---> visualizacion del tipo de dato. 

 ---creacion de la tabla empleados

  create table empleados(
  documento char(8),
  nombre varchar(30),
  añoingreso tipo_año
 );

 --6- Elimine la regla llamada "RG_año" si existe:
 if object_id('RG_año') is not null 
 drop rule RG_año

/*
7- Cree la regla que permita valores integer desde 1990 (año en que se inauguró el comercio) y el 
año actual:
*/

create rule RG_año
as @año between 1990 and datepart(year,getdate())

---Asociacion de la regla al campo 

exec sp_bindrule  RG_año, 'tipo_año', 'futureonly';

--visualizacion de la restrincion en el campo empleado. 

exec sp_helpconstraint empleados

/*Creacion de la tablas clientes */

create table clientes(
documento char(8),
nombre varchar(30),
añoingreso tipo_año );

exec sp_helpconstraint clientes

 insert into empleados values('11111111','Ana Acosta',2050);

  insert into clientes values('22222222','Juan Perez',2050);

  -- desvinculacion de la regla
  exec sp_unbindrule 'tipo_año'

  --visualizacion de la restrincion de empleado

  exec sp_helpconstraint clientes

  --Asociacion de la regla
  exec sp_bindrule RG_año,'tipo_año' --Asociacion de la regla 

  /*
  17- Intente agregar una fecha de ingreso fuera del intervalo que admite la regla en cualquiera de 
las tablas (ambas tienen la asociación):
  */

   insert into empleados values('33333333','Romina Guzman',1900);

   /*
   18- Vea la información del tipo de dato:
   */
 exec sp_help tipo_año; -- visualizacion de las restrinciones del tipo de dato definido por el usuario. 

 /*
 Elimine la regla llamada 'RG_añonegativo'
 */
 if object_id('RG_añonegativo') is not null
 drop rule RG_añonegativo

 --creacion de la regla

 create rule RG_añonegativo
 as @año  between -2000 and -1;

---21- Asocie la regla "RG_añonegativo" al campo "añoingreso" de la tabla "clientes":

exec sp_bindrule  RG_añonegativo, 'clientes.añoingreso';

exec sp_helpconstraint clientes  --- visualizacion de la restrinciones.

exec sp_help tipo_año --visualizacion de los detalles del tipo de dato. 


--24- Intente ingresar un registro con valor '-1900' para el campo "añoingreso" de "empleados":
 insert into empleados values('44444444','Pedro Perez',-1900);

