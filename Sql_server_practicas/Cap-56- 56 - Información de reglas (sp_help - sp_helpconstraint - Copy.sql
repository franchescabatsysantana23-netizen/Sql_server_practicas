/*
consulta de la regla 
exec sp_help NOMBREREGLA; muestra nombre, propietario, tipo y fecha de creación.
Con "sp_help", no sabemos si las reglas existentes están o no asociadas a algún campo.

"sp_helpconstraint" retorna una lista de todas las restricciones que tiene una tabla.
Podemos ver las reglas asociadas a una tabla con este procedimiento almacenado:
 exec sp_helpconstraint NOMBRETABLA;

 - constraint_type: indica que es una regla con "RULE", nombrando el campo al que está asociada.
 - constraint_name: nombre de la regla.
 - constraint_keys: muestra el texto de la regla.

 Para ver el texto de una regla empleamos el procedimiento almacenado
 "sp_helptext" seguido del nombre de la regla:

 exec sp_helptext NOMBREREGLA;
 También se puede consultar la tabla del sistema "sysobjects", que nos muestra el nombre y varios
 datos de todos los objetos de la base de datos actual. La columna "xtype" indica el tipo de objeto, 
 en caso de ser una regla aparece el valor "R":

 select * from sysobjects;

 Si queremos ver todas las reglas creadas por nosotros, podemos tipear:

 select * from sysobjects
  where xtype='R' and-- tipo regla
  name like 'RG%';--búsqueda con comodín

*/

if object_id('empleados') is not null
drop table empleados

if object_id('RG_sueldo') is not null
drop rule RG_sueldo

if object_id('RG_seccion_lista') is not null
drop rule RG_seccion_lista

create table empleados(
  documento char(8) not null,
  nombre varchar(30) not null,
  seccion varchar(20),
  sueldo decimal(6,2),
  primary key(documento)
);

select * from empleados

create rule RG_sueldo
as @sueldo between 100 and 1000

exec sp_bindrule RG_sueldo, 'empleados.sueldo'

--- Creamos una regla con una lista de valores para "seccion":

create rule RG_seccion_lista
as @seccion in ('Sistemas','Secretaria','Contaduria')

exec sp_help RG_sueldo --permite visualizar una regla en especifico. 
exec sp_help RG_seccion_lista



exec sp_help RG_sueldo;

exec sp_helpconstraint empleados; -- visualizacion de las restrincion de la tabla empleados. 

exec sp_bindrule RG_seccion_lista, 'empleados.seccion';

exec sp_helpconstraint empleados;

exec sp_helptext "RG_seccion_lista"; ---permite visualizar el detalle de la regla.

-- Deshacemos la asociación de la regla "RG_sueldo" y la eliminamos:
exec sp_unbindrule 'empleados.sueldo'; 
drop rule RG_sueldo;

exec sp_help RG_sueldo;

select * from sysobjects ---> permite visualizar las Reglas
  where xtype='R' and
  name like '%seccion%';


  select * from sysobjects ---> permite visualizar las Reglas
  where xtype='R'
  
  select * from sysobjects ---> permite visualizar las restrinciones unique. 
  where xtype='UQ'

    select * from sysobjects ---> permite visualizar las restrinciones de tipo primary key. 
  where xtype='PK'

  
    select * from sysobjects ---> permite visualizar las restrinciones de tipo foreign key. 
  where xtype='FK'

  select * from sysobjects ---> permite visualizar las restrinciones de tipo constraint. 
  where xtype='C'

  exec sp_helptext CK_alumnos_notafinal --> permite visualizar la restrincion de tipo constraint. 


