/*
La restricción "check" especifica los valores que acepta un campo, evitando que se ingresen valores inapropiados.
La sintaxis básica es la siguiente:
 alter table NOMBRETABLA
 add constraint NOMBRECONSTRAINT
 check CONDICION;
 Los campos correspondientes a los precios (minorista y mayorista) se definen de tipo decimal(5,2),
 es decir, aceptan valores entre -999.99 y 999.99. Podemos controlar que no se ingresen valores negativos
 para dichos campos agregando una restricción "check":

 alter table libros
 add constraint CK_libros_precio_positivo
 check (preciomin>=0 and preciomay>=0);

 La condición puede hacer referencia a otros campos de la misma tabla.
 alter table libros
 add constraint CK_libros_preciominmay
 check (preciomay<=preciomin);
Un campo puede tener varias restricciones restricciones "check" y una restricción "check" puede incluir varios campos.
Las condiciones para restricciones "check" también pueden pueden incluir un patrón o una lista de valores.
"null" es un valor aceptado aunque no esté incluido en la condición de restricción.

*/

use bd1

if object_id('libros') is not null
drop table libros

create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  preciomin decimal(5,2),
  preciomay decimal(5,2)
);
select * from libros

insert into libros values ('Uno','Bach','Planeta',22,20);
insert into libros values ('El quijote','Cervantes','Emece',15,13);
insert into libros values ('Aprenda PHP','Mario Molina','Siglo XXI',48,53);
insert into libros values ('Java en 10 minutos','Garcia','Siglo XXI',35,40);


-- Agregamos una restricción "check" para asegurar que los valores de los campos
-- correspondientes a precios no puedan ser negativos:
alter table libros
  add constraint CK_libros_precios_positivo
  check (preciomin>=0 and preciomay>=0);

update libros set preciomay=48
  where titulo='Aprenda PHP';

delete from libros where titulo='Java en 10 minutos'; 

-- Agregamos la restricción "check" que impida que se ingresen valores 
-- para "preciomay" superiores a "preciomin":
alter table libros
 add constraint CK_libros_preciominmay
 check (preciomay<=preciomin);

exec sp_helpconstraint libros;

insert into libros default values;

select * from libros;

-- Genera un error si intentamos ingresar un preciomin negativo
insert into libros values ('Java Total','Martinez','Cuello',-1,40);


--Primera Practica

if object_id('empleados') is not null
drop table empleados

create table empleados(
documento varchar(8),
nombre varchar(30),
fechanacimiento datetime,
cantidadhijos tinyint,
seccion varchar(20),
sueldo decimal(6,2))

 alter table empleados
   add constraint CK_empleados_sueldo_positivo
   check (sueldo>0);

   select * from empleados

 insert into empleados values ('22222222','Alberto Lopez','1965/10/05',1,'Sistemas',1000);
 insert into empleados values ('33333333','Beatriz Garcia','1972/08/15',2,'Administracion',3000);
 insert into empleados values ('34444444','Carlos Caseres','1980/10/05',0,'Contaduria',4000);
  insert into empleados values ('34444444','Carlos Caseres','1980/10/05',0,'Contaduria',600);
    insert into empleados values ('34444444','Carlos Caseres','1980/10/05',0,'Contaduria',6000);
  alter table empleados
   add constraint CK_empleados_sueldo_maximo
   check (sueldo<=5000);

delete from empleados
exec sp_helpconstraint empleados

select * from empleados

 alter table empleados
   add constraint CK_fechanacimiento_actual
   check (fechanacimiento<getdate());

   exec sp_helpconstraint empleados

    alter table empleados
   add constraint CK_empleados_seccion_lista
   check (seccion in ('Sistemas','Administracion','Contaduria'));

   delete from empleados

   alter table empleados 
   add constraint CK_empleados_cantidadhijos
   check (cantidadhijos between 0 and 15)

   exec sp_helpconstraint empleados

   insert into empleados values ('34444444','Carlos Caseres','1980/10/05',0,'Contaduria',600);
   insert into empleados values ('34444444','Carlos Caseres','1980/10/05',0,'Informatica',600);

     insert into empleados values ('34444444','Carlos Caseres','1980/10/05',0,'Contaduria',20000);
	 insert into empleados values ('34444444','Carlos Caseres','1980/10/05',0,'Contaduria',-20000);
	 insert into empleados values ('34444444','Carlos Caseres','1980/10/05',21,'Contaduria',5000);
	  insert into empleados values ('34444444','Carlos Caseres','1980/10/05',14,'Contaduria',5000);
 alter table empleados
   add constraint CK_seccion_letrainicial
   check (seccion like '%B');

   ---Segunda Practica

   if object_id('vehiculos') is not null
   drop table vehiculos

   create table vehiculos(
   numero int identity,
   patente char(6),
   tipo char(4),
   fechahoraentrada datetime,
   fechahorasalida datetime)

 insert into vehiculos values('AIC124','auto','2007/01/17 8:05','2007/01/17 12:30');
 insert into vehiculos values('CAA258','auto','2007/01/17 8:10',null);
 insert into vehiculos values('DSE367','moto','2007/01/17 8:30','2007/01/17 18:00');

 select * from vehiculos

  alter table vehiculos
   add constraint CK_vehiculos_patente_patron
   check (patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]');

 insert into vehiculos values('AB1234','auto',getdate(),null);

  alter table vehiculos
   add constraint CK_vehiculos_tipo_valores
   check (tipo in ('auto','moto'));

    update vehiculos set tipo='bici' where patente='AIC124';

alter table vehiculos
add constraint DF_vehiculos_tipo
default 'bici'
for tipo;

insert into vehiculos values('SDF134',default,null,null);

----10
 alter table vehiculos
   add constraint CK_vehiculos_fechahoraentrada_actual
   check (fechahoraentrada<=getdate());
---11
 alter table vehiculos
   add constraint CK_vehiculos_fechahoraentradasalida
   check (fechahoraentrada<=fechahorasalida);
   --11-
    insert into vehiculos values('ABC123','auto','2007/05/05 10:10',null);
	--13-
	 update vehiculos set fechahorasalida='2007/01/17 7:30'
      where patente='CAA258';

	  --14-
	  exec sp_helpconstraint vehiculos;
	  --15-
	   alter table vehiculos
       add constraint DF_vehiculos_fechahoraentrada
       default getdate()
       for fechahoraentrada; 
	   
	   insert into vehiculos values('DFR156','moto',default,default);

	   select * from vehiculos

	   exec sp_helpconstraint vehiculos