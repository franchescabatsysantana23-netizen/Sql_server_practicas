-- Listar todos los productos cuyo precio sea
--inferior al precio promedio de todos los
-- productos.
--Tablas: Production.Product
--Campos: Name, ListPrice


select Name, ListPrice from Production.Product
where ListPrice < (select avg(ListPrice) as promedio from Production.Product);

--Listar el nombre, precio de lista, precio
-- promedio y diferencia de precios entre cada
--- producto y el valor promedio general.


                   select  Name,precio_de_lista, avg(precio_de_lista) as promedio_producto,
                   diferencia,
                   (select avg(ListPrice) from Production.Product) as promedio_general
                   from 
                   (select Name, ListPrice precio_de_lista, Lead(ListPrice) over (order by ListPrice) -ListPrice as diferencia 
                   from Production.Product) x
                   group by Name,precio_de_lista,diferencia

-- en SQL sirve para obtener el valor de la siguiente fila dentro de un conjunto de resultados, 
-- sin necesidad de hacer un JOIN.

                   /*
                   select ListPrice, Lead(ListPrice) over (order by ListPrice) -ListPrice as diferencia 
                   from Production.Product
                   */

--Mostrar el o los códigos del producto más caro.
--Tablas: Production.Product
--Campos: ProductID,ListPrice

select ProductID, ListPrice from Production.Product
where ListPrice =(select max(ListPrice) [precio de lista maximo] from Production.Product);

--Mostrar el producto más barato de cada subcategoría. Mostrar subcategoría, código de
-- producto y el precio de lista más barato ordenado por subcategoría

--Tablas: Production.Product
--Campos: ProductSubcategoryID, ProductID,
--ListPrice

select ProductSubcategoryID, ProductID,
ListPrice from Production.Product
where ListPrice = (select min(ListPrice) from Production.Product)
order by ProductSubcategoryID

-- Mostrar los nombres de todos los productos presentes en la subcategoría de ruedas
--Tablas: Production.Product,
-- Production.ProductSubcategory
--Campos: ProductSubcategoryID, Name


   select ProductSubcategoryID,Name from Production.Product pp
   where exists 
      (select * from Production.ProductSubcategory ps
       where (ps.ProductSubcategoryID= pp.ProductSubcategoryID)  and (Name like '%Wheels%'))


-- Mostrar todos los productos que no fueron vendidos.
--Tablas: Production.Product,
-- Sales.SalesOrderDetail
--Campos: Name, ProductID
select ProductID, Name from Production.Product p
where not exists (select * from Sales.SalesOrderDetail s
     where s.ProductID=p.ProductID);

--Mostrar la cantidad de personas que no son vendedores.
--Tablas: Person.Person, Sales.SalesPerson
--Campos: BusinessEntityID


select count(*) [ Registro no Vendedores] from Person.Person p
where not exists (select * from Sales.SalesPerson sp
where sp.BusinessEntityID=p.BusinessEntityID)


-- Mostrar todos los vendedores (nombre y apellido) que no tengan asignado un territorio de ventas.
--Tablas: Person.Person, Sales.SalesPerson
--Campos: BusinessEntityID, TerritoryID, LastName, FirstName

select FirstName, LastName from Person.Person p
where exists (select * from Sales.SalesPerson s
                  where (s.BusinessEntityID =p.BusinessEntityID)
                         and (s.TerritoryID is null))

-- Mostrar las órdenes de venta que se hayan facturado en territorio de Estados Unidos únicamente con “US”.
--Tablas: Sales.SalesOrderHeader,
-- Sales.SalesTerritory
--Campos: CountryRegionCode, TerritoryID

select * from Sales.SalesOrderHeader soh
where TerritoryID in ( select 1 from Sales.SalesTerritory st
                      where (st.TerritoryID=soh.TerritoryID) and (st.CountryRegionCode ='US'))

-- Al ejercicio anterior agregar órdenes de Francia e Inglaterra.
--Tablas: Sales.SalesOrderHeader,
--Sales.SalesTerritory
--Campos: CountryRegionCode, TerritoryID

select * from Sales.SalesOrderHeader soh
where TerritoryID in ( select TerritoryID from Sales.SalesTerritory st
                      where (st.TerritoryID=soh.TerritoryID) 
                      and (st.CountryRegionCode in ('US','FR','GB')))
-- Mostrar los nombres de los diez productos más caros.
--Tablas: Production.Product
--Campos: ListPrice

select top 10 Name from Production.Product
order by ListPrice desc;

-- Mostrar aquellos productos cuya cantidad de pedidos de venta sea igual o superior a 20.
--Tablas: Production.Product,
-- Sales.SalesOrderDetail
--Campos: Name, ProductID , OrderQty

select ProductID,Name from Production.Product p
where ProductID in (select ProductID from Sales.SalesOrderDetail s
                     where OrderQty >=20);

-- Mostrar los nombres de todos los productos de ruedas que fabrica Adventure Works Cycles.
--Tablas: Production.Product,
--Production.ProductSubcategory
--Campos: Name, ProductSubcategoryID

select p.ProductSubcategoryID, p.Name  nombre from Production.Product p
where p.ProductSubcategoryID = any
          (select ps.ProductSubcategoryID from Production.ProductSubcategory ps
            where ps.Name like '%Wheels%')

-- Mostrar los clientes ubicados en un territorio no cubierto por ningún vendedor. 
--Tablas: Sales.Customer, Sales.SalesPerson
--Campos: TerritoryID

select * from Sales.Customer
where TerritoryID <> all
  (select TerritoryID from Sales.SalesPerson)


-- Listar los productos cuyos precios de venta sean mayores o iguales que el precio de venta
-- máximo de cualquier subcategoría de producto.
--Tablas: Production.Product
--Campos: Name, ListPrice, ProductSubcategoryID

select ProductSubcategoryID, Name, ListPrice 
from Production.Product
where ListPrice >= any (
     select max(ListPrice) [precio maximo producto]
            from Production.Product
            group by ProductSubcategoryID)















