/*
Para agregar un campo y establecer una restricción, la sintaxis básica es la siguiente:

 alter table TABLA
  add CAMPO DEFINICION
  constraint NOMBRERESTRICCION TIPO;

  Agregamos a la tabla "libros", el campo "titulo" de tipo varchar(30) y una restricción "unique" con índice agrupado:

 alter table libros
  add titulo varchar(30) 
  constraint UQ_libros_autor unique clustered;

  alter table libros
  add codigo int identity not null
  constraint PK_libros_codigo primary key nonclustered;
Agregamos a la tabla "libros", el campo "precio" de tipo decimal(6,2) y una restricción "check":

 alter table libros
  add precio decimal(6,2)
  constraint CK_libros_precio check (precio>=0);


*/

---Contenido Practico

if object_id('libros') is not null 
drop table libros

-- creacion de la tabla libros
create table libros(
autor varchar(30),
editorial varchar(15))

-- Agregamos el campo "titulo" de tipo varchar(30) y una 
-- restricción "unique" con índice agrupado:

alter table libros
add titulo varchar(30)
constraint UQ_libros_autor unique clustered

-- visualizacion de la estructura de la tabla libros

exec sp_columns libros

-- Agregamos el campo "codigo" de tipo int identity not null
-- y en la misma sentencia una restricción "primary key" con índice no agrupado:

alter table libros
add codigo int identity not null
constraint PK_libros_codigo primary key nonclustered

-- Agregamos el campo "precio" de tipo decimal(6,2) y una restricción "check" 
-- que no permita valores negativos para dicho campo:

alter table libros
add precio decimal(6,2)
constraint CK_libros_precio check(precio>=0)

-- visualizacion de la restrinciones de la tabla libros. 

exec sp_helpconstraint libros 

---Primera Practica

--eliminacion del objeto empleados si este existe. 
if object_id('empleados') is not null
drop table empleados

--creacion de la tabla empleados. 
create table empleados(
documento char(8) not null,
nombre varchar(10),
domicilio varchar(30),
ciudad varchar(20) default 'Buenos Aires')

--2- Agregue el campo "legajo" de tipo int identity y una restricción "primary key":

alter table empleados 
add legajo int identity 
constraint PK_empleados_legajo
primary key(legajo)

--3- Vea si la estructura cambió y si se agregó la restricción:
exec sp_columns empleados -- visualizacion de los campos
exec sp_helpconstraint empleados -- visualizacion de las restrinciones de la tabla. 

---4- Agregue el campo "hijos" de tipo tinyint y en la misma sentencia una restricción "check" que no permita valores superiores a 30:
alter table empleados 
add hijos tinyint 
constraint CK_empleados_hijos 
check (hijos<=30)


--5- Ingrese algunos registros:
 insert into empleados values('22222222','Juan Lopez','Colon 123','Cordoba',2);
 insert into empleados values('23333333','Ana Garcia','Sucre 435','Cordoba',3);


 /*
 6- Intente agregar el campo "sueldo" de tipo decimal(6,2) no nulo y una restricción "check" que no 
permita valores negativos para dicho campo:

7- Agregue el campo "sueldo" de tipo decimal(6,2) no nulo, una restricción "check" que no permita 
valores negativos para dicho campo y una restricción "default" que almacene el valor "0":
 */

 alter table empleados 
 add sueldos decimal(6,2) not null
 constraint CK_empleados_sueldos 
 check(sueldos>0)
 constraint DF_empleados_sueldos default 1

 /*
 Visualizacion de los registros 
 */

 select * from empleados

 /*
 Visualizacion de la estructura de la tabla empleados
 */
 exec sp_columns empleados

 /*
  Vea las restricciones
 */

 exec sp_helpconstraint empleados