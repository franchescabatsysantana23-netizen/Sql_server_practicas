/*
- and, significa "y",
- or, significa "y/o",
- not, significa "no", invierte el resultado
- (), paréntesis
Los operadores lógicos se usan para combinar condiciones.
El orden de prioridad de los operadores lógicos es el siguiente: "not" se aplica antes que 
"and" y "and" antes que "or", si no se especifica un orden de evaluación mediante el uso de paréntesis.
*/

if object_id ('libros') is not null
  drop table libros

  create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
);

go

insert into libros
  values('El aleph','Borges','Emece',15.90);
insert into libros
  values('Antología poética','Borges','Planeta',39.50);
insert into libros
  values('Java en 10 minutos','Mario Molina','Planeta',50.50);
insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',19.90);
insert into libros
  values('Martin Fierro','Jose Hernandez','Emece',25.90);
insert into libros
  values('Martin Fierro','Jose Hernandez','Paidos',16.80);
insert into libros
  values('Aprenda PHP','Mario Molina','Emece',19.50);
insert into libros
  values('Cervantes y el quijote','Borges','Paidos',18.40);

-- Recuperamos los libros cuyo autor sea igual a "Borges" y 
-- cuyo precio no supere los 20 pesos:
select * from libros
  where (autor='Borges') and
  (precio<=20);

-- Seleccionamos los libros cuyo autor es "Borges" y/o cuya editorial es "Planeta":
select * from libros
  where autor='Borges' or
  editorial='Planeta';

-- Recuperamos los libros cuya editorial NO es "Planeta":
 select * from libros
  where not editorial='Planeta';

-- Veamos cómo el uso de paréntesis hace que SQL Server evalúe en forma diferente
-- ciertas consultas aparentemente iguales:
 select * from libros
  where (autor='Borges') or
  (editorial='Paidos' and precio>20);

 select * from libros
  where (autor='Borges' or editorial='Paidos') and
  (precio<20);

  ---Practica Operadores Logicos

  if object_id('medicamentos') is not null
  drop table medicamentos;

   create table medicamentos(
  codigo int identity,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(5,2),
  cantidad tinyint,
  primary key(codigo)
 );
 select * from medicamentos

  insert into medicamentos
  values('Sertal','Roche',5.2,100);
 insert into medicamentos
  values('Buscapina','Roche',4.10,200);
 insert into medicamentos
  values('Amoxidal 500','Bayer',15.60,100);
 insert into medicamentos
  values('Paracetamol 500','Bago',1.90,200);
 insert into medicamentos
  values('Bayaspirina','Bayer',2.10,150); 
 insert into medicamentos
  values('Amoxidal jarabe','Bayer',5.10,250); 

  ---Primera Practica

  /*
4- Recupere los códigos y nombres de los medicamentos cuyo laboratorio sea 'Roche' y cuyo precio sea 
menor a 5 (1 registro cumple con ambas condiciones)

5- Recupere los medicamentos cuyo laboratorio sea 'Roche' o cuyo precio sea menor a 5 (4 registros):
 select * from medicamentos
  where laboratorio='Roche' or
  precio<5;
Note que el resultado es diferente al del punto 4, hemos cambiado el operador de la sentencia 
anterior.

6- Muestre todos los medicamentos cuyo laboratorio NO sea "Bayer" y cuya cantidad sea=100 (1 
registro)

7- Muestre todos los medicamentos cuyo laboratorio sea "Bayer" y cuya cantidad NO sea=100 (2 registros):
 select * from medicamentos
  where laboratorio='Bayer' and
  not cantidad=100;
Analice estas 2 últimas sentencias. El operador "not" afecta a la condición a la cual antecede, no a 
las siguientes. Los resultados de los puntos 6 y 7 son diferentes.

8- Elimine todos los registros cuyo laboratorio sea igual a "Bayer" y su precio sea mayor a 10 (1 
registro eliminado)

9- Cambie la cantidad por 200, a todos los medicamentos de "Roche" cuyo precio sea mayor a 5 (1 
registro afectado)

10- Borre los medicamentos cuyo laboratorio sea "Bayer" o cuyo precio sea menor a 3 (3 registros 
borrados)  
  */

  select codigo, nombre from medicamentos 
  where (laboratorio = 'Roche' and precio <5)

    select codigo, nombre from medicamentos 
  where (laboratorio = 'Roche' or precio <5)

  select * from medicamentos 
  where (not laboratorio ='Bayer') and cantidad =100

  select * from medicamentos 
  where (not cantidad =100) and (laboratorio ='Bayer')

  delete from medicamentos 
  where laboratorio ='bayer' and precio >10

  update medicamentos
  set cantidad =200
  where laboratorio ='Roche' and precio >5

  delete  from medicamentos 
  where (laboratorio ='Bayer' or precio <3)

  delete from medicamentos

  select * from medicamentos 
  where (laboratorio ='Bayer' or laboratorio <>'') and (not cantidad =100)


  ------Tercera Practica

   if object_id('peliculas') is not null
  drop table peliculas;

  select * from peliculas

   create table peliculas(
  codigo int identity,
  titulo varchar(40) not null,
  actor varchar(20),
  duracion tinyint,
  primary key (codigo)
 );

  insert into peliculas
  values('Mision imposible','Tom Cruise',120);
 insert into peliculas
  values('Harry Potter y la piedra filosofal','Daniel R.',180);
 insert into peliculas
  values('Harry Potter y la camara secreta','Daniel R.',190);
 insert into peliculas
  values('Mision imposible 2','Tom Cruise',120);
 insert into peliculas
  values('Mujer bonita','Richard Gere',120);
 insert into peliculas
  values('Tootsie','D. Hoffman',90);
 insert into peliculas
  values('Un oso rojo','Julio Chavez',100);
 insert into peliculas
  values('Elsa y Fred','China Zorrilla',110);

  /*
  
4- Recupere los registros cuyo actor sea "Tom Cruise" or "Richard Gere" (3 registros)
5- Recupere los registros cuyo actor sea "Tom Cruise" y duración menor a 100 (ninguno cumple ambas 
condiciones)
6- Cambie la duración a 200, de las películas cuyo actor sea "Daniel R." y cuya duración sea 180 (1 
registro afectado)
7- Borre todas las películas donde el actor NO sea "Tom Cruise" y cuya duración sea mayor o igual a 
100 (2 registros eliminados)
  */
  select * from peliculas 
  where actor ='Tom Cruise' or actor ='Richard Gere'

  select * from peliculas 
  where actor ='Tom Cruise' and duracion <100

  update peliculas 
  set duracion =200
  where actor ='Daniel R.' and duracion =180

  select * from peliculas
  select * from peliculas 
  where (not actor ='&Tom Cruise%') and (duracion >=100)

    delete from peliculas 
  where (not actor ='&Tom Cruise%') and (duracion >=100)