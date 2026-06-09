/*
Se pueden deshabilitar las restricciones "check" y "foreign key", a las demás se las debe eliminar.
sintaxis basica para agregar una restrincion foreign key.

 alter table NOMBRETABLA1
  with OPCIONDECHEQUEO
  add constraint NOMBRECONSTRAINT
  foreign key (CAMPOCLAVEFORANEA)
  references NOMBRETABLA2 (CAMPOCLAVEPRIMARIA)
  on update OPCION
  on delete OPCION;

  La opción "with OPCIONDECHEQUEO" especifica si se controlan los datos existentes o no con "check" y "nocheck".
La comprobación de restricciones se puede deshabilitar para modificar, eliminar o agregar datos a una tabla sin comprobar la restricción.

lter table NOMBRETABLA
 OPCIONDECHEQUEO constraint NOMBRERESTRICCION;

 En el siguiente ejemplo deshabilitamos la restricción creada anteriormente:

 alter table libros
 nocheck constraint FK_libros_codigoeditorial;
Para habilitar una restricción deshabilitada se ejecuta la misma instrucción pero con la cláusula "check" o "check all":

 alter table libros
  check constraint FK_libros_codigoeditorial;

  sp_helpconstraint --> visualiza la restrinciones de una tabla.

   las cláusulas "check" y "nocheck" permiten habilitar o deshabilitar restricciones "foreign key" (y "check").

   Ejemplo de eliminacion de una restrincion. 

   alter table TABLA
  drop constraint NOMBRERESTRICCION;
Eliminamos la restricción de "libros":

 alter table libros
  drop constraint FK_libros_codigoeditorial;


*/

---Contenido

if object_id('libros') is not null
  drop table libros;

if object_id('editoriales') is not null
  drop table editoriales;

  create table libros(
  codigo int not null,
  titulo varchar(40),
  autor varchar(30),
  codigoeditorial tinyint,
  primary key (codigo)
);

create table editoriales(
  codigo tinyint not null,
  nombre varchar(20),
  primary key (codigo)
);


insert into editoriales values(1,'Planeta');
insert into editoriales values(2,'Emece');
insert into editoriales values(3,'Paidos');

insert into libros values(1,'Uno','Richard Bach',1);
insert into libros values(2,'El aleph','Borges',2);
insert into libros values(3,'Aprenda PHP','Mario Molina',5);


alter table libros
 with nocheck
 add constraint FK_libros_codigoeditorial
 foreign key (codigoeditorial)
 references editoriales(codigo);


 -- Para poder ingresar, modificar o eliminar datos a una tabla sin que SQL Server 
-- compruebe la restricción debemos deshabilitarla:
alter table libros
 nocheck constraint FK_libros_codigoeditorial;


 -- visualizacion de la restrincion

 exec sp_helpconstraint libros

 exec sp_helpconstraint editoriales

 insert into libros values(4,'Ilusiones','Richard Bach',6);

 alter table libros
 check constraint FK_libros_codigoeditorial;

 select * from libros

 delete from libros where codigo =2

 exec sp_helpconstraint libros;

 --- eliminamos la restrincion foreign key. 

 alter table libros
  drop constraint FK_libros_codigoeditorial;


  exec sp_helpconstraint libros;
  
exec sp_helpconstraint editoriales;


--- Primera Practica

if object_id('clientes') is not null
drop table clientes

if object_id('provincias') is not null
drop table provincias

--- Creacion de la tabla clientes


create table clientes(
codigo int identity,
nombre varchar(30),
domicilio varchar(30),
ciudad varchar(20),
codigoprovincia tinyint,
primary key (codigo)
)

--creacion de la tabla provincias.
create table provincias(
codigo tinyint,
nombre varchar(20),
primary key(codigo))

--- insercion de los registros en la tabla provincias. 

 insert into provincias values(1,'Cordoba');
 insert into provincias values(2,'Santa Fe');
 insert into provincias values(3,'Misiones');
 insert into provincias values(4,'Rio Negro');

 --- insercion de los registros en la tabla clientes: 

 insert into clientes values('Perez Juan','San Martin 123','Carlos Paz',1);
 insert into clientes values('Moreno Marcos','Colon 234','Rosario',2);
 insert into clientes values('Garcia Juan','Sucre 345','Cordoba',1);
 insert into clientes values('Lopez Susana','Caseros 998','Posadas',3);
 insert into clientes values('Marcelo Moreno','Peru 876','Viedma',4);
 insert into clientes values('Lopez Sergio','Avellaneda 333','La Plata',5);

 select * from clientes
 select * from provincias

/* Intente agregar una restricción "foreign key" para que los códigos de provincia de "clientes" 
existan en "provincias" con acción en cascada para actualizaciones y eliminaciones, sin especificar 
la opción de comprobación de datos*/

alter table clientes
add constraint FK_clientes_codigoprovincia
foreign key (codigoprovincia) 
references provincias(codigo)
on update cascade
on delete cascade

---5- Agregue la restricción anterior pero deshabilitando la comprobación de datos existentes:
alter table clientes
with nocheck
add constraint FK_clientes_codigoprovincia
foreign key (codigoprovincia) 
references provincias(codigo)
on update cascade
on delete cascade

--- Eliminacion de restrincion foreign key. 
alter table clientes 
drop constraint  FK_clientes_codigoprovincia

-- visualizacion de restrinciones de la tabla clientes

exec sp_helpconstraint clientes

-- visualizacion de restrinciones de la tabla provincias.

exec sp_helpconstraint provincias


---8- Deshabilite la restricción "foreign key" de "clientes":
alter table clientes 
nocheck constraint FK_clientes_codigoprovincia

-- visualizacion de la restrinciones de la tabla. 

exec sp_helpconstraint clientes

-- insercion de registros. 
 insert into clientes values('Garcia Omar','San Martin 100','La Pampa',6);

select * from clientes

--12- Elimine una provincia de las cuales haya clientes:
delete from provincias where codigo =2

select * from clientes
select * from provincias

--14-- Modifique un código de provincia de la cual haya clientes:

update provincias
set codigo =9 
where codigo =3

--consulta de las tabla clientes y provincias

select * from clientes
select * from provincias

---Intente eliminar de la tabla provincia

drop table provincias

--actualizar la tabla clientes para que proceda a realizar check a los registros que contiene.

alter table clientes
check constraint FK_clientes_codigoprovincia

---18- Intente agregar un cliente con código de provincia inexistente en "provincias":
 insert into clientes values('Hector Ludueña','Paso 123','La Plata',8);

select * from clientes
select * from provincias 

---Actualizacion de la tabla provincias.
update provincias
set codigo =20
where codigo =4

--- consulta de la tabla provincias y clientes

select * from provincias
select * from clientes
--21- Elimine una provincia de la cual haya referencia en "clientes":
delete from provincias where codigo =1

--- Eliminacion de la restrincion foreign key.
alter table clientes
drop constraint FK_clientes_codigoprovincia

--visualizacion de la restrinciones en la tabla clientes. 

exec sp_helpconstraint clientes

-- eliminacion de la restrincion foreign key.

drop table provincias -- eliminacion de la tabla provincias. 

