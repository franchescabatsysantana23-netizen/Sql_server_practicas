/*

Se pueden emplear varios join para enlazar varias tablas.
 Cada resultado de un join es una tabla que puede combinarse con otro join.


*/

if object_id('libros') is not null
  drop table libros;
if object_id('autores') is not null
  drop table autores;
if object_id('editoriales') is not null
  drop table editoriales;

create table libros(
  codigo int identity,
  titulo varchar(40),
  codigoautor int not null,
  codigoeditorial tinyint not null,
  precio decimal(5,2),
  primary key(codigo)
);

create table autores(
  codigo int identity,
  nombre varchar(20),
  primary key (codigo)
);

create table editoriales(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
);


insert into editoriales values('Planeta');
insert into editoriales values('Emece');
insert into editoriales values('Siglo XXI');
insert into editoriales values('Plaza');
 
insert into autores values ('Richard Bach');
insert into autores values ('Borges');
insert into autores values ('Jose Hernandez');
insert into autores values ('Mario Molina');
insert into autores values ('Paenza');
 
insert into libros values('El aleph',2,2,20);
insert into libros values('Martin Fierro',3,1,30);
insert into libros values('Aprenda PHP',4,3,50);
insert into libros values('Uno',1,1,15);
insert into libros values('Java en 10 minutos',0,3,45);
insert into libros values('Matematica estas ahi',0,0,15);
insert into libros values('Java de la A a la Z',4,0,50);

-- Recuperamos todos los datos de los libros consultando las tres tablas:

select titulo, a.nombre,e.nombre, precio
from autores as a
inner join libros as l
on codigoautor =a.codigo
inner join editoriales as e
on codigoeditorial =e.codigo


---- Podemos combinar varios tipos de join en una misma sentencia:
select titulo,a.nombre,e.nombre,precio
  from autores as a
  right join libros as l
  on codigoautor=a.codigo
  left join editoriales as e
  on codigoeditorial=e.codigo;

  ---Primera Practica

  if object_id('socios') is not null
  drop table socios

  if object_id('deportes') is not null
  drop table deportes

  if object_id('inscriptos') is not null
  drop table inscriptos

  create table socios(
  documento char(8) not null, 
  nombre varchar(30),
  domicilio varchar(30),
  primary key(documento)
 );

  create table deportes(
  codigo tinyint identity,
  nombre varchar(20),
  profesor varchar(15),
  primary key(codigo)
 );

  create table inscriptos(
  documento char(8) not null, 
  codigodeporte tinyint not null,
  anio char(4),
  matricula char(1),--'s'=paga, 'n'=impaga
  primary key(documento,codigodeporte,anio)
 );


 
---3- Ingrese algunos registros en "socios":
 insert into socios values('22222222','Ana Acosta','Avellaneda 111');
 insert into socios values('23333333','Betina Bustos','Bulnes 222');
 insert into socios values('24444444','Carlos Castro','Caseros 333');
 insert into socios values('25555555','Daniel Duarte','Dinamarca 44');
--4- Ingrese algunos registros en "deportes":
 insert into deportes values('basquet','Juan Juarez');
 insert into deportes values('futbol','Pedro Perez');
 insert into deportes values('natacion','Marina Morales');
 insert into deportes values('tenis','Marina Morales');

--5- Inscriba a varios socios en el mismo deporte en el mismo año:
 insert into inscriptos values ('22222222',3,'2006','s');
 insert into inscriptos values ('23333333',3,'2006','s');
 insert into inscriptos values ('24444444',3,'2006','n');

--6- Inscriba a un mismo socio en el mismo deporte en distintos años:
 insert into inscriptos values ('22222222',3,'2005','s');
 insert into inscriptos values ('22222222',3,'2007','n');

--7- Inscriba a un mismo socio en distintos deportes el mismo año:
 insert into inscriptos values ('24444444',1,'2006','s');
 insert into inscriptos values ('24444444',2,'2006','s');

 /*
 8- Ingrese una inscripción con un código de deporte inexistente y un documento de socio que no 
exista en "socios":
 insert into inscriptos values ('26666666',0,'2006','s');
9- Muestre el nombre del socio, el nombre del deporte en que se inscribió y el año empleando 
diferentes tipos de join.
10- Muestre todos los datos de las inscripciones (excepto los códigos) incluyendo aquellas 
inscripciones cuyo código de deporte no existe en "deportes" y cuyo documento de socio no se 
encuentra en "socios".
11- Muestre todas las inscripciones del socio con documento "22222222".
 */


 select c.nombre, c.documento,d.nombre from socios c
 inner join inscriptos i
 on (i.documento =c.documento)
 inner join deportes d
 on (d.codigo =i.codigodeporte)
 where c.documento ='22222222'

 select * from deportes


  select c.nombre,i.anio,d.nombre from socios c
 inner join inscriptos i
 on (i.documento =c.documento)
 inner join deportes d
 on (d.codigo =i.codigodeporte)

  select s.nombre,d.nombre,anio,matricula
  from deportes as d
  full join inscriptos as i
  on codigodeporte=d.codigo
  full join socios as s
  on s.documento=i.documento;