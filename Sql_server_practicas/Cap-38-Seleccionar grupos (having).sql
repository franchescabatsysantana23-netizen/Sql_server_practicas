/*
 la cláusula "having" permite seleccionar (o rechazar) un grupo de registros.
  la cláusula "where" permite seleccionar (o rechazar) registros individuales;
  Se utiliza "having", seguido de la condición de búsqueda, para seleccionar ciertas
  filas retornadas por la cláusula "group by".
  En una cláusula "having" puede haber hasta 128 condiciones. Cuando utilice varias condiciones,
  tiene que combinarlas con operadores lógicos (and, or, not).
*/

if object_id('libros') is not null
  drop table libros;


create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  precio decimal(5,2),
  cantidad tinyint,
  primary key(codigo)
);

insert into libros
  values('El aleph','Borges','Planeta',35,null);
insert into libros
  values('Martin Fierro','Jose Hernandez','Emece',22.20,200);
insert into libros
  values('Martin Fierro','Jose Hernandez','Planeta',40,200);
insert into libros
  values('Antologia poetica','J.L. Borges','Planeta',null,150);
insert into libros
  values('Aprenda PHP','Mario Molina','Emece',18,null);
insert into libros
  values('Manual de PHP', 'J.C. Paez', 'Siglo XXI',56,120);
insert into libros
  values('Cervantes y el quijote','Bioy Casares- J.L. Borges','Paidos',null,100);
insert into libros
  values('Harry Potter y la piedra filosofal','J.K. Rowling',default,45.00,90);
insert into libros
  values('Harry Potter y la camara secreta','J.K. Rowling','Emece',null,100);
insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',42,80);
insert into libros
  values('PHP de la A a la Z',null,null,110,0);
insert into libros
  values('Uno','Richard Bach','Planeta',25,null);

  select * from libros
--  Cantidad de libros agrupados por editorial pero considerando sólo algunos grupos, 
--  los que devuelvan un valor mayor a 2
select editorial, count(*) from libros
  group by editorial
  having count(*)>2;

-- Promedio de los precios de los libros agrupados por editorial, pero solamente de 
-- aquellos grupos cuyo promedio supere los 25 pesos:
 select editorial, avg(precio) from libros
  group by editorial
  having avg(precio)>25;

-- Cantidad de libros, sin considerar los que tienen precio nulo (where), agrupados por 
-- editorial (group by), sin considerar la editorial "Planeta" (having):
 select editorial, count(*) from libros
  where precio is not null
  group by editorial
  having editorial<>'Planeta';

-- Promedio de los precios agrupados por editorial, 
-- de aquellas editoriales que tienen más de 2 libros:
 select editorial, avg(precio) from libros
  group by editorial
  having count(*) > 2; 

-- Mayor valor de los libros agrupados y ordenados por editorial y seleccionamos las 
-- filas que tienen un valor menor a 100 y mayor a 30:
 select editorial, max(precio) as 'mayor'
  from libros
  group by editorial
  having max(precio)<100 and
  max(precio)>30
  order by editorial; 


  ---Primera Practica

  if object_id('clientes') is not null
  drop table clientes;

  create table clientes (
  codigo int identity,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  provincia varchar (20),
  telefono varchar(11),
  primary key(codigo)
);

insert into clientes
  values ('Lopez Marcos','Colon 111','Cordoba','Cordoba','null');
 insert into clientes
  values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba','4578585');
 insert into clientes
  values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba','4578445');
 insert into clientes
  values ('Perez Luis','Sarmiento 444','Rosario','Santa Fe',null);
 insert into clientes
  values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba','4253685');
 insert into clientes
  values ('Gomez Ines','San Martin 666','Santa Fe','Santa Fe','0345252525');
 insert into clientes
  values ('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba','4554455');
 insert into clientes
  values ('Lopez Carlos',null,'Cruz del Eje','Cordoba',null);
 insert into clientes
  values ('Ramos Betina','San Martin 999','Cordoba','Cordoba','4223366');
 insert into clientes
  values ('Lopez Lucas','San Martin 1010','Posadas','Misiones','0457858745');

  select * from clientes

