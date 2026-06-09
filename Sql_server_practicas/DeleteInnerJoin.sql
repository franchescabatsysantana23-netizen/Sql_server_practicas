use AdventureWorksLT2016
go
select * from SalesLT.Product
select * from SalesLT.ProductCategory

select * from SalesLT.Product p inner join SalesLT.ProductCategory pc
on (p.ProductCategoryID =pc.ProductCategoryID)
where pc.ProductCategoryID <6
--- elimina los registros de la tabla productos que son inferiores a 6
delete p from SalesLT.Product p inner join SalesLT.ProductCategory pc
on (p.ProductCategoryID =pc.ProductCategoryID)
where pc.ProductCategoryID <6

