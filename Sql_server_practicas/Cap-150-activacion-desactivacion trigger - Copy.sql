
 alter table NOMBRETABLA 
  ENABLE | DISABLE trigger NOMBREDISPARADOR;

   alter table NOMBRETABLA 
  ENABLE | DISABLE TRIGGER all; -- instruccion para habilitar y deshabilitar los trigger de una tabla en 
                                -- especifico.
-- deshabilitar trigger 


alter table dbo.empleados
disable trigger TR_verificar_sueldo_empleado 


-- habilitar trigger 
alter table dbo.empleados
enable trigger TR_verificar_sueldo_empleado 
