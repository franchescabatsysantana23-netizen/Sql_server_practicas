-- 1.Obtener el total de ventas del año 2014 y
-- guardarlo en una variable llamada
-- @TotalVentas, luego imprimir el resultado.

--Tablas: Sales.SalesOrderDetail
--Campos: LineTotal
declare @TotalVentas decimal=0;

select  @TotalVentas=sum(LineTotal) from Sales.SalesOrderDetail
where year(ModifiedDate) = 2014

print(@TotalVentas)

-- 2. Obtener el promedio de ventas y guardarlo en una variable llamada @Promedio luego hacer
-- un reporte de todos los productos cuyo precio de venta sea menor al Promedio.
--Tablas: Production.Product
--Campos: ListPrice, ProductID

declare @promedio money

select @promedio =avg(ListPrice) from Production.Product;

select ProductID,ListPrice  from Production.Product
   where ListPrice < @promedio

-- Utilizando la variable @Promedio incrementar en un 10%
-- el valor de los productos sean inferior al promedio.
--Tablas: Production.Product
--Campos: ListPrice
select ListPrice, (ListPrice*0.10) + ListPrice as [precio con aumento]
from Production.Product
   where ListPrice < @promedio

-- Crear un variable de tipo tabla con las categorías y
-- subcategoría de productos y reportar el resultado.
--Tablas: Production.ProductSubcategory, Production.ProductCategory
--Campos: Name

declare @mitabla table (
   categoria varchar(30),
   subcategoria varchar(30)
   )
   insert into @mitabla 
   select nombre_categoria,nombre_subcategoria from (
   select pc.name [nombre_categoria], ps.name [nombre_subcategoria]
   from Production.ProductCategory pc inner join Production.ProductSubcategory ps
   on ps.ProductCategoryID =pc.ProductCategoryID)x

   select * from @mitabla
   --Analizar el promedio de la lista de precios de productos, si su valor es menor 500.
   --imprimir el mensaje el PROMEDIO BAJO de lo contrario imprimir el mensaje PROMEDIO ALTO

   declare @promedio1 money

     select @promedio1 =avg(ListPrice) from Production.Product;
     
     
     if (@promedio1)<500
           print ('promedio bajo '+ cast(@promedio1 as varchar));
     else 
           print ('promedio alto ' +cast(@promedio1 as varchar));
