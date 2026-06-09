/*
create TIPODEINDICE index NOMBREINDICE
 on TABLA(CAMPO);
 "TIPODEINDICE" indica si es agrupado (clustered) o no agrupado (nonclustered).
 Si se intenta crear un índice unique para un campo que tiene valores duplicados, SQL Server no lo permite.
se crea un índice agrupado único para el campo "codigo" de la tabla "libros":
 create unique clustered index I_libros_codigo
 on libros(codigo);

 create nonclustered index I_libros_titulo
 on libros(titulo);
  Los campos de un índice compuesto tienen que ser de la misma tabla
  create index I_libros_autoreditorial
 on libros(autor,editorial);

 SQL Server crea automáticamente índices cuando se establece una restricción "primary key" o "unique" en una tabla. 
 Al crear una restricción "primary key", si no se especifica, el índice será agrupado (clustered) a menos que ya exista 
 un índice agrupado para dicha tabla. 
 Al crear una restricción "unique", si no se especifica, el índice será no agrupado (non-clustered).
 alter table libros
  add constraint PK_libros_codigo
  primary key nonclustered (codigo);
   exec sp_helpindex libros;---permite visualizar los indices registrados en la tabla libros. 

   los indices son registrados en la siguiente tabla del sql server. 
   sysindexes
    select name from sysindexes
    where name like 'I_%';
*/

if object_id('libros') is not null
  drop table libros;

   create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15)
);

select * from libros

create unique clustered index I_libros_titulo
on libros(titulo)

create nonclustered index I_index_titulo
on libros(titulo)

exec sp_helpindex libros

---creacion de indice de tipo nonclustered. 
alter table libros
add constraint PK_libros_codigo
primary key nonclustered (codigo)

exec sp_helpindex libros

exec sp_helpconstraint libros

create index I_libros_autoreditorial
on libros(autor,editorial)

select * from sysindexes
where name like 'I_%'

select name from sysindexes
where name like 'I_%'

---Primera Practica

if object_id('alumnos') is not null
drop table alumnos

create table alumnos(
legajo char(5) not null,
documento char(8) not null,
apellido varchar(30),
nombre varchar(30),
notafinal decimal(4,2)
)

 insert into alumnos values ('A123','22222222','Perez','Patricia',5.50);
 insert into alumnos values ('A234','23333333','Lopez','Ana',9);
 insert into alumnos values ('A345','24444444','Garcia','Carlos',8.5);
 insert into alumnos values ('A348','25555555','Perez','Daniela',7.85);
 insert into alumnos values ('A457','26666666','Perez','Fabian',3.2);
 insert into alumnos values ('A589','27777777','Gomez','Gaston',6.90);

 select * from alumnos
 ---creacion de indice agrupado. 
 create unique clustered index I_alumnos_apellido
 on alumnos(apellido)
  
  ---creacion de indice no agrupado. 
 create nonclustered index I_alumnos_apellido
 on alumnos(apellido)


 --Creacion de restrincion agrupada. 
alter table alumnos 
add constraint PK_alumnos_legajo
primary key clustered(legajo)

alter table alumnos 
add constraint PK_alumnos_legajo
primary key nonclustered(legajo)

 exec sp_helpindex alumnos;

 exec sp_helpconstraint alumnos

 --creacion de indice no agrupado de tipo index, en la tabla alumnos.  
 create unique nonclustered index I_alumnos_documento
 on alumnos(documento)

  insert into alumnos values ('A5899','27777777','Gomez','Gaston',6.90);

  select * from alumnos

---creacion de indice de tipo no agrupado.
  create nonclustered index I_alumnos_Apellido_Nombre
  on alumnos(apellido,nombre)

  exec sp_helpconstraint alumnos

  exec sp_helpindex alumnos  --visualizacion de los indices agrupados y no agrupados.

  select name from sysindexes
  where name like '%alumnos%'

  create unique nonclustered index I_alumnos_documento
  on alumnos(documento)

  --creacion de una restrincion de tipo unique. 
  alter table alumnos 
  add constraint UQ_alumnos_documento 
  unique (documento)

  exec sp_helpconstraint alumnos

   select name from sysindexes
  where name like 'I_%';