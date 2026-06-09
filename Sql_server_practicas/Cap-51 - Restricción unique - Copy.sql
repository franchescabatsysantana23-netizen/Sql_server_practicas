/*
La restricción "unique" impide la duplicación de claves alternas (no primarias), es decir,
especifica que dos registros no puedan tener el mismo valor en un campo.
Se permiten valores nulos.
Se emplea cuando ya se estableció una clave primaria (como un número de legajo) pero se necesita asegurar 
que otros datos también sean únicos y no se repitan (como número de documento).

 alter table NOMBRETABLA
 add constraint NOMBRERESTRICCION
 unique (CAMPO);

 Esta restricción permite valores nulos, 
 asi que si se ingresa el valor "null" para el campo "documento", se acepta.

 Por convención, cuando demos el nombre a las restricciones "unique" 
 seguiremos la misma estructura: "UQ_NOMBRETABLA_NOMBRECAMPO"

*/

if object_id('alumnos') is not null
  drop table alumnos;

create table alumnos(
  legajo char(4) not null,
  apellido varchar(20),
  nombre varchar(20),
  documento char(8)
);

alter table alumnos
 add constraint PK_alumnos_legajo
 primary key(legajo);

 alter table alumnos
 add constraint UQ_alumnos_documento
 unique (documento);

insert into alumnos values('A111','Lopez','Ana','22222222');
insert into alumnos values('A123','Garcia','Maria','23333333');

exec sp_helpconstraint alumnos

--Primera Practica

 if object_id('remis') is not null
  drop table remis;

  create table remis(
  numero tinyint identity,
  patente char(6),
  marca varchar(15),
  modelo char(4)
 );

 insert into remis values('ABC123','Renault clio','1990');
 insert into remis values('DEF456','Peugeot 504','1995');
 insert into remis values('DEF456','Fiat Duna','1998');
 insert into remis values('GHI789','Fiat Duna','1995');
 insert into remis values(null,'Fiat Duna','1995');

 select * from remis

 --agregar el campo patente, la restrincion unique.
 alter table remis 
 add constraint UQ_remis_patente 
 unique(patente)
 exec sp_helpconstraint remis

 select * from remis

 delete  from remis
 where numero =3

  insert into remis values(null,'Huyunday','1999');
   exec sp_helpconstraint remis