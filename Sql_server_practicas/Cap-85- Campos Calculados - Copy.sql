/*
un campo calculado es un campo que no se almacena fisicamente en la tabla.
un campo calculado no puede ser definido not null, ser una subconsulta,
tener restrincion default o foreign key.
insertarse ni actualizarse. 
Puede ser empleado como llave de un índice o parte de restricciones 
"primary key" o "unique" si la expresión que la define no cambia en cada consulta.


ejemplo de campo calculado mediante una creacion de una tabla.
create table empleados(
  documento char(8),
  nombre varchar(10),
  domicilio varchar(30),
  sueldobasico decimal(6,2),
  cantidadhijos tinyint default 0,
  sueldototal as sueldobasico + (cantidadhijos*100)
 );
También se puede agregar un campo calculado a una tabla existente:

 alter table NOMBRETABLA
  add NOMBRECAMPOCALCULADO as EXPRESION;

 alter table empleados
  add sueldototal as sueldo+(cantidadhijos*100);

  los campos de los cuales depende el campo calculado no puede eliminarse, se debe eliminarse primero el campo calculado. 


*/

--contenido Practico

if object_id('empleados') is not null
drop table empleados
/*
creacion de la tabla sueldo con un campo calculado.
*/

create table empleados(
documento char(8),
nombre varchar(10),
domicilio varchar(30),
sueldobasico decimal(6,2),
hijos tinyint not null default 0,
sueldototal as sueldobasico +(hijos*100))

/*
Insercion de los registros 
*/

insert into empleados values('22222222','Juan Perez','Colon 123',300,2);
insert into empleados values('23333333','Ana Lopez','Sucre 234',500,0);

select * from empleados


-- Actualizamos un registro:
update empleados set hijos=1 where documento='23333333';

select * from empleados;

-- Agregamos un campo calculado:
alter table empleados
  add salariofamiliar as hijos*100;

exec sp_columns empleados;

select * from empleados;

--Practica

--eliminacion del objeto articulo si este existe. 
if object_id('articulos') is not null
drop table articulos

---creacion de tabla con campo calculado
create table articulos(
  codigo int identity,
  descripcion varchar(30),
  precio decimal(5,2) not null,
  cantidad smallint not null default 0,
  montototal as precio *cantidad
 );

  insert into articulos values('birome',1.5,100,150);
  /*insercion del registro sin el campo calculado.*/
    insert into articulos values('birome',1.5,100);

	/*
	insercion del registro.
	*/
 insert into articulos values('birome',1.5,100);
 insert into articulos values('cuaderno 12 hojas',4.8,150);
 insert into articulos values('lapices x 12',5,200);

 select * from articulos

 --5- Actualice un precio y recupere los registros:
 update articulos
 set precio =2
 where descripcion='birome'

 --Actualice una cantidad y vea el resultado:
 update articulos 
 set cantidad =200
 where descripcion ='birome'

 select * from articulos
 --7- Intente actualizar un campo calculado:
 update articulos
 set montototal =500
 where descripcion ='birome'