/*
4- Obtenga el total de los registros agrupados por ciudad y provincia (6 filas)
5- Obtenga el total de los registros agrupados por ciudad y provincia sin considerar los que tienen 
menos de 2 clientes (3 filas)
6- Obtenga el total de los clientes que viven en calle "San Martin" (where), agrupados por provincia 
(group by), teniendo en cuenta todos los valores (all), de aquellas ciudades que tengan menos de 2 
clientes (having) y omitiendo la fila correspondiente a la ciudad de "Cordoba" (having) (4 filas 
devueltas)
*/

select ciudad,provincia, count(*) [total] from clientes
group by ciudad,provincia

select ciudad,provincia, count(*) [total] from clientes
group by ciudad,provincia
having count(*)<2

select ciudad, count(*) [total] from clientes
where domicilio like '%San Martin%'
group by all ciudad
having (count(*)<2) and (not ciudad like '%Cordoba%')

---Segunda Practica

 if object_id('visitantes') is not null
  drop table visitantes;

 create table visitantes(
  nombre varchar(30),
  edad tinyint,
  sexo char(1),
  domicilio varchar(30),
  ciudad varchar(20),
  telefono varchar(11),
  montocompra decimal(6,2) not null
 );


  insert into visitantes
  values ('Susana Molina',28,'f',null,'Cordoba',null,45.50); 
 insert into visitantes
  values ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',22.40);
 insert into visitantes
  values ('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25); 
 insert into visitantes
  values ('Teresa Garcia',33,'f',default,'Alta Gracia','03547123456',120);
 insert into visitantes
  values ('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20);
 insert into visitantes
  values ('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',95);
 insert into visitantes
  values ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia',null,53.50);
 insert into visitantes
  values ('Roxana Lopez',20,'f','null','Alta Gracia',null,240);
 insert into visitantes
  values ('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48);
 insert into visitantes
  values ('Juan Torres',43,'m','Sarmiento 876','Cordoba',null,15.30);

  select * from visitantes

  /*
  4- Obtenga el total de las compras agrupados por ciudad y sexo de aquellas filas que devuelvan un 
valor superior a 50 (3 filas)
5- Obtenga el total de las compras agrupados por ciudad y sexo (group by), teniendo en cuenta todos 
los valores (all), considerando sólo los montos de compra superiores a 50 (where), los visitantes 
con teléfono (where), sin considerar la ciudad de "Cordoba" (having), ordenados por ciudad (order 
by) (3 filas)
6- Muestre el monto mayor de compra agrupado por ciudad, siempre que dicho valor supere los 50 pesos 
(having), considerando sólo los visitantes de sexo femenino y domicilio conocido (where) (2 filas)
7- Agrupe por ciudad y sexo, muestre para cada grupo el total de visitantes, la suma de sus compras 
y el promedio de compras, ordenado por la suma total y considerando las filas con promedio superior 
a 30 (3 filas)
  */

  select ciudad,sexo, count(*) [Total] from visitantes
  group by ciudad,sexo
  having sum(montocompra)>50

  select ciudad,sexo, count(*) [Total] from visitantes
  where (montocompra >50) and (telefono is not null)
  group by all ciudad, sexo
  having (not ciudad like '%Cordoba%')
  order by ciudad

  select ciudad, max(montocompra) [monto maximo]
  from visitantes
  where (sexo ='f') and (domicilio is not null)
  group by all ciudad
  having (max(montocompra)>50)

  select ciudad,sexo , count(*) [total],
  sum(montocompra)[Total Suma],
  avg(montocompra) [Total Promedio] from visitantes
  group by ciudad, sexo
  having (avg(montocompra)>30)
  order by [Total Suma]


  select ciudad,sexo , count(*) [total],
  sum(montocompra)[Total Suma],
  avg(montocompra) [Total Promedio] from visitantes
  group by ciudad, sexo
  having (avg(montocompra)>30)
  order by  sum(montocompra)

