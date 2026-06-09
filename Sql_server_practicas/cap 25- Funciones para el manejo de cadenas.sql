/*
-substring(cadena,inicio,longitud): devuelve una parte de la cadena especificada como primer argumento.
- str(numero,longitud,cantidaddecimales): convierte números a caracteres;
- select str(123.456,7,3);
nota: si no se colocan el segundo y tercer argumento, la longitud predeterminada es 10 
y la cantidad de decimales es 0.
-stuffcadena1,inicio,cantidad,cadena2): inserta la cadena enviada como cuarto argumento, 
en la posición indicada en el segundo argumento, reemplazando la cantidad de caracteres indicada 
por el tercer argumento. 


select str(123.456)
select str(123.456,3)
select str(123.456,7,2) ---> retorna el numero de decimales.
select str(123.456,7,0)---> retorna el numero entero.
select stuff('abcde',1,1,'opqrs')
len(cadena)
select len('Hola') --> la funcion len(cadena) retorna la longitud de la cadena.
- char(x): retorna un caracter en código ASCII del entero enviado como argumento.
select char(65)

- left(cadena,longitud): retorna la cantidad (longitud) de caracteres de la cadena comenzando
desde la izquierda, primer caracter. 

select left ('Buenos dias ',8)--> retorna la posiciones de la cadena comenzando desde la izquierda.
right(cadena,longitud): retorna la cantidad (longitud) de caracteres de la cadena comenzando desde la derecha, último caracter.

select right('Buenos dias',7)---> retorna el numero de posiciones de derecha a izquierda.
lower('Hola Estudiante')
lower(cadena): retornan la cadena con todos los caracteres en minúsculas.

upper(cadena) retornan la cadena con todos los caracteres en mayusculas.
select upper('Hola')
select ltrim(' hola  ') --> reduce espacios en blanco de la izquierda
select rtrim('  hola   ') as hola-->reduce espacios en blanco de la derecha.

replace(cadena,cadenareemplazo,cadenareemplazar): retorna la cadena con todas las ocurrencias de la subcadena reemplazo por la subcadena a reemplazar.
select reverse ('Hola') ---> retorna la palabra la reves.
patindex(patron,cadena): devuelve la posición de comienzo (de la primera ocurrencia) del 
patrón especificado en la cadena enviada como segundo argumento.
select patindex ('%Luis%','Jorge Luis Borges')
charindex (subcadena,cadena,inicio): devuelve la posición donde comienza la subcadena en la cadena, 
comenzando la búsqueda desde la posición indicada por "inicio".
select charindex('or','Jorge Luis Borges',5)
replicate(cadena,cantidad): repite una cadena la cantidad de veces especificada
select replicate ('Hola',2).
- space(cantidad): retorna una cadena de espacios de longitud indicada por "cantidad", que debe ser un valor positivo.

select 'Hola' +space(2)+'que tal'

*/

if object_id ('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  cantidad tinyint default 0,
  primary key (codigo)
)
insert into libros (titulo,autor,editorial,precio)  values('El aleph','Borges','Emece',25);
insert into libros values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100);
insert into libros (titulo,autor,editorial,precio,cantidad) values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50);

select * from libros

select SUBSTRING(titulo,1,4) as titulo from libros --> retorna cuatro posiciones del libros titulos.
select left (titulo,12) titulo from libros --> retorna doce posiciones a la izquierda.

select titulo, str(precio,6,1) [precio] from libros ---> los precios retornan convertidos a cadena. 

select titulo, str(precio) [precio] from libros
select titulo,autor,upper(editorial) as mayus from libros--> retorna la editorial de forma mayusculas. 


