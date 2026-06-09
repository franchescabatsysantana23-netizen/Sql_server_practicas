/*
Restrinciones a nivel de tabla

*/

--Temario practico

if object_id('libros') is not null
drop table libros

if object_id('editoriales') is not null
drop table editoriales

if object_id('autores') is not null
drop table autores

create table editoriales(
codigo tinyint not null,
nombre varchar(30),
constraint PK_editoriales 
primary key(codigo)
)

create table autores(
codigo int not null,
constraint CK_autores_codigo check(codigo>=0),
nombre varchar(30) not null,
constraint PK_autores_codigo
primary key(codigo),
constraint UQ_autores_nombre
unique(nombre))

create table libros(
codigo int identity,
titulo varchar(40),
codigoautor int not null,
codigoeditorial tinyint not null,
precio decimal(5,2)
constraint DF_libros_precio default (0),
constraint PK_libros_codigo 
primary key clustered (codigo),
constraint UQ_libros_tituloautor
unique(titulo,codigoautor),
constraint FK_libros_editorial
foreign key(codigoeditorial)
references editoriales (codigo)
on update cascade,
constraint FK_libros_autores
foreign key(codigoautor)
references autores(codigo)
on update cascade,
constraint CK_libros_precio_positivo 
check (precio>=0)
)


create table libros(
  codigo int identity,
  titulo varchar(40),
  codigoautor int not null,
  codigoeditorial tinyint not null,
  precio decimal(5,2)
   constraint DF_libros_precio default (0),
  constraint PK_libros_codigo
   primary key clustered (codigo),
  constraint UQ_libros_tituloautor
    unique (titulo,codigoautor),
  constraint FK_libros_editorial
   foreign key (codigoeditorial)
   references editoriales(codigo)
   on update cascade,
  constraint FK_libros_autores
   foreign key (codigoautor)
   references autores(codigo)
   on update cascade,
  constraint CK_libros_precio_positivo check (precio>=0)
);

exec sp_helpconstraint libros
exec sp_helpconstraint autores

exec sp_helpconstraint libros

---Primera Practica

if object_id('Inscriptos') is not null
drop table inscriptos

if object_id('socios') is not null
drop table socios

if object_id('profesores') is not null
drop table profesores

if object_id('deportes') is not null
drop table deportes


--- creaciones de las tablas

create table profesores(
documento char(8) not null,
nombre varchar(30),
domicilio varchar(30),
constraint CK_profesores_documento_patron 
check (documento like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
constraint PK_profesores_documento
primary key(documento))


create table deportes(
codigo tinyint identity,
nombre varchar(20) not null,
dia varchar(30)
constraint DF_deportes_dia default ('sabado'),
profesor char(8),
constraint CK_deportes_dia_lista check (dia in ('Lunes','Martes','Miercoles','Jueves','Viernes','Sabado')),
constraint PK_deportes_codigo
primary key(codigo))
----creacion de la tabla socios. 

create table socios(
numero int identity,
documento char(8),
nombre varchar(30),
domicilio varchar(30),
constraint CK_documento_patron check (documento like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
constraint PK_socios_numero
primary key nonclustered(numero),
constraint UQ_socios_documento
unique clustered(documento))
--creacion de la tabla incriptos


create table inscritos(
numerosocio int not null,
codigodeporte tinyint,
matricula char(1),
constraint PK_inscriptos_numerodeporte
primary key clustered (numerosocio,codigodeporte),
constraint FK_inscriptos_deporte
foreign key(codigodeporte)
references deportes(codigo)
on update cascade,
constraint FK_inscriptos_socios
foreign key(numerosocio)
references socios(numero)
on update cascade
on delete cascade,
constraint CK_matricula_valores check(matricula in ('s','n')))

 insert into profesores values('21111111','Andres Acosta','Avellaneda 111');
 insert into profesores values('22222222','Betina Bustos','Bulnes 222');
 insert into profesores values('23333333','Carlos Caseros','Colon 333');

  insert into deportes values('basquet','lunes',null);
 insert into deportes values('futbol','lunes','23333333');
 insert into deportes values('natacion',null,'22222222');
 insert into deportes values('padle',default,'23333333');
 insert into deportes (nombre,dia) values('tenis','jueves');

  insert into socios values('30111111','Ana Acosta','America 111');
 insert into socios values('30222222','Bernardo Bueno','Bolivia 222');
 insert into socios values('30333333','Camila Conte','Caseros 333');
 insert into socios values('30444444','Daniel Duarte','Dinamarca 444');


  insert into inscritos values(1,3,'s');
 insert into inscritos values(1,5,'s');
 insert into inscritos values(2,1,'s');
 insert into inscritos values(4,1,'n');
 insert into inscritos values(4,4,'s');

 /*
 
8- Realice un "join" (del tipo que sea necesario) para mostrar todos los datos del socio junto con 
el nombre de los deportes en los cuales está inscripto, el día que tiene que asistir y el nombre del 
profesor que lo instruirá.
 */

 select * from socios
 select * from deportes
 select * from inscritos
 select * from profesores

 select s.*,
 d.nombre,d.dia,p.nombre
 from socios s  join inscritos i
 on (i.numerosocio =s.numero) join deportes d
 on (d.codigo =i.codigodeporte)  join profesores p
 on (p.documento =d.profesor)

 /*
 8- Realice un "join" (del tipo que sea necesario) para mostrar todos los datos del socio junto con 
el nombre de los deportes en los cuales está inscripto, el día que tiene que asistir y el nombre del 
profesor que lo instruirá.
 */


  select s.*,d.nombre as deporte,d.dia,p.nombre as profesor
  from socios as s
  join inscritos as i
  on numero=i.numerosocio
  join deportes as d
  on d.codigo=i.codigodeporte
  left join profesores as p
  on d.profesor=p.documento;

  /*
  9- Realice la misma consulta anterior pero incluya los socios que no están inscriptos en ningún 
deporte.
  */

  
  select s.*,d.nombre as deporte,d.dia,p.nombre as profesor
  from socios as s
  full join inscritos as i
  on numero=i.numerosocio
  left join deportes as d
  on d.codigo=i.codigodeporte
  left join profesores as p
  on d.profesor=p.documento;


  /*
  10- Muestre todos los datos de los profesores, incluido el deporte que dicta y el día, incluyendo 
los profesores que no tienen asignado ningún deporte.
4 registros.
  */
select p.*,d.nombre as deporte, d.dia
from profesores p left join deportes d
on d.profesor =p.documento



/*
11- Muestre todos los deportes y la cantidad de inscriptos, incluyendo aquellos deportes para los 
cuales no hay inscriptos.
*/



 select * from socios
 select * from deportes
 select * from inscritos
 select * from profesores



 /*
 12- Muestre las restricciones de "socios".
3 restricciones y 1 "foreign key" de "inscriptos" que la referencia.
 
 */
 exec sp_helpconstraint socios	

  exec sp_helpconstraint deportes

  exec sp_helpconstraint profesores
  exec sp_helpconstraint inscritos