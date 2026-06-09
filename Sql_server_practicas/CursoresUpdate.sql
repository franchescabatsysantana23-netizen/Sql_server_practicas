
/*
un cursor que permita actualizar los registros con los nombres de los registros de la tabla customer. 
*/
use AdventureWorksLT2016
go
declare @nombre varchar(50)
declare miSegundoCursor cursor for
select FirstName [nombre] from AdventureWorksLT2016.SalesLT.Customer
open miSegundoCursor
fetch next from miSegundoCursor 
into @nombre 
while @@fetch_status =0
begin
update AdventureWorksLT2016.SalesLT.Direccion set nombre =@nombre
where current of miSegundoCursor
open miSegundoCursor
fetch next from miSegundoCursor
into @nombre
end 
close miSegundoCursor 
deallocate miSegundoCursor


select * from AdventureWorksLT2016.SalesLT.Direccion
select top 500 FirstName [nombre] from AdventureWorksLT2016.SalesLT.Customer