/*
La restricción "foreign key", que define una referencia a un campo con una restricción "primary key" o "unique" se puede definir entre distintas tablas 
 alter table afiliados
  add constraint FK_afiliados_afiliadotitular
  foreign key (afiliadotitular)
  references afiliados (numero);

*/

---Primera Practica

if object_id('afiliados') is not null
drop table afiliados


create table afiliados(
  numero int identity not null,
  documento char(8) not null,
  nombre varchar(30),
  afiliadotitular int,
  primary key (documento),
  unique (numero)
);


alter table afiliados
  add constraint FK_afiliados_afiliadotitular
  foreign key (afiliadotitular)
  references afiliados (numero);

insert into afiliados values('22222222','Perez Juan',null);
insert into afiliados values('23333333','Garcia Maria',null);
insert into afiliados values('24444444','Lopez Susana',null);
insert into afiliados values('30000000','Perez Marcela',1);
insert into afiliados values('31111111','Morales Luis',1);
insert into afiliados values('32222222','Garcia Maria',2);

delete from afiliados where numero=5;

exec sp_helpconstraint afiliados;
 

 ----Primera Practica

 if object_id('clientes') is not null
 drop table clientes

 create table clientes(
  codigo int not null,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  referenciadopor int,
  primary key(codigo)
 );

  insert into clientes values (50,'Juan Perez','Sucre 123','Cordoba',null);
 insert into clientes values(90,'Marta Juarez','Colon 345','Carlos Paz',null);
 insert into clientes values(110,'Fabian Torres','San Martin 987','Cordoba',50);
 insert into clientes values(125,'Susana Garcia','Colon 122','Carlos Paz',90);
 insert into clientes values(140,'Ana Herrero','Colon 890','Carlos Paz',90);

 select * from clientes

 /*
3- Intente agregar una restricción "foreign key" para evitar que en el campo "referenciadopor" se 
ingrese un valor de código de cliente que no exista.
No se permite porque existe un registro que no cumple con la restricción que se intenta establecer.
 */

 alter table clientes 
add constraint FK_clientes_referenciadopor
foreign key (referenciadopor) 
references clientes(codigo)


select * from clientes

update clientes
set referenciadopor =10
where codigo in (50,90)

---6- Vea la información referente a las restricciones de la tabla "clientes".

exec sp_helpconstraint clientes

--7- Intente agregar un registro que infrinja la restricción.

 insert into clientes values(140,'Ana Herrero','Colon 890','Carlos Paz',9);

 /*
 
8- Intente modificar el código de un cliente que está referenciado en "referenciadopor".
No se puede.
9- Intente eliminar un cliente que sea referenciado por otro en "referenciadopor".
No se puede.
10- Cambie el valor de código de un cliente que no referenció a nadie.
11- Elimine un cliente que no haya referenciado a otros.
 */

 select * from clientes 

 ---9- Intente eliminar un cliente que sea referenciado por otro en "referenciadopor".
 delete from clientes where codigo =140

 ---

 
 update clientes set codigo=180 where codigo=90;

 delete from clientes where nombre='Marta Juarez';

 update clientes set codigo=180 where codigo=125;

  update clientes set codigo=121 where codigo=90;

 delete from clientes where codigo=110;
  delete from clientes where codigo=180;