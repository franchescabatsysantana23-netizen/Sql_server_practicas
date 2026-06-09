/*
Las tablas temporales son visibles solamente en la sesión actual.

Las tablas temporales se eliminan automáticamente al acabar la sesión o la función o procedimiento almacenado en el cual fueron definidas. Se pueden eliminar con "drop table".
Pueden ser locales (son visibles sólo en la sesión actual) o globales (visibles por todas las sesiones).
Una tabla temporal no puede tener una restricción "foreign key" ni ser indexada, tampoco puede ser referenciada por una vista.
para consultar las tablas temporales podemos hacerlo con:
select *from tempdb..sysobjects;
*/

--Ejercicio
create table #usuarios(
nombre varchar(30),
clave varchar(10),
primary key(nombre))

insert into #usuarios values('Mariano','Payaso')

select * from tempdb..sysobjects --> consulta de las tablas temporales. 

drop table #usuarios