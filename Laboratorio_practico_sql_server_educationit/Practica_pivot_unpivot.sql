select * from Sales.SalesOrderHeader; --SalesOrderID, TotalDue,orderdate
select * from Sales.SalesOrderDetail --SalesOrderID,LineTotal,ProductID
select * from Production.Product; --ProductID, ProductSubcategoryID
select * from Production.ProductSubcategory;  -- ProductSubcategoryID,ProductCategoryID
select * from Production.ProductCategory; --ProductCategoryID,name



select * from(
      select year(SellStartDate) [Ano],
      ListPrice
      from Production.Product
     ) as ar
     pivot(avg(ListPrice) for Ano in ([2008],[2011],[2012],[2013])) as z


     select * from (
     select year(ModifiedDate) [Ano],
     OrderQty [cantidad], ProductID
     from Sales.SalesOrderDetail) as t
     pivot (sum(cantidad) for Ano in ([2011],[2012],[2013])) as d


select * from (
     select ProductID, year(ModifiedDate) [Año] from 
        Sales.SalesOrderDetail) t
        pivot (count(ProductID) for Año in ([2011],[2012],[2013],[2014]) )p



with consulta_to_pivot as(
select year(orderDate) [Año],pc.Name [Nombre Categoria],
sod.LineTotal
from Sales.SalesOrderHeader soh inner join 
Sales.SalesOrderDetail sod
on soh.SalesOrderID=sod.SalesOrderID inner join 
Production.Product p 
on sod.ProductID=p.ProductID inner join 
Production.ProductSubcategory ps on
p.ProductSubcategoryID=ps.ProductSubcategoryID inner join Production.ProductCategory pc
on ps.ProductCategoryID=pc.ProductCategoryID
)
select * from consulta_to_pivot
pivot(sum(LineTotal) for Año in ([2011],[2012],[2013],[2014])) as piv /*total de ordenes vendida por categoria*/
unpivot(LineTotal for Año in ([2011],[2012],[2013],[2014])) as unpiv




with consulta_to_pivot3 as(
select year(orderDate) [Año],pc.Name [Nombre Categoria],
p.ProductID
from Sales.SalesOrderHeader soh inner join 
Sales.SalesOrderDetail sod
on soh.SalesOrderID=sod.SalesOrderID inner join 
Production.Product p 
on sod.ProductID=p.ProductID inner join 
Production.ProductSubcategory ps on
p.ProductSubcategoryID=ps.ProductSubcategoryID inner join Production.ProductCategory pc
on ps.ProductCategoryID=pc.ProductCategoryID
)
select * from consulta_to_pivot3
pivot(count(ProductID) for Año in ([2011],[2012],[2013],[2014]) ) as p
unpivot(ProductID  for Año in ([2011],[2012],[2013],[2014])) as unp



with consulta_to_pivot2 as(
select year(orderDate) [Año],ps.Name [Nombre_Subcategoria],
sod.LineTotal
from Sales.SalesOrderHeader soh inner join 
Sales.SalesOrderDetail sod
on soh.SalesOrderID=sod.SalesOrderID inner join 
Production.Product p 
on sod.ProductID=p.ProductID inner join 
Production.ProductSubcategory ps on
p.ProductSubcategoryID=ps.ProductSubcategoryID inner join Production.ProductCategory pc
on ps.ProductCategoryID=pc.ProductCategoryID
)
select * from consulta_to_pivot2 
pivot(sum(LineTotal) for Año in ([2011],[2012],[2013],[2014]))as rep1 order by Nombre_Subcategoria


---------- Unpivot


-- cantidad de productos por categoria y anio 
with consulta_to_pivot3 as(
select year(orderDate) [Año],pc.Name [Nombre Categoria],
p.ProductID
from Sales.SalesOrderHeader soh inner join 
Sales.SalesOrderDetail sod
on soh.SalesOrderID=sod.SalesOrderID inner join 
Production.Product p 
on sod.ProductID=p.ProductID inner join 
Production.ProductSubcategory ps on
p.ProductSubcategoryID=ps.ProductSubcategoryID inner join Production.ProductCategory pc
on ps.ProductCategoryID=pc.ProductCategoryID
)
select * from consulta_to_pivot3
pivot(count(ProductID) for Año in ([2011],[2012],[2013],[2014]) ) as p
unpivot(ProductID  for Año in ([2011],[2012],[2013],[2014])) as unp


---- unpiv

-- total vendido por categoria 
with consulta_to_pivot as(
select year(orderDate) [Año],pc.Name [Nombre Categoria],
sod.LineTotal
from Sales.SalesOrderHeader soh inner join 
Sales.SalesOrderDetail sod
on soh.SalesOrderID=sod.SalesOrderID inner join 
Production.Product p 
on sod.ProductID=p.ProductID inner join 
Production.ProductSubcategory ps on
p.ProductSubcategoryID=ps.ProductSubcategoryID inner join Production.ProductCategory pc
on ps.ProductCategoryID=pc.ProductCategoryID
)
select * from consulta_to_pivot
pivot(sum(LineTotal) for Año in ([2011],[2012],[2013],[2014])) as piv /*total de ordenes vendida por categoria*/
unpivot(LineTotal for Año in ([2011],[2012],[2013],[2014])) as unpiv



