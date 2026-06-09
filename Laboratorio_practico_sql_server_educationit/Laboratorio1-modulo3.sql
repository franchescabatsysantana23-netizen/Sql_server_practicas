
--1. Mostrar los empleados que también son vendedores.
--Tablas: HumanResources.Employee, Sales.SalesPerson
--Campos: BusinessEntityID
use AdventureWorks2022;


select e.BusinessEntityID,e.JobTitle,s.BusinessEntityID
from HumanResources.Employee e,
Sales.SalesPerson s
where e.BusinessEntityID= s.BusinessEntityID

--2.Mostrar los empleados ordenados alfabéticamente por apellido y por nombre.
--Tablas: HumanResources.Employee, Person.Person
--Campos: BusinessEntityID, LastName, FirstName

select e.BusinessEntityID, FirstName, LastName 
from HumanResources.Employee e inner join Person.Person p
on e.BusinessEntityID = p.BusinessEntityID
order by FirstName , LastName ;

---3. Mostrar el código de logueo, código de territorio y sueldo básico de los vendedores.
---Tablas: HumanResources.Employee, Sales.SalesPerson
---Campos: LoginID, TerritoryID, Bonus, BusinessEntityID

     select LoginID,TerritoryID, Bonus, e.BusinessEntityID
          from HumanResources.Employee e 
          inner join Sales.SalesPerson s
          on s.BusinessEntityID =e.BusinessEntityID;
---4.Mostrar los productos que sean ruedas.
--Tablas: Production.Product, Production.ProductSubcategory
--Campos: Name, ProductSubcategoryID

select p.Name as 'nombre de producto',ps.ProductSubcategoryID, 
ps.Name from Production.Product as p
left join Production.ProductSubcategory as ps
on ps.ProductSubcategoryID =p.ProductSubcategoryID
where ps.name like '%wheel%'
 
 --- 5. Mostrar los nombres de los productos que no son bicicletas.
 --Tablas:Production.Product, Production.ProductSubcategory
--Campos: Name, ProductSubcategoryID

 select p.Name as 'nombre de producto',ps.ProductSubcategoryID, 
ps.Name 'nombre de subcategoria de producto' 
from Production.Product as p
left join Production.ProductSubcategory as ps
on ps.ProductSubcategoryID =p.ProductSubcategoryID
where not ps.name like '%Bike%'


---6. Mostrar los precios de venta de aquellos productos
---donde el precio de venta sea inferior al precio de lista
---recomendado para ese producto ordenados por
---nombre de producto.
--Tablas: Sales.SalesOrderDetail, Production.Product
--Campos: ProductID, Name, ListPrice, UnitPrice

  select * from Sales.SalesOrderDetail;
  select * from Production.Product;

  select pp.ProductID, pp.Name,so.UnitPrice 'precio de venta',pp.ListPrice 'precio de lista'
  from Production.Product as pp
  left join Sales.SalesOrderDetail as so
  on (pp.ProductID =so.ProductID)
  where so.UnitPrice <pp.ListPrice
  order by pp.Name


--7. Mostrar todos los productos que tengan igual precio. Se
-- deben mostrar de a pares, código y nombre de cada
-- uno de los dos productos y el precio de ambos. Ordenar
-- por precio en forma descendente.
 --Tablas:Production.Product
 --Campos: ProductID, ListPrice, Name
   
 
   
   select pp.ProductID,pp.Name,pp.ListPrice
   from Production.Product pp
  group by pp.ProductID,pp.Name,pp.ListPrice
  having count(distinct ListPrice)=1
  order by pp.ListPrice desc;
  

  SELECT p1.ProductiD, p1.Name, p1.ListPrice, p2.ProductiD, p2.Name, p2.ListPrice
FROM Production.Product p1
INNER JOIN Production.Product p2
ON p1.ListPrice = p2.ListPrice
WHERE p1.ProductID > p2.ProductID
ORDER BY p1.ListPrice DESC;



-- 8. Mostrar el nombre de los productos y de los
--  proveedores cuya subcategoría es 15 ordenados por
--  nombre de proveedor.
  -- Tablas: Production.Product, Purchasing.ProductVendor, Purchasing.Vendor
  -- Campos: Name ,ProductID, BusinessEntityID, ProductSubcategoryID

  select * from Production.Product;
  select * from Purchasing.ProductVendor; 
  select * from Purchasing.Vendor;

 select purv.Name ,p.ProductID, purv.BusinessEntityID,p.ProductSubcategoryID
 from Production.Product p left join Purchasing.ProductVendor pv
  on (p.ProductID =pv.ProductID) inner join Purchasing.Vendor purv
  on (pv.BusinessEntityID =purv.BusinessEntityID)
  where p.ProductSubcategoryID =15
  order by purv.Name

-- 9. Mostrar todas las personas (nombre y apellido) y en el
-- caso de que sean empleados mostrar también el login
-- ID, mostrar NULL.
   -- Tablas: Person.Person, HumanResources.Employee
   -- Campos: FirstName, LastName, LoginID

   select * from Person.Person;
   select * from HumanResources.Employee;
  select  FirstName, LastName, LoginID 
          from Person.Person p left join HumanResources.Employee e
          on (p.BusinessEntityID=e.BusinessEntityID)
