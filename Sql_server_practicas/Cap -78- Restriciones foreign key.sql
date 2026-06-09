/*
La restricción "foreign key" tiene las cláusulas "on delete" y "on update" que son opcionales.
Estas cláusulas especifican cómo debe actuar SQL Server frente a eliminaciones y modificaciones de las tablas referenciadas en la restricción.
Las opciones para estas cláusulas son las siguientes:

- "no action": indica que si intentamos eliminar o actualizar un valor de la clave primaria de la tabla referenciada (TABLA2) que tengan referencia 
en la tabla principal (TABLA1), se genere un error y la acción no se realice; es la opción predeterminada.

- "cascade": indica que si eliminamos o actualizamos un valor de la clave primaria en la tabla referenciada (TABLA2), 
los registros coincidentes en la tabla principal (TABLA1), también se eliminen o modifiquen; es decir, si eliminamos o
modificamos un valor de campo definido con una restricción "primary key" o "unique", dicho cambio se extiende al valor de clave externa 
de la otra tabla (integridad referencial en cascada).
 alter table TABLA1
  add constraint NOMBRERESTRICCION
  foreign key (CAMPOCLAVEFORANEA)
  references TABLA2(CAMPOCLAVEPRIMARIA)
  on delete OPCION
  on update OPCION;

   no se especifica acción para eliminaciones (o se especifica "no action"), y se intenta eliminar
   un registro de la tabla referenciada (editoriales) cuyo valor de clave primaria (codigo) existe en la tabla principal (libros), la acción no se realiza.

se especifica "cascade" para eliminaciones ("on delete cascade") y elimina un registro de la tabla referenciada (editoriales) 
cuyo valor de clave primaria (codigo) existe en la tabla principal(libros), la eliminación de la tabla referenciada (editoriales) se realiza 
y se eliminan de la tabla principal (libros) 

se especifica "cascade" para actualizaciones ("on update cascade") y se modifica un valor de clave primaria (codigo) de la tabla referenciada (editoriales) 
que existe en la tabla principal (libros), SQL Server actualiza el registro de la tabla referenciada (editoriales) y todos los registros coincidentes en la 
tabla principal (libros).
 La tabla "editoriales" tiene como clave primaria el campo "codigo".

 alter table libros
  add constraint FK_libros_codigoeditorial
  foreign key (codigoeditorial)
  references editoriales(codigo)
  on update cascade
  on delete cascade;

*/

---Primera Practica

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


insert into editoriales values(1,'Emece');
insert into editoriales values(2,'Planeta');
insert into editoriales values(3,'Siglo XXI');

insert into libros values(1,'El aleph','Borges',1);
insert into libros values(2,'Martin Fierro','Jose Hernandez',2);
insert into libros values(3,'Aprenda PHP','Mario Molina',2);

 --- Agregacion de una restrincion
alter table libros 
add constraint FK_libros_codigoeditorial
foreign key (codigoeditorial)
references editoriales(codigo)
on update cascade
on delete cascade;


-- Si actualizamos un valor de código de "editoriales", la modificación se extiende a 
-- todos los registros de la tabla "libros" que hacen referencia a ella en "codigoeditorial":
   update editoriales set codigo=10 where codigo=1;


select titulo, autor, e.codigo,nombre
  from libros as l
  join editoriales as e
  on codigoeditorial=e.codigo;

  -- Si eliminamos una editorial, se borra tal editorial de "editoriales" 
-- y todos los registros de "libros" de dicha editorial:
delete from editoriales where codigo=2;

select * from libros;
  select * from editoriales
  select * from libros
