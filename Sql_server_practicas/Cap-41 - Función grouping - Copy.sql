/*
La función "grouping" se emplea con los operadores "rollup" y "cube" para distinguir los valores de detalle 
y de resumen en el resultado. Es decir, permite diferenciar si los valores "null" que aparecen en el resultado 
son valores nulos de las tablas o si son una fila generada por los operadores "rollup" o "cube".

Sólo se puede emplear la función "grouping" en los campos que aparecen en la cláusula "group by".
En el cual se distingue 1 para el resumen y 0 para valores de los campos.
*/

if object_id('visitantes') is not null
  drop table visitantes;

create table visitantes(
  nombre varchar(30),
  sexo char(1),
  ciudad varchar(20)
);

go 

insert into visitantes values('Susana Molina', 'f', 'Cordoba');
insert into visitantes values('Marcela Mercado', 'f','Cordoba');
insert into visitantes values('Roberto Perez','f',null);
insert into visitantes values('Alberto Garcia','m','Cordoba');
insert into visitantes values('Teresa Garcia','f','Alta Gracia');

select * from visitantes

select ciudad,
  count(*) as cantidad
  from visitantes
  group by ciudad
  with rollup;

  select ciudad,
  count(*) as cantidad,
  grouping(ciudad) as resumen
  from visitantes
  group by ciudad
  with rollup;


  ---Primera Practica 

if object_id('empleados') is not null
  drop table empleados;

  create table empleados (
  documento varchar(8) not null,
  nombre varchar(30),
  sexo char(1),
  estadocivil char(1),--c=casado, s=soltero,v=viudo
  seccion varchar(20),
  primary key (documento)
 );

  insert into empleados
  values ('22222222','Alberto Lopez','m','c','Sistemas');
 insert into empleados
  values ('23333333','Beatriz Garcia','f','c','Administracion');
 insert into empleados
  values ('24444444','Carlos Fuentes','m','s','Administracion');
 insert into empleados
  values ('25555555','Daniel Garcia','m','s','Sistemas');
 insert into empleados
  values ('26666666','Ester Juarez',null,'c','Sistemas');
 insert into empleados
  values ('27777777','Fabian Torres',null,'s','Sistemas');
 insert into empleados
  values ('28888888','Gabriela Lopez','f',null,'Sistemas');
 insert into empleados
  values ('29999999','Hector Garcia','m',null,'Administracion');

  select * from empleados

  /*
  4- Cuente la cantidad de empleados agrupados por sexo y estado civil, empleando "rollup".
Es dificil distinguir los valores de detalle y resumen.
5- Realice la misma consulta anterior pero emplee la función "grouping" para los dos campos por los 
que se agrupa para distinguir los valores de resumen y de detalle.
Note que las columnas de resumen contienen 1 y las de detalle 0.
6- Realice la misma consulta anterior pero con "cube" en lugar de "rollup", distinguiendo los 
valores de resumen y de detalle.
Note que las columnas de resumen contienen 1 y las de detalle 0.
  */
  select sexo,estadocivil,count(*) [total] from empleados
  group by sexo,estadocivil
  with 
  rollup
  /*
  Note que las columnas de resumen contienen 1 y las de detalle 0.
  */
    select sexo,estadocivil,count(*) [total], GROUPING(sexo),
	GROUPING(estadocivil) from empleados
    group by sexo,estadocivil
    with rollup

	    select sexo,estadocivil,count(*) [total], GROUPING(sexo),
	GROUPING(estadocivil) from empleados
    group by sexo,estadocivil
    with rollup



	select sexo,estadocivil,count(*) [total], GROUPING(sexo),
	GROUPING(estadocivil) from empleados
    group by sexo,estadocivil
    with cube