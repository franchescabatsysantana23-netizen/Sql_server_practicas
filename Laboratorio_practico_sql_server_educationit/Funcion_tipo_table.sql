 declare @resultado table(
  productID int, 
  ListPrice money, 
  promedio_venta money
   )

 drop function dbo.promedio_venta
create function dbo.promedio_venta()
returns @resultado table(
  productID int, 
  ListPrice money, 
  promedio_venta money
   )
as 
  begin 
       declare @promedio_venta money 
       select @promedio_venta=avg(LineTotal) from Sales.SalesOrderDetail
       insert into @resultado
       select ProductID,ListPrice,@promedio_venta 
       from Production.Product 
       where ListPrice <@promedio_venta
       return 
   end     
 



select * from dbo.promedio_venta()