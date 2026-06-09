/*
La sintaxis básica es la siguiente:

 insert into TABLAENQUESEINGRESA (CAMPOSTABLA1)
  select (CAMPOSTABLACONSULTADA)
  from TABLACONSULTADA;
  Ejemplo:
   insert into aprobados (documento,nota)
  select (documento,nota)
   from alumnos;

*/
---Contenido Practico

if object_id('alumnos') is not null
  drop table alumnos;
if object_id('aprobados') is not null
  drop table aprobados;

create table alumnos(
  documento char(8) not null,
  nombre varchar(30),
  nota decimal(4,2)
   constraint CK_alumnos_nota_valores check (nota>=0 and nota <=10),
  primary key(documento),
);

create table aprobados(
  documento char(8) not null,
  nota decimal(4,2)
   constraint CK_aprobados_nota_valores check (nota>=0 and nota <=10),
  primary key(documento),
);

go


insert into alumnos values('30000000','Ana Acosta',8);
insert into alumnos values('30111111','Betina Bustos',9);
insert into alumnos values('30222222','Carlos Caseros',2.5); 
insert into alumnos values('30333333','Daniel Duarte',7.7);
insert into alumnos values('30444444','Estela Esper',3.4);

-- Ingresamos registros en la tabla "aprobados" seleccionando 
-- registros de la tabla "alumnos":
insert into aprobados 
  select documento,nota
   from alumnos
   where nota>=4;

select * from aprobados;
---Contenido Practico 
if object_id('facturas') is not null
drop table facturas

if object_id('clientes') is not null
drop table clientes

create table clientes(
codigo int identity,
nombre varchar(30),
domicilio varchar(30),
primary key(codigo))


create table facturas(
numero int not null,
fecha datetime,
codigocliente int not null,
total decimal(6,2),
primary key(numero),
constraint FK_facturas_cliente
foreign key(codigocliente)
references clientes(codigo)
on update cascade)


---insercion de Registros 

 insert into clientes values('Juan Lopez','Colon 123');
 insert into clientes values('Luis Torres','Sucre 987');
 insert into clientes values('Ana Garcia','Sarmiento 576');
 insert into clientes values('Susana Molina','San Martin 555');

 insert into facturas values(1200,'2007-01-15',1,300);
 insert into facturas values(1201,'2007-01-15',2,550);
 insert into facturas values(1202,'2007-01-15',3,150);
 insert into facturas values(1300,'2007-01-20',1,350);
 insert into facturas values(1310,'2007-01-22',3,100);
 
 if object_id('clientespref') is not null
 drop table clientespref

 create table clientespref(
 nombre varchar(30),
 domicilio varchar(30))

/* 5- Ingrese los registros en la tabla "clientespref" seleccionando registros de la tabla "clientes" y 
"facturas".*/

insert into clientespref
select nombre, domicilio from clientes

select * from clientespref