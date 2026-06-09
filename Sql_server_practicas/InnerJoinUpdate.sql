/*Trabajando con update */

select * from SalesLT.Customer
select * from SalesLT.Product
select * from SalesLT.CustomerAddress
select * from SalesLT.ProductCategory
select * from SalesLT.ProductDescription
select * from SalesLT.ProductModel

--actualizacion de la tabla categoria con un inner join

update  SalesLT.ProductCategory
set ParentProductCategoryID = e.ProductCategoryID
from SalesLT.ProductModel l inner join 
SalesLT.ProductCategory e
on(e.ProductCategoryID =l.ProductModelID)
where CatalogDescription <> null

select * from SalesLT.ProductCategory
select * from SalesLT.ProductModel
