/*
Un join es una operación que relaciona dos o más tablas para obtener un resultado que incluya datos (campos y registros) de ambas;
Hay tres tipos de combinaciones:
combinaciones internas (inner join o join),
combinaciones externas y
combinaciones cruzadas.
"on" hace coincidir registros de ambas tablas basándose en el valor de tal campo
La condicion de combinación, es decir, el o los campos por los que se van a combinar (parte "on"), 
se especifica según las claves primarias y externas.
Se puede incluir en la consulta join la cláusula "where" para restringir los registros que retorna el resultado; también "order by", "distinct", etc..
*/

if object_id('clientes') is not null
drop table clientes

if object_id('provincias') is not null
drop table provincias


create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia tinyint not null,
  primary key(codigo)
 );

  create table provincias(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
 );

  insert into provincias (nombre) values('Cordoba');
 insert into provincias (nombre) values('Santa Fe');
 insert into provincias (nombre) values('Corrientes');

  insert into clientes values ('Lopez Marcos','Colon 111','Córdoba',1);
 insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje',1);
 insert into clientes values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
 insert into clientes values ('Perez Luis','Sarmiento 444','Rosario',2);
 insert into clientes values ('Pereyra Lucas','San Martin 555','Cruz del Eje',1);
 insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe',2);
 insert into clientes values ('Torres Fabiola','Alem 777','Ibera',3);

 select c.nombre, c.domicilio,c.ciudad, p.nombre
 from clientes c
 inner join provincias p
 on (p.codigo =c.codigoprovincia)

  select c.nombre, c.domicilio,c.ciudad, p.nombre
 from clientes c
 inner join provincias p
 on (p.codigo =c.codigoprovincia)
 order by p.nombre

   select c.nombre, c.domicilio,c.ciudad, p.nombre
 from clientes c
 inner join provincias p
 on (p.codigo =c.codigoprovincia)
 where p.nombre ='Santa Fe'

 --Segunda Practica

  if (object_id('inscriptos')) is not null
  drop table inscriptos;
 if (object_id('inasistencias')) is not null
  drop table inasistencias;

 create table inscriptos(
  nombre varchar(30),
  documento char(8),
  deporte varchar(15),
  matricula char(1), --'s'=paga 'n'=impaga
  primary key(documento,deporte)
 );

 create table inasistencias(
  documento char(8),
  deporte varchar(15),
  fecha datetime
 );

--2- Ingrese algunos registros para ambas tablas:
 insert into inscriptos values('Juan Perez','22222222','tenis','s');
 insert into inscriptos values('Maria Lopez','23333333','tenis','s');
 insert into inscriptos values('Agustin Juarez','24444444','tenis','n');
 insert into inscriptos values('Marta Garcia','25555555','natacion','s');
 insert into inscriptos values('Juan Perez','22222222','natacion','s');
 insert into inscriptos values('Maria Lopez','23333333','natacion','n');

 insert into inasistencias values('22222222','tenis','2006-12-01');
 insert into inasistencias values('22222222','tenis','2006-12-08');
 insert into inasistencias values('23333333','tenis','2006-12-01');
 insert into inasistencias values('24444444','tenis','2006-12-08');
 insert into inasistencias values('22222222','natacion','2006-12-02');
 insert into inasistencias values('23333333','natacion','2006-12-02');

 select inscriptos.nombre, inasistencias.deporte,
 inasistencias.fecha
 from inscriptos  inner join inasistencias
 on inasistencias.documento =inscriptos.documento
 order by inscriptos.nombre, inasistencias.deporte

  select inscriptos.nombre, inasistencias.deporte,
 inasistencias.fecha
 from inscriptos  inner join inasistencias
 on ((inasistencias.documento =inscriptos.documento)
 and (inasistencias.deporte =inscriptos.deporte))
 where inscriptos.nombre ='Juan Perez'
 order by inscriptos.nombre, inasistencias.deporte

   select inscriptos.nombre, inasistencias.deporte,
 inasistencias.fecha
 from inscriptos  inner join inasistencias
 on ((inasistencias.documento =inscriptos.documento)
 and (inasistencias.deporte =inscriptos.deporte))
 where matricula ='S'

  select nombre,insc.deporte, ina.fecha
  from inscriptos as insc
  join inasistencias as ina
  on insc.documento=ina.documento and
  insc.deporte=ina.deporte
  where insc.matricula='s';