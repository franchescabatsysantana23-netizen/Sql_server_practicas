-- instruccion para enscriptacion del trigger....
/*
create triggre NOMBREDISPARADOR
  on NOMBRETABLAoVISTA
  with encryption  (evita que el trigger sea leido con el comando sp_helptext)
  MOMENTODEDISPARO--after o instead of
  ACCION-- insert, update, delete
  as 
    SENTENCIAS
    */
-- exec sp_helptext nombredeltrigger;

 if object_id('empleados') is not null
  drop table empleados;
 if object_id('secciones') is not null
  drop table secciones;
go
create table secciones(
  codigo int identity,
  nombre varchar(30),
  constraint pk_secciones primary key (codigo)
 ); 
 go
  create table empleados(
  documento char(8) not null,
  nombre varchar(30),
  domicilio varchar(30),
  seccion int not null,
  constraint pk_empleados primary key (documento),
  constraint fk_empleados_seccion foreign key(seccion)
   references secciones (codigo)
 );
 go
 insert into secciones values('Secretaria');
 insert into secciones values('Sistemas');
 insert into secciones values('Contaduría');
 insert into secciones values('Gerencia');
 go
 insert into empleados values('22222222','Alejandro Acosta','Avellaneda 90',1);
 insert into empleados values('22333333','Betina Bustos','Bulnes 345',2);
 insert into empleados values('23444444','Camila Costa','Colon 234',1);
 insert into empleados values('23555555','Daniel Duarte','Duarte Quiros 345',3);
 insert into empleados values('23666666','Estela Esperanza','España 211',4);

 select * from secciones; 
 select * from empleados; 
  
  select documento, e.nombre [nombre empleado], domicilio, seccion,s.nombre
  from empleados e inner join secciones s
  on e.seccion =s.codigo



 /*
 3- Cree un disparador de eliminación sobre la tabla "empleados" que permita borrar varios empleados 
     a la vez, pero ningún empleado de la sección "Gerencia".
    Se eliminan todos los empleados solicitados en cualquier sentencia "delete", y luego se vuelven a 
     insertar aquellos de la sección "Gerencia".
 */

 drop trigger TR_eliminar_empleados

create trigger TR_eliminar_empleados on dbo.empleados
  --with encryption 
   for delete
    as  
       begin 
          set nocount on; 

        if(select s.nombre from deleted d 
             inner join secciones s
             on d.seccion =s.codigo)!='Gerencia'

            delete e from empleados e
            inner join deleted d
            on d.seccion =e.seccion inner join secciones s
            on e.seccion=s.codigo
            where s.nombre!='Gerencia'

        else

          begin 
             raiserror('No se puede eliminar el registro del empleado de la seccion Gerencia',16,1)
           end;
     end;
    

  
  
  -- intento de eliminar a un empleado dentro de la condicion de restrinccion 
 delete from empleados
 where documento='23666666'
   
delete from empleados 
where documento in ('23666666','22222222')

   select * from empleados;



  select s.nombre from deleted d inner join secciones s
  on d.seccion =s.codigo