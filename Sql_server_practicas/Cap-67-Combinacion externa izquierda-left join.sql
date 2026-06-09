/*
Si queremos saber qué registros de una tabla NO encuentran correspondencia en la otra, es decir, no existe valor coincidente en la segunda,
necesitamos otro tipo de combinación, "outer join" (combinación externa).
Hay tres tipos de combinaciones externas: "left outer join", "right outer join" y "full outer join"; 
se pueden abreviar con "left join", "right join" y "full join" respectivamente.
Se emplea una combinación externa izquierda para mostrar todos los registros de la tabla de la izquierda.
Si no encuentra coincidencia con la tabla de la derecha, el registro muestra los campos de la segunda tabla seteados a "null".
un "left join" se usa para hacer coincidir registros en una tabla (izquierda) con otra tabla (derecha);
si un valor de la tabla de la izquierda no encuentra coincidencia en la tabla de la derecha, 
se genera una fila extra (una por cada valor no encontrado) con todos los campos correspondientes a la tabla derecha seteados a "null".
La sintaxis básica es la siguiente:

  select CAMPOS
  from TABLAIZQUIERDA
  left join TABLADERECHA
  on CONDICION;

*/

if (object_id('clientes')) is not null
   drop table clientes;
  if (object_id('provincias')) is not null
   drop table provincias;

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

--2- Ingrese algunos registros para ambas tablas:
 insert into provincias (nombre) values('Cordoba');
 insert into provincias (nombre) values('Santa Fe');
 insert into provincias (nombre) values('Corrientes');

 insert into clientes values ('Lopez Marcos','Colon 111','Córdoba',1);
 insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje',1);
 insert into clientes values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
 insert into clientes values ('Perez Luis','Sarmiento 444','Rosario',2);
 insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe',2);
 insert into clientes values ('Torres Fabiola','Alem 777','La Plata',4);
 insert into clientes values ('Garcia Luis','Sucre 475','Santa Rosa',5);

 select c.nombre, c.domicilio,c.ciudad,p.nombre 
 from clientes c left join  provincias p 
 on ((p.codigo =c.codigoprovincia) and
     (p.nombre =c.ciudad))

select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo;


   select c.nombre, c.domicilio,c.ciudad,p.nombre 
 from provincias p left join  clientes c
 on (p.codigo =c.codigoprovincia) 

  select c.nombre,domicilio,ciudad, p.nombre
  from provincias as p
  left join clientes as c
  on codigoprovincia = p.codigo;

   select c.nombre, c.domicilio,c.ciudad,p.nombre 
 from clientes c left join  provincias p 
 on (p.codigo =c.codigoprovincia)
 where p.codigo is not null

 select c.nombre, c.domicilio,c.ciudad,p.nombre 
 from clientes c left join  provincias p 
 on (p.codigo =c.codigoprovincia)
 where p.codigo is null
 order by c.nombre

 
 select c.nombre, c.domicilio,c.ciudad,p.nombre 
 from clientes c left join  provincias p 
 on (p.codigo =c.codigoprovincia)
 where p.nombre ='Cordoba'

 ---Primera Practica

 if object_id('clientes') is not null
 drop table clientes

 if object_id('Provincias') is not null
 drop table provincias

 create table clientes(
 codigo int identity,
 nombre varchar(30),
 domicilio varchar(30),
 ciudad varchar(20),
 codigoProvincia tinyint not null,
 primary key(codigo))

 select * from clientes


 create table provincias(
 codigo tinyint identity,
 nombre varchar(20),
 primary key(codigo))

 insert into provincias (nombre) values('Cordoba');
 insert into provincias (nombre) values('Santa Fe');
 insert into provincias (nombre) values('Corrientes');

 insert into clientes values ('Lopez Marcos','Colon 111','Córdoba',1);
 insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje',1);
 insert into clientes values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
 insert into clientes values ('Perez Luis','Sarmiento 444','Rosario',2);
 insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe',2);
 insert into clientes values ('Torres Fabiola','Alem 777','La Plata',4);
 insert into clientes values ('Garcia Luis','Sucre 475','Santa Rosa',5);

 select * from clientes

 select c.nombre, c.domicilio,c.ciudad, 
 p.nombre from clientes c
 left join provincias p
 on (p.codigo =c.codigoProvincia)



  select c.nombre, c.domicilio,c.ciudad, 
 p.nombre from provincias p
 left join clientes c
 on (c.codigoProvincia =p.codigo)

  select c.nombre, c.domicilio,c.ciudad, 
 p.nombre from clientes c
 left join provincias p
 on (p.codigo =c.codigoProvincia)
where p.codigo is not null

  select c.nombre, c.domicilio,c.ciudad, 
 p.nombre from clientes c
 left join provincias p
 on (p.codigo =c.codigoProvincia)
where p.codigo is null
order by c.nombre

  select c.nombre, c.domicilio,c.ciudad, 
 p.nombre from clientes c
 left join provincias p
 on (p.codigo =c.codigoProvincia)
 where p.nombre ='Cordoba'