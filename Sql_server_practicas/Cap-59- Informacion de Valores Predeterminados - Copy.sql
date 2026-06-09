/*
"sp_helpconstraint" retorna una lista de todas las restricciones que tiene una tabla.
- constraint_type: indica que es un valor predeterminado con "DEFAULT", nombrando el campo al que está asociado.

- constraint_name: nombre del valor predeterminado.

- constraint_keys: muestra el texto del valor predeterminado.

Con "sp_helptext" seguido del nombre de un valor predeterminado podemos ver el texto de cualquier valor predeterminado:

 exec sp_helptext NOMBREVALORPREDETERMINADO;

*/

if object_id('empleados') is not null
drop table empleados

if object_id('VP_sueldo') is not null
drop default VP_sueldo

if object_id('VP_seccion') is not null
drop default VP_seccion


create table empleados(
  documento char(8) not null,
  nombre varchar(30) not null,
  seccion varchar(20),
  sueldo decimal(6,2),
  primary key(documento)
);

create default VP_sueldo
 as 500;

 exec sp_bindefault VP_sueldo, 'empleados.sueldo';

 create default VP_seccion
 as 'Secretaria';

exec sp_help;


exec sp_help VP_sueldo;

exec sp_helpconstraint empleados;
exec sp_bindefault VP_seccion, 'empleados.seccion';



exec sp_bindefault VP_seccion, 'empleados.seccion';


exec sp_helptext VP_seccion;

-- Deshacemos la asociación del valor predeterminado "VP_sueldo" y lo eliminamos:
exec sp_unbindefault'empleados.sueldo'; 
drop default VP_sueldo;

exec sp_help VP_sueldo;

-- Vemos si el valor predeterminado "VP_seccion" existe consultando la tabla "sysobjects":
select * from sysobjects
  where xtype='D' and
  name like '%seccion%';