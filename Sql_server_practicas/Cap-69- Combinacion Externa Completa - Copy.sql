/*
Una combinación externa completa ("full outer join" o "full join") retorna todos los registros de ambas tablas. Si un registro de una
tabla izquierda no encuentra coincidencia en la tabla derecha, las columnas correspondientes a campos de la tabla derecha aparecen seteadas a "null",
y si la tabla de la derecha no encuentra correspondencia en la tabla izquierda, los campos de esta última aparecen conteniendo "null".

*/

if object_id('libros') is not null
  drop table libros;
if object_id('editoriales') is not null
  drop table editoriales;

create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30) default 'Desconocido',
  codigoeditorial tinyint not null,
  precio decimal(5,2)
);

create table editoriales(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
);

go

insert into editoriales values('Planeta');
insert into editoriales values('Emece');
insert into editoriales values('Siglo XXI');

insert into libros values('El aleph','Borges',1,20);
insert into libros values('Martin Fierro','Jose Hernandez',1,30);
insert into libros values('Aprenda PHP','Mario Molina',2,50);
insert into libros values('Java en 10 minutos',default,4,45);

-- Combinación externa completa para obtener todos los registros de ambas tablas,
-- incluyendo los libros cuyo código de editorial no existe en la tabla "editoriales"
-- y las editoriales de las cuales no hay correspondencia en "libros":
 select titulo,nombre
  from editoriales as e
  full join libros as l
  on codigoeditorial = e.codigo;

  select * from libros
  select * from editoriales

  ---Primera Practica

  if object_id('deportes') is not null
  drop table deportes

  if object_id('inscriptos') is not null
  drop table inscriptos

  create table deportes(
  codigo tinyint identity,
  nombre varchar(30),
  profesor varchar(30),
  primary key(codigo))

  create table inscriptos(
  documento char(8),
  codigodeporte tinyint not null,
  matricula char(1) --'s'=paga 'n'=impaga
  )

 insert into deportes values('tenis','Marcelo Roca');
 insert into deportes values('natacion','Marta Torres');
 insert into deportes values('basquet','Luis Garcia');
 insert into deportes values('futbol','Marcelo Roca');

 insert into inscriptos values('22222222',3,'s');
 insert into inscriptos values('23333333',3,'s');
 insert into inscriptos values('24444444',3,'n');
 insert into inscriptos values('22222222',2,'s');
 insert into inscriptos values('23333333',2,'s');
 insert into inscriptos values('22222222',4,'n'); 
 insert into inscriptos values('22222222',5,'n'); 

 --3- Muestre todos la información de la tabla "inscriptos", y consulte la tabla "deportes" para obtener el nombre de cada deporte (6 registros)

 select * from inscriptos
 select * from deportes

 select i.documento,i.matricula, d.nombre 
 from deportes d inner join inscriptos i
 on d.codigo =i.codigodeporte

 --Empleando un "left join" con "deportes" obtenga todos los datos de los inscriptos (7 registros)
 select i.documento,i.matricula, d.nombre 
 from inscriptos i  
 left join deportes d
on (i.codigodeporte =d.codigo)

--Obtenga la misma salida anterior empleando un "rigth join".

 select i.documento,i.matricula, d.nombre 
 from deportes d
 right join inscriptos i
on (d.codigo=i.codigodeporte)

---6--Muestre los deportes para los cuales no hay inscriptos, empleando un "left join" (1 registro)

 select i.documento,i.matricula, d.nombre 
 from deportes d
 left join inscriptos i
on (d.codigo=i.codigodeporte)
where i.codigodeporte is null


--7- Muestre los documentos de los inscriptos a deportes que no existen en la tabla "deportes" (1 registro)
 select i.documento,i.matricula, d.nombre 
 from inscriptos i  
 left join deportes d
on (i.codigodeporte =d.codigo)
where d.codigo is null

---8- Emplee un "full join" para obtener todos los datos de ambas tablas, incluyendo las inscripciones a deportes inexistentes en "deportes" y los deportes que no tienen inscriptos (8 registros)

 select i.documento,i.matricula, d.nombre 
 from inscriptos i  
 full join deportes d
on (i.codigodeporte =d.codigo)