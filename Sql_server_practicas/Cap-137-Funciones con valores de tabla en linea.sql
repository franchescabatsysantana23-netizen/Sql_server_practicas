/*
Una funcion con valores de tabla en linea retorna una tabla que es el resultado de una unica instruccion select. 
Las funciones con valores de tabla en linea funcionan como vista con parametros. 

-- sintaxis de creacion de function. 

create function NOMBREFUNCION
 (@PARAMETRO TIPO=VALORPORDEFECTO)
 returns table
 as
 return (
  select CAMPOS
  from TABLA
  where CONDICION
 );
 "returns" especifica "table" como el tipo de datos a retornar. No se define el formato de la tabla a retornar porque queda establecido en el "select".
 El cuerpo de la función no contiene un bloque "begin...end" como las otras funciones.

 La cláusula "return" contiene una sola instrucción "select" entre paréntesis. El resultado del "select" es la tabla que se retorna. 
 El "select" está sujeto a las mismas reglas que los "select" de las vistas.
 create function f_libros
 (@autor varchar(30)='Borges')
 returns table
 as
 return (
  select titulo,editorial
  from libros
  where autor like '%'+@autor+'%'
 );

 -- formato al llamar la funcion

--incorrecto: select *from f_libros();
 select *from f_libros(default);--correcto
*/

if object_id('libros') is not null
drop table libros

create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20)
);

insert into libros values('Uno','Richard Bach','Planeta');
insert into libros values('El aleph','Borges','Emece');
insert into libros values('Ilusiones','Richard Bach','Planeta');
insert into libros values('Aprenda PHP','Mario Molina','Nuevo siglo');
insert into libros values('Matematica estas ahi','Paenza','Nuevo siglo');

select * from libros 

---Eliminanos, si existe la funcion "f_libros"

if object_id('f_libros') is not null
drop function f_libros

/*
creamos una funcion con valores de la tabla en linea que recibe un valor de autor como parametro: 
*/
create function f_libros
(@autor varchar(30)='Borges')
returns table
as
return (
select titulo,editorial
from libros 
where autor like '%'+@autor+'%');


select * from f_libros('Bach')

--Eliminamos, si existe la funcion "F_libros_autoreditorial"
if object_id('f_libros_autoreditorial') is not null
drop function f_libros_autoreditorial

create function f_libros_autoreditorial
(@autor varchar(30)='Borges', @editorial varchar(20) ='Emece')
returns table
as 
return (
select titulo,autor,editorial
from libros
where autor like '%'+@autor+'%' and
editorial like '%'+@editorial+'%')

---consulta de la funcion

select * from f_libros_autoreditorial('','Nuevo Siglo')

select * from f_libros_autoreditorial(default,default) --> retorna los resultados predeterminados en la funcion. 


