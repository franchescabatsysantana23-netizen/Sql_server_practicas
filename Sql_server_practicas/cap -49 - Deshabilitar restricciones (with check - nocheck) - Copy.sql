/*
ejemplo para desativar una restricion de tipo no check.
alter table libros
  with nocheck
  add constraint CK_libros_precio
  check (precio>=0);

   alter table TABLA
  with nocheck
  add constraint NOMBRERESTRICCION
  check (CONDICION);
  alter table libros
  nocheck constraint CK_libros_precio;

  Para habilitar una restricción deshabilitada se ejecuta la misma instrucción
  pero con la cláusula "check" o "check all":

 alter table libros
  check constraint CK_libros_precio;

  Si se emplea "check constraint all" no se coloca nombre de restricciones,
  habilita todas las restricciones que tiene la tabla nombrada.

  Si se emplea "check constraint all" no se coloca nombre de restricciones
  , habilita todas las restricciones que tiene la tabla nombrada.



  if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  precio decimal(5,2)
);

go

insert into libros values ('Uno','Bach','Planeta',22);
insert into libros values ('El quijote','Cervantes','Emece',15);
insert into libros values ('Aprenda PHP','Mario Molina','Siglo XXI',-40);

-- Agregamos una restricción "check" para asegurar que los precios no puedan ser 
-- negativos, pero como ya tenemos almacenado un precio que infringe la restricción,
-- vamos a especificar que no haya comprobación de datos existentes:
alter table libros
   with nocheck
   add constraint CK_libros_precio_positivo
   check (precio>=0);

-- Si intentamos ingresar un registro con precio negativo, no lo permite.
-- Para que lo permita, debemos dehabilitar la comprobación:
alter table libros
  nocheck constraint CK_libros_precio_positivo;

-- Ingresemos un registro con precio negativo (si lo permite):
insert into libros values('Java en 10 minutos',default,'Siglo XXI',-1);

-- Veamos si la restricción está o no habilitada:
-- La columna "status_enabled" nos informa que está deshabilitada (Disabled)
exec sp_helpconstraint libros;

-- Habilitamos la restricción.
-- Si ahora intentamos ingresar un precio negativo SQL Server no lo permitirá.
alter table libros
  check constraint CK_libros_precio_positivo;

select * from libros;

*/
--Primera Practica

 if object_id('empleados') is not null
  drop table empleados;

  create table empleados (
  documento varchar(8),
  nombre varchar(30),
  seccion varchar(20),
  sueldo decimal(6,2)
 );
  insert into empleados values ('22222222','Alberto Acosta','Sistemas',-10);
 insert into empleados values ('33333333','Beatriz Benitez','Recursos',3000);
 insert into empleados values ('34444444','Carlos Caseres','Contaduria',4000);

  alter table empleados
 add constraint CK_empleados_sueldo_positivo
 check (sueldo>=0);

  alter table empleados
 with nocheck --agrega la validacion sin afectarse por actuales registros
 add constraint CK_empleados_sueldo_positivo
 check (sueldo>=0);

  insert into empleados
  values ('35555555','Daniel Duarte','Administracion',-2000);

  exec sp_helpconstraint empleados
--se desahabilita la restrincion. 
   alter table empleados
  nocheck constraint CK_empleados_sueldo_positivo;
 insert into empleados
  values ('35555555','Daniel Duarte','Administracion',2000);

 alter table empleados
 add constraint CK_empleados_seccion_lista
 check (seccion in ('Sistemas','Administracion','Contaduria'));

  alter table empleados
  with nocheck
 add constraint CK_empleados_seccion_lista
 check (seccion in ('Sistemas','Administracion','Contaduria'));

 exec sp_helpconstraint empleados

 alter table empleados 
 check constraint CK_empleados_sueldo_positivo

  alter table empleados 
 nocheck constraint CK_empleados_sueldo_positivo

 select * from empleados

 update empleados 
 set seccion ='Recursos' 
 where nombre like 'Carlos%'

 alter table empleados 
 nocheck constraint CK_empleados_seccion_lista
  update empleados 
 set seccion ='Recursos' 
 where nombre like 'Carlos%'