/*
Ejemplo de sintaxis

select CAMPOSNUEVATABLA
  into NUEVATABLA
  from TABLA
  where CONDICION;

*/


--Contenido Practico

if object_id('libros')is not null
  drop table libros;
if object_id('editoriales')is not null
  drop table editoriales;

create table libros( 
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(20),
  precio decimal(5,2),
  primary key(codigo)
); 

go

insert into libros values('Uno','Richard Bach','Planeta',15);
insert into libros values('El aleph','Borges','Emece',25);
insert into libros values('Matematica estas ahi','Paenza','Nuevo siglo',18);
insert into libros values('Aprenda PHP','Mario Molina','Nuevo siglo',45);
insert into libros values('Ilusiones','Richard Bach','Planeta',14);
insert into libros values('Java en 10 minutos','Mario Molina','Nuevo siglo',50);

-- Creamos una tabla llamada "editoriales" que contenga los nombres de las editoriales:
select distinct editorial as nombre
  into editoriales
  from libros;

  select distinct editorial [nombre]
  into editoriales1
  from libros;

  select distinct editorial nombre
  into editoriales12
  from libros;


  select * from libros

-- Veamos la nueva tabla:
select * from editoriales1;
select * from editoriales;
select * from editoriales12

-- Necesitamos una nueva tabla llamada "librosporeditorial" que contenga la cantidad 
-- de libros de cada editorial. Primero eliminamos la tabla, si existe:
if object_id('cantidadporeditorial') is not null
  drop table cantidadporeditorial;

-- Creamos la nueva tabla:
select editorial as nombre,count(*) as cantidad
  into cantidadporeditorial
  from libros
  group by editorial;

select * from cantidadporeditorial;

-- Queremos una tabla llamada "ofertas4" que contenga los mismos campos que "libros" 
-- y guarde los 4 libros más económicos. Primero eliminamos, si existe, la tabla "ofertas4":
if object_id('ofertas4') is not null
  drop table ofertas4;

-- Creamos "ofertas4" e insertamos la consulta de "libros":
select top 4 *
  into ofertas4
  from libros
  order by precio asc;

select * from ofertas4;

-- Agregamos una columna a la tabla "editoriales" que contiene la ciudad
-- en la cual está la casa central de cada editorial:
alter table editoriales add ciudad varchar(30);

go

-- Actualizamos dicho campo:
update editoriales set ciudad='Cordoba' where nombre='Planeta';
update editoriales set ciudad='Cordoba' where nombre='Emece';
update editoriales set ciudad='Buenos Aires' where nombre='Nuevo siglo';

-- Queremos una nueva tabla llamada "librosdecordoba" que contenga los títulos y autores
-- de los libros de editoriales de Cordoba. En primer lugar, la eliminamos, si existe:
if object_id('librosdecordoba') is not null
  drop table librosdecordoba;

 -- Consultamos las 2 tablas y guardamos el resultado en la nueva tabla que estamos creando:
select titulo,autor
  into librosdecordoba
  from libros
  join editoriales
  on editorial=nombre 
  where ciudad='Cordoba';

select * from librosdecordoba;

---contenido practico

if object_id('empleados')is not null 
drop table empleados

if object_id('sucursales') is not null
drop table sucursales


create table sucursales(
codigo int identity,
ciudad varchar(30) not null,
primary key (codigo))


create table empleados(
documento char(8) not null,
nombre varchar(30) not null,
domicilio varchar(30),
seccion varchar(20),
sueldo decimal(6,2),
codigosucursal int,
primary key(documento),
constraint FK_empleados_sucursal
foreign key (codigosucursal)
references sucursales(codigo)
on update cascade)

--insercion de registros

 insert into sucursales values('Cordoba');
 insert into sucursales values('Villa Maria');
 insert into sucursales values('Carlos Paz');
 insert into sucursales values('Cruz del Eje');

 insert into empleados values('22222222','Ana Acosta','Avellaneda 111','Secretaria',500,1);
 insert into empleados values('23333333','Carlos Caseros','Colon 222','Sistemas',800,1);
 insert into empleados values('24444444','Diana Dominguez','Dinamarca 333','Secretaria',550,2);
 insert into empleados values('25555555','Fabiola Fuentes','Francia 444','Sistemas',750,2);
 insert into empleados values('26666666','Gabriela Gonzalez','Guemes 555','Secretaria',580,3);
 insert into empleados values('27777777','Juan Juarez','Jujuy 777','Secretaria',500,4);
 insert into empleados values('28888888','Luis Lopez','Lules 888','Sistemas',780,4);
 insert into empleados values('29999999','Maria Morales','Marina 999','Contaduria',670,4);

 /*
 5- Realice un join para mostrar todos los datos de "empleados" incluyendo la ciudad de la sucursal:
 select documento,nombre,domicilio,seccion,sueldo,ciudad
 */
 select documento, nombre, domicilio, seccion, sueldo,ciudad
 from empleados e inner join sucursales s
 on s.codigo=e.codigosucursal

 /*Cree una tabla llamada "secciones" que contenga las secciones de la empresa (primero elimínela, si 
existe):*/

if object_id('secciones') is not null
drop table secciones


select distinct seccion
into secciones
from empleados

select * from secciones

/*
8- Se necesita una nueva tabla llamada "sueldosxseccion" que contenga la suma de los sueldos de los 
empleados por sección. Primero elimine la tabla, si existe:
*/

if object_id('sueldosxseccion') is not null
drop table sueldosxseccion

select distinct seccion, sum(sueldo) totalsueldo
into sueldosxseccion
from empleados
group by seccion 

select seccion, sueldo from empleados
group by seccion, sueldo


select * from sueldosxseccion


/*
10- Se necesita una tabla llamada "maximossueldos" que contenga los mismos campos que "empleados" y 
guarde los 3 empleados con sueldos más altos. Primero eliminamos, si existe, la tabla 
"maximossueldos":
*/

if object_id('maximossueldos')is not null
drop table maximossueldos


select top 3 * 
into maximosueldos
from empleados 
order by sueldo



/*12- Se necesita una nueva tabla llamada "sucursalCordoba" que contenga los nombres y sección de los 
empleados de la ciudad de Córdoba. En primer lugar, eliminamos la tabla, si existe. Luego, consulte 
las tablas "empleados" y "sucursales" y guarde el resultado en la nueva tabla:
*/
if object_id('SucursalCordoba') is not null
drop table SucursalCordoba

select e.nombre, e.seccion, s.ciudad 
into SucursalCordoba
from empleados e inner join sucursales s
on s.codigo =e.codigosucursal
where ciudad ='Cordoba'


select * from SucursalCordoba