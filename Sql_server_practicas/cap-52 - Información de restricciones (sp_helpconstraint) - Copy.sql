/*
El procedimiento almacenado "sp_helpconstraint" seguido del nombre de una tabla muestra la información 
referente a todas las restricciones establecidas en dicha tabla, devuelve las siguientes columnas:

- constraint_type: tipo de restricción. Si es una restricción de campo (default o check) indica sobre qué
campo fue establecida. Si es de tabla (primary key o unique) indica el tipo de índice creado 
(tema que veremos posteriormente).

- constraint_name: nombre de la restricción.

- delete_action: solamente es aplicable para restricciones de tipo "foreign key" 
(la veremos posteriormente).

- update_action: sólo es aplicable para restricciones de tipo "foreign key"
(la veremos posteriormente).

- status_enabled: solamente es aplicable para restricciones de tipo "check" y "foreign key". 
Indica si está habilitada (Enabled) o no (Disabled). Indica "n/a" en cualquier restricción para 
la que no se aplique.

- status_for_replication: solamente es aplicable para restricciones de tipo "check" y "foreign key"
. Indica "n/a" en cualquier restricción para la que no se aplique.

- constraint_keys: Si es una restricción "check" muestra la condición de chequeo; si es una restricción
"default", el valor por defecto; si es una "primary key" o "unique" muestra el/ los campos a los que se
aplicaron la restricción.

*/

--Primera Practica

if object_id('alumnos') is not null
drop table alumnos

create table alumnos(
legajo char(4) not null,
apellido varchar(20),
nombre varchar(20),
documento char(8),
domicilio varchar(30),
ciudad varchar(30),
notafinal decimal(4,2))

--Agregar a la tabla alumnos la primary key legajo.
alter table alumnos 
add constraint PK_alumnos_legajo
primary key(legajo);

--agregar la restrincion unique a la tabla documento

alter table alumnos 
add constraint UQ_alumnos_documento
unique (documento);

--agregar las restrincion de check al campo notafinal que admita valores entre 0 y 10.
alter table alumnos
add constraint CK_alumnos_notafinal
check (notafinal between 0 and 10)

--agregar al campo ciudad un valor por defecto cuando no sea insertado registros.

alter table alumnos 
add constraint DF_alumnos_ciudad
default 'Cordoba' 
for ciudad

--se visualiza las restrinciones de la tabla alumnos. 
exec sp_helpconstraint alumnos

--desabilitacion de la restrincion check
alter table alumnos 
nocheck constraint CK_alumnos_notafinal
--habilitacion de la restrincion
alter table alumnos 
check constraint CK_alumnos_notafinal