/*
La restricción "default" especifica un valor por defecto para un campo 
cuando no se inserta explícitamente en un comando "insert".

 alter table NOMBRETABLA
 add constraint NOMBRECONSTRAINT
 default VALORPORDEFECTO
 for CAMPO;
 "DF_NOMBRETABLA_NOMBRECAMPO".

Se permite una restricción "default" por campo y no se puede emplear junto con la propiedad "identity". 
Una tabla puede tener varias restricciones "default" para sus distintos campos.
La restricción "default" acepta valores tomados de funciones del sistema, por ejemplo,
podemos establecer que el valor por defecto de un campo de tipo datetime sea "getdate()".
Podemos ver información referente a las restriciones de una tabla con el procedimiento almacenado "sp_helpcontraint":
 exec sp_helpconstraint libros;

 - constraint_type: el tipo de restricción y sobre qué campo está establecida 
  (DEFAULT on column autor),
- constraint_name: el nombre de la restricción (DF_libros_autor),
- delete_action y update_action: no tienen valores para este tipo de restricción.
- status_enabled y status_for_replication: no tienen valores para este tipo 
  de restricción.
- constraint_keys: el valor por defecto (Desconocido).

*/
if object_id('libros') is not null
drop table libros

create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30) default 'Desconocido',
  editorial varchar(15),
  precio decimal(6,2)
);

select * from libros

insert into libros (titulo,editorial) values('Martin Fierro','Emece');
insert into libros (titulo,editorial) values('Aprenda PHP','Emece');

exec sp_helpconstraint libros;

create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  precio decimal(6,2)
);
---para agregar un constraint en la tabla libros. 
alter table libros 
add constraint DF_libros_autor
default 'Desconocido' for autor
---para agregar un constraint en la libros 
alter table libros 
add primary key(codigo)

insert into libros (titulo,editorial) values('Martin Fierro','Emece');
insert into libros default values; ---otra forma de insercion

select * from libros

alter table libros
  add constraint DF_libros_precio
  default 0
  for precio;

---Primera Practica

 if object_id('visitantes') is not null
  drop table visitantes;

  create table visitantes(
  numero int identity,
  nombre varchar(30),
  edad tinyint,
  domicilio varchar(30),
  ciudad varchar(20),
  montocompra decimal(6,2) not null)

  --alteracion de la tabla visitantes, para agregar un valor por defecto al campo cordoba.
  alter table visitantes
  add constraint DF_visitantes_ciudad
  default 'Cordoba'
  for ciudad

  alter table visitantes
  add constraint DF_visitantes_montocompra
  default 0 for montocompra


 insert into visitantes values ('Susana Molina',35,'Colon 123',default,59.80);
 insert into visitantes (nombre,edad,domicilio) values ('Marcos Torres',29,'Carlos Paz');
 insert into visitantes values ('Mariana Juarez',45,'Carlos Paz',null,23.90);

 select * from visitantes

 exec sp_helpconstraint visitantes

 alter table visitantes 
 add constraint DF_visitnates_ciudad 
 default 'Mexico' for ciudad

  alter table visitantes 
 add constraint DF_visitantes_numero 
 default '1' for numero


 ---Segunda Practica 
 --investigacion si existe la tabla libros, la elimina si la elimina si la misma existe. 
 if object_id('vehiculos') is not null
 drop table vehiculos

 create table vehiculos(
  patente char(8),
  tipo char(8),
  horallegada datetime,
  horasalida datetime,
  primary key(patente,horasalida))

  select * from vehiculos

  alter table vehiculos 
  add constraint DF_vehiculos_tipo
  default 'a' for tipo

    alter table vehiculos 
  add constraint DF_vehiculos_tipo
  default 'm' for tipo

  alter table vehiculos
  add constraint DF_vehiculos_horallegada
  default getdate() for horallegada


  alter table vehiculos
  add primary key (patente)

  exec sp_helpconstraint vehiculos
  insert into vehiculos values('BVB111',default,default,null);

  insert into vehiculos default values

  select * from vehiculos

  update  vehiculos 
  set patente =2
  where (horallegada is not null)
 
 delete from vehiculos

