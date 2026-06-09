/*
Para eliminar una restricción, la sintaxis básica es la siguiente:

 alter table NOMBRETABLA
  drop NOMBRERESTRICCION

*/

--Primera Practica
--eliminar el archivo libros
if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int not null,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  precio decimal(6,2)
);

-- Definimos una restricción "primary key" para nuestra tabla "libros" para asegurarnos 
-- que cada libro tendrá un código diferente y único:

alter table libros
add constraint PK_LIBROS_CODIGO
PRIMARY KEY(CODIGO)

 --Definimos una restricción "check" para asegurarnos que el precio no será negativo:
 ALTER TABLE LIBROS
 ADD CONSTRAINT CK_LIBROS_PRECIOS
 CHECK (PRECIO>0);

 -- Definimos una restricción "default" para el campo "autor" para que almacene "Desconocido":

 ALTER TABLE LIBROS 
 ADD CONSTRAINT DF_LIBROS_AUTOR 
 DEFAULT 'DESCONOCIDO'
 FOR AUTOR

 -- Definimos una restricción "default" para el campo "precio" para que almacene 0:
 ALTER TABLE LIBROS
 ADD CONSTRAINT DF_LIBROS_PRECIOS
 DEFAULT 0
 FOR PRECIO
 -- Vemos las restricciones:
 EXEC sp_helpconstraint LIBROS
 --Eliminamos la restricción "DF_libros_autor":
 ALTER TABLE LIBROS 
 DROP CONSTRAINT DF_LIBROS_AUTOR

 ALTER TABLE LIBROS
 DROP CONSTRAINT CK_LIBROS_PRECIOS

 ALTER TABLE LIBROS
 DROP DF_LIBROS_PRECIOS

 --pRIMERA PRACTICA
 IF OBJECT_ID('vehiculos') is not null
 drop table vehiculos

 create table vehiculos(
 patente char(6),
 tipo char(1),
 horallegada datetime not null,
 horasalida datetime)


 alter table vehiculos
 add constraint PK_vehiculos_tipo
 check(tipo in ('a','m'));

 exec sp_helpconstraint vehiculos

 alter table vehiculos
 add constraint DF_vehiculos_tipo
 default 'a'
 for tipo


  alter table vehiculos
 add constraint CK_vehiculos_patente_patron
 check (patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]');

 alter table vehiculos
add constraint PK_vehiculos_patentellegada
primary key(patente,horallegada)

-- modificacion para que el campo patente no admita valores nulos
alter table vehiculos alter column patente char(6) not null

 insert into vehiculos values('SDR456','a','2004/10/10 10:10',null);
  insert into vehiculos values('SDR456','m','2007/10/10 10:10',null);
   insert into vehiculos values('SDR456','m','2005/10/10 12:10',null);
    insert into vehiculos values('SDR111','m','2005/10/10 10:10',null);

	select * from vehiculos

exec sp_helpconstraint vehiculos;

alter table vehiculos 
drop constraint DF_vehiculos_tipo

--eliminacion de varias restrinciones constraint al mismo tiempo
alter table vehiculos 
drop constraint PK_vehiculos_tipo,PK_vehiculos_patentellegada,CK_vehiculos_patente_patron











