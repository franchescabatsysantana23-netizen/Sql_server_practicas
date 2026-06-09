/*
Se pueden emplear subconsultas que retornen un conjunto de registros de varios campos en lugar de una tabla.

Se la denomina tabla derivada y se coloca en la cláusula "from" para que la use un "select" externo.

La tabla derivada debe ir entre paréntesis y tener un alias para poder referenciarla. La sintaxis básica es la siguiente:

 select ALIASdeTABLADERIVADA.CAMPO
 from (TABLADERIVADA) as ALIAS;
La tabla derivada es una subsonsulta.



*/


--contenido Practico

if object_id('detalles') is not null
  drop table detalles;
if object_id('facturas') is not null
  drop table facturas;
if object_id('clientes') is not null
  drop table clientes;

create table clientes(
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  primary key(codigo)
);

create table facturas(
  numero int not null,
  fecha datetime,
  codigocliente int not null,
  primary key(numero),
  constraint FK_facturas_cliente
   foreign key (codigocliente)
   references clientes(codigo)
   on update cascade
);

create table detalles(
  numerofactura int not null,
  numeroitem int not null, 
  articulo varchar(30),
  precio decimal(5,2),
  cantidad int,
  primary key(numerofactura,numeroitem),
   constraint FK_detalles_numerofactura
   foreign key (numerofactura)
   references facturas(numero)
   on update cascade
   on delete cascade,
);

go

insert into clientes values('Juan Lopez','Colon 123');
insert into clientes values('Luis Torres','Sucre 987');
insert into clientes values('Ana Garcia','Sarmiento 576');

set dateformat ymd;

insert into facturas values(1200,'2018-01-15',1);
insert into facturas values(1201,'2018-01-15',2);
insert into facturas values(1202,'2018-01-15',3);
insert into facturas values(1300,'2018-01-20',1);

insert into detalles values(1200,1,'lapiz',1,100);
insert into detalles values(1200,2,'goma',0.5,150);
insert into detalles values(1201,1,'regla',1.5,80);
insert into detalles values(1201,2,'goma',0.5,200);
insert into detalles values(1201,3,'cuaderno',4,90);
insert into detalles values(1202,1,'lapiz',1,200);
insert into detalles values(1202,2,'escuadra',2,100);
insert into detalles values(1300,1,'lapiz',1,300);

-- Recuperar el número de factura, el código de cliente, 
-- la fecha y la suma total de todas las facturas:
 select f.*,
  (select sum(d.precio*cantidad)
    from detalles as d
    where f.numero=d.numerofactura) as total
 from facturas as f;

-- Ahora utilizaremos el resultado de la consulta anterior como una tabla 
-- derivada que emplearemos en lugar de una tabla para realizar un "join" 
-- y recuperar el número de factura, el nombre del cliente y
-- el monto total por factura:
 select td.numero,c.nombre,td.total
  from clientes as c
  join (select f.*,
   (select sum(d.precio*cantidad)
    from detalles as d
    where f.numero=d.numerofactura) as total
  from facturas as f) as td
  on td.codigocliente=c.codigo;

  --contenido practico
  ---Eliminacion de las tablas

  if object_id('inscriptos') is not null
  drop table inscriptos

  if object_id('socios') is not null
  drop table socios

  if object_id('deportes') is not null
  drop table deportes

  --creacion de las tablas

  create table socios(
  documento char(8) not null,
  nombre varchar(30),
  domicilio varchar(30),
  primary key(documento))

  create table deportes(
  codigo tinyint identity,
  nombre varchar(20),
  profesor varchar(15),
  primary key(codigo))

  create table inscriptos(
  documento char(8) not null,
  codigodeporte tinyint not null,
  año char(4),
  matricula char(1),--'s'=paga, 'n'=impaga
  primary key(documento,codigodeporte,año),
  constraint FK_inscriptos_socio
   foreign key (documento)
   references socios(documento)
   on update cascade
   on delete cascade)

   --insercion de los distintos registros 

 insert into socios values('22222222','Ana Acosta','Avellaneda 111');
 insert into socios values('23333333','Betina Bustos','Bulnes 222');
 insert into socios values('24444444','Carlos Castro','Caseros 333');
 insert into socios values('25555555','Daniel Duarte','Dinamarca 44');

 insert into deportes values('basquet','Juan Juarez');
 insert into deportes values('futbol','Pedro Perez');
 insert into deportes values('natacion','Marina Morales');
 insert into deportes values('tenis','Marina Morales');

 insert into inscriptos values ('22222222',3,'2006','s');
 insert into inscriptos values ('23333333',3,'2006','s');
 insert into inscriptos values ('24444444',3,'2006','n');
 insert into inscriptos values ('22222222',3,'2005','s');
 insert into inscriptos values ('22222222',3,'2007','n');
 insert into inscriptos values ('24444444',1,'2006','s');
 insert into inscriptos values ('24444444',2,'2006','s');

 /*
 4- Realice una consulta en la cual muestre todos los datos de las inscripciones, incluyendo el 
nombre del deporte y del profesor.
Esta consulta es un join.

5- Utilice el resultado de la consulta anterior como una tabla derivada para emplear en lugar de una 
tabla para realizar un "join" y recuperar el nombre del socio, el deporte en el cual está inscripto, 
el año, el nombre del profesor y la matrícula.
 
 */
 select i.*,d.nombre ,d.profesor
 from inscriptos i inner join deportes d
 on (d.codigo =i.codigodeporte)


 --punto 5. 
  select i.documento,i.codigodeporte, i.año,i.matricula,
  td.nombre,td.profesor
  from inscriptos i inner join 
  (select d.nombre, d.profesor,d.codigo
  from deportes d)  as td
  on td.codigo =i.codigodeporte

  select s.nombre, td.documento,td.codigodeporte,td.matricula,td.nombre,td.profesor
  from socios s inner join 
 ( select i.*,d.nombre ,d.profesor
 from inscriptos i inner join deportes d
 on (d.codigo =i.codigodeporte)
 ) td on td.documento =s.documento



  select s.nombre,td.deporte,td.profesor,td.año,td.matricula
  from socios as s
  join (select i.documento,i.codigodeporte,d.nombre as deporte, año, matricula, d.profesor
	from deportes as d
	join inscriptos as i
	on d.codigo=i.codigodeporte) as td
  on td.documento=s.documento;
