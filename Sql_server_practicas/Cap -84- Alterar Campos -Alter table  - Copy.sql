/*
La sintaxis básica para modificar un campo existente es la siguiente:

 alter table NOMBRETABLA
  alter column CAMPO NUEVADEFINICION;
Modificamos el campo "titulo" extendiendo su longitud y para que NO admita valores nulos:

 alter table libros
  alter column titulo varchar(40) not null;

  SQL Server tiene algunas excepciones al momento de modificar los campos. No permite modificar:

- campos de tipo text, image, ntext y timestamp.

- un campo que es usado en un campo calculado.

- campos que son parte de índices o tienen restricciones, a menos que el cambio no afecte al índice o a la restricción, por ejemplo, 
se puede ampliar la longitud de un campo de tipo caracter.

- agregando o quitando el atributo "identity".

- campos que afecten a los datos existentes cuando una tabla contiene registros (ejemplo: un campo contiene valores nulos y se pretende 
redefinirlo como "not null"; un campo int guarda un valor 300 y se pretende modificarlo a tinyint, etc.).

*/

-- contenido de la unidad

if object_id('libros') is not null
drop table libros

create table libros(
codigo int identity,
titulo varchar(30),
autor varchar(30),
editorial varchar(15),
precio decimal(6,2) not null default 0)


insert into libros
  values('El aleph','Borges','Planeta',20);
insert into libros
  values('Java en 10 minutos',null,'Siglo XXI',30);
insert into libros
  values('Uno','Richard Bach','Planeta',15);
insert into libros
  values('Martin Fierro','Jose Hernandez',null,30);
insert into libros
  values('Aprenda PHP','Mario Molina','Emece',25);

  select * from libros
-- Modificamos el campo "titulo" para que acepte una cadena más larga y 
-- no admita valores nulos:

  alter table libros
  alter column titulo varchar(40) not null

  -- visualizacion de la estructura de una tabla.

  exec sp_columns libros

  -- Eliminamos registro que tienen en el campo autor el valor null
-- y realizamos la modificación del campo:


select * from libros 
delete from libros where codigo =2

alter table libros 
alter column autor varchar(30) not null

  -- visualizacion de la estructura de una tabla.
  
  exec sp_columns libros

  -- Intentamos quitar el atributo "identity" del campo "codigo" y
-- lo redefinimos como "smallint" (no se produce el cambio):

alter table libros 
alter column codigo smallint



  -- visualizacion de la estructura de una tabla.
  
  exec sp_columns libros


  alter table libros
  alter column precio decimal(6,2) null

  
  -- visualizacion de la estructura de una tabla.
  
  exec sp_columns libros

  ---Primera Practica

  if object_id('empleados') is not null
  drop table empleados


  create table empleados(
  legajo int not null,
  documento char(7) not null,
  nombre varchar(10),
  domicilio varchar(30),
  ciudad varchar(20) default 'Buenos Aires',
  sueldo decimal(6,2),
  cantidadhijos tinyint default 0,
  primary key (legajo))

  --Modifique el campo "nombre" extendiendo su longitud.
  alter table empleados
  alter column nombre varchar(30) not null

  ---3- Controle la modificación:
  exec sp_columns empleados

  ---4- Modifique el campo "sueldo" para que no admita valores nulos.
  alter table empleados
  alter column sueldo decimal(6,2) not null

  --4- Modifique el campo "documento" ampliando su longitud a 8 caracteres.

  alter table empleados
  alter column documento char(8) not null

  --5- Intente modificar el tipo de datos del campo "legajo" a "tinyint":

  alter table empleados
  alter column legajo tinyint 

  /*
  Insercion de unos registros
  */

   insert into empleados values(1,'22222222','Juan Perez','Colon 123','Cordoba',500,3);
 insert into empleados values(2,'30000000','sofia','Sucre 456','Cordoba',600,2);

  
   alter table empleados
  alter column nombre varchar(30) not null;

  --9- Modifique el campo "ciudad" a 10 caracteres.

  alter table empleados 
  alter column ciudad varchar(10) 


   insert into empleados values(3,'33333333','Juan Perez','Sarmiento 856',default,500,4);

    alter table empleados 
  alter column ciudad varchar(15) 

  alter table empleados 
  alter column legajo int identity