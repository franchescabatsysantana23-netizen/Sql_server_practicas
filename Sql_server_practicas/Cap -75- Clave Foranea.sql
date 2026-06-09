/*
el campo "codigoeditorial" de "libros" es una clave foránea, se emplea para enlazar la tabla "libros" con "editoriales" 
y es clave primaria en "editoriales" con el nombre "codigo".
Las claves foráneas y las claves primarias deben ser del mismo tipo para poder enlazarse.

Con la restricción "foreign key" se define un campo (o varios) cuyos valores coinciden con la clave primaria de la
misma tabla o de otra, es decir, se define una referencia a un campo con una restricción "primary key" o "unique" de la misma tabla o de otra.

La integridad referencial asegura que se mantengan las referencias entre las claves primarias y las externas.

 alter table NOMBRETABLA1
  add constraint NOMBRERESTRICCION
  foreign key (CAMPOCLAVEFORANEA)
  references NOMBRETABLA2 (CAMPOCLAVEPRIMARIA);

 - NOMBRETABLA1 referencia el nombre de la tabla a la cual le aplicamos la restricción,
- NOMBRERESTRICCION es el nombre que le damos a la misma,
- luego de "foreign key", entre paréntesis se coloca el campo de la tabla a la que le aplicamos la restricción que será establecida como clave foránea,
- luego de "references" indicamos el nombre de la tabla referenciada y el campo que es clave primaria en la misma.

 alter table libros
 add constraint FK_libros_codigoeditorial
  foreign key (codigoeditorial)
  references editoriales(codigo);

 alter table libros
 add constraint FK_libros_codigoeditorial
  foreign key (codigoeditorial)
  references editoriales(codigo);


  if object_id('libros') is not null
  drop table libros;
if object_id('editoriales') is not null
  drop table editoriales;
*/

create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  codigoeditorial tinyint
);
create table editoriales(
  codigo tinyint,
  nombre varchar(20),
  primary key (codigo)
);
insert into editoriales values(1,'Emece');
insert into editoriales values(2,'Planeta');
insert into editoriales values(3,'Siglo XXI');

insert into libros values('El aleph','Borges',1);
insert into libros values('Martin Fierro','Jose Hernandez',2);
insert into libros values('Aprenda PHP','Mario Molina',2);

-- Agregamos una restricción "foreign key" a la tabla "libros":

alter table libros
add constraint FK_libros_codigoeditorial
foreign key(codigoeditorial)
references editoriales(codigo)

exec sp_helpconstraint libros --- tambien visualiza la restrinciones de tipo foreign key. 
insert into libros default values

select * from libros
exec sp_helpconstraint editoriales;
exec sp_helpconstraint libros;


---Primera Practica

if object_id('clientes') is not null
drop table clientes

if object_id('provincias') is not null
drop table provincias

create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia tinyint
 );

  create table provincias(
  codigo tinyint not null,
  nombre varchar(20)
 );

 --2- Intente agregar una restricción "foreign key" a la tabla "clientes" que haga referencia al campo "codigo" de "provincias":

 alter table clientes
 add constraint FK_clientes_codigoProvincia
 foreign key (codigoprovincia)
 references provincias(codigo)
 ---3- Establezca una restricción "primary key" al campo "codigo" de "provincias":
 alter table provincias
 add constraint PK_provincias_codigo
 primary key(codigo)


 --4- Ingrese algunos registros para ambas tablas:
 insert into provincias values(1,'Cordoba');
 insert into provincias values(2,'Santa Fe');
 insert into provincias values(3,'Misiones');
 insert into provincias values(4,'Rio Negro');

 insert into clientes values('Perez Juan','San Martin 123','Carlos Paz',1);
 insert into clientes values('Moreno Marcos','Colon 234','Rosario',2);
 insert into clientes values('Acosta Ana','Avellaneda 333','Posadas',3);
 insert into clientes values('Luisa Lopez','Juarez 555','La Plata',6);

---Intente agregar la restricción "foreign key" del punto 2 a la tabla "clientes":
  alter table clientes
 add constraint FK_clientes_codigoProvincia
 foreign key (codigoprovincia)
 references provincias(codigo)

 delete from clientes where codigoprovincia =6

 alter table clientes
 add constraint FK_clientes_codigoProvincia
 foreign key (codigoprovincia)
 references provincias(codigo)

 exec sp_helpconstraint clientes
 --7- Intente agregar un cliente con un código de provincia inexistente en "provincias".
  insert into clientes values('Luisa Lopez','Juarez 555','La Plata',6);
  ---8- Intente eliminar el registro con código 3, de "provincias".
  delete from provincias where codigo =3

---9- Elimine el registro con código "4" de "provincias".
  delete from provincias where codigo =4
  ---10- Intente modificar el registro con código 1, de "provincias".
    delete from provincias where codigo =1
---11- Vea las restricciones de "clientes".
exec sp_helpconstraint clientes

exec sp_helpconstraint provincias