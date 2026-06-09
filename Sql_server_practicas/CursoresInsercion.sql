/*
select * from SalesLT.Persona

select * from SalesLT.Persona
select * from SalesLT.Address

create table SalesLT.Direccion (nombre varchar(50), direccion varchar(50))
*/


---Declarar las variables a ser utilizadas en cada iteraccion
declare @nombre varchar(50), @direccion varchar(50)

declare miPrimerCursor Cursor for 
 select name, address from AdventureWorksLT2016.SalesLT.Persona

 open miPrimerCursor
 --leo el primer registro y almaceno los campos de las variables 
 fetch next from miPrimerCursor
 into @nombre, @direccion
-- mientras fetch_status =0 , quiere indicar que no ha llegado al final de la tabla
while @@fetch_status =0
begin
insert into SalesLT.Direccion values(@nombre, @direccion)
---inserto el registro en una tabla.
-- Pasamos al siguiente registro 
fetch next from miPrimerCursor
into @nombre, @direccion

end
close miPrimerCursor
deallocate miPrimerCursor

Select * from SalesLT.Direccion
select * from SalesLT.Persona

