/*
Las funciones matemáticas realizan operaciones con expresiones numéricas y retornan un resultado,
operan con tipos de datos numéricos.
abs(x): retorna el valor absoluto del argumento "x".
ceiling(x): redondea hacia arriba el argumento "x".
floor(x): redondea hacia abajo el argumento "x".
 %: %: devuelve el resto de una división.
 power(x,y): retorna el valor de "x" elevado a la "y" potencia.
 round(numero,longitud): retorna un número redondeado a la longitud especificada.
 round(numero,longitud): retorna un número redondeado a la longitud especificada.
 "longitud" debe ser tinyint, smallint o int. Si "longitud" es positivo, 
 el número de decimales es redondeado según "longitud"; si es negativo, el número es redondeado
 desde la parte entera según el valor de "longitud".
 select round(123.456,1)
 select round(123.456,-1)
 sign(x): si el argumento es un valor positivo devuelve 1;-1 si es negativo y si es 0, 0.
 square(x): retorna el cuadrado del argumento.
 srqt(x): devuelve la raiz cuadrada del valor enviado como argumento.

*/
if object_id('libros') is not null
drop table libros
select * from libros

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  primary key (codigo)
);

insert into libros (titulo,autor,editorial,precio) values('El aleph','Borges','Emece',25.33);
insert into libros values('Java en 10 minutos','Mario Molina','Siglo XXI',50.65);
insert into libros (titulo,autor,editorial,precio) values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',19.95);

select * from libros

select precio, floor(precio) [bajo],
ceiling(precio) arriba, 
sqrt(precio) raiz from libros

select power( 5, 9) as potencia
select round(65.900,2)