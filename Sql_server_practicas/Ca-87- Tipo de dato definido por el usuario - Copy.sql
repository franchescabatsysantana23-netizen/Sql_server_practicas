/*
los tipos de datos especifican el tipo de información (caracteres, números, fechas) que pueden almacenarse en un campo.
SQL Server proporciona distintos tipos de datos del sistema (char, varchar, int, decimal, datetime, etc.) y permite tipos de datos definidos 
por el usuario siempre
que se basen en los tipos de datos existentes.

proceso para definicion de tipo de datos definidos por el usuario.

 exec sp_addtype NOMBRENUEVOTIPO, 'TIPODEDATODELSISTEMA', 'OPCIONNULL';
ejemplo de tipo de dato:
 exec sp_addtype tipo_documento, 'char(8)', 'null';
 la tabla systypes --> se registran informacion del tipo de datos. 
 consulta SQL: select name from systypes;
*/
--contenido Practico

--eliminacion del objeto alumnos si este existe . 
if object_id('alumnos') is not null
drop table alumnos

-- eliminacion del tipo de dato documento si este existe. 
if exists (select * from systypes
where name ='tipo_documento')
exec sp_droptype tipo_documento

--ejecucion del tipo de dato.
exec sp_addtype tipo_documento, 'char(8)','null'


--visualizacion del tipo de dato creado
exec sp_help tipo_documento

create table alumnos(
documento tipo_documento,
nombre varchar(30))

---insercion de registro

insert into alumnos values('12345678','Ana Acosta')

select * from alumnos


/*
Eliminacion del objeto empleados
*/

if object_id('empleados') is not null
drop table empleados

/*
Defina un nuevo tipo de dato llamado "tipo_legajo"
*/
/*eliminacion del tipo de dato*/
if exists(select name from systypes
where name ='tipo_legajo')
exec sp_droptype tipo_legajo

exec sp_addtype tipo_legajo, 'char(8)','not null' ---creacion del tipo de datos legajo. 

exec sp_help tipo_legajo ---visualizacion del tipo de dato legajo. 

---creacion de la tabla empleados.

create table empleados(
legajo tipo_legajo,
documento char(8),
nombre varchar(30))


---insercion de registros con valores nulos

insert into empleados default values
---7- Ingrese un registro con valores válidos.
insert into empleados values('12345678','5678655','franchesca')
