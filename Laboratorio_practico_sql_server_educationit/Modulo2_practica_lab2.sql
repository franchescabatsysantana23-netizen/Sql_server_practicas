---> 1. Mostrar la fecha más reciente de venta.
use AdventureWorks2022; --> cambia de BD..

select * from Sales.SalesOrderHeader
order by OrderDate desc ;

-- otra solucion
select max(OrderDate) from Sales.SalesOrderHeader

--> Mostrar el precio más barato de todas las bicicletas.
select Name, ListPrice from Production.Product
where (ListPrice != 0) and (name like '%BIKE%')
order by ListPrice asc; 


select Name, MIN(ListPrice) precio_minimo from Production.Product
where (ListPrice != 0) and (name like '%BIKE%')
order by ListPrice asc; 


---> Mostrar la fecha de nacimiento del empleado más joven.
--Tablas: HumanResources.Employee
--Campos: BirthDate

select * from HumanResources.Employee
order by BirthDate desc;


-- Mostrar el promedio del listado de precios de
-- productos
-- Tablas: Production.Product
-- Campos: ListPrice

select avg(ListPrice) promedio_precio 
from Production.Product
where not ListPrice is null;


-- Mostrar la cantidad de ventas y el total vendido.
--Tablas: Sales.SalesOrderDetail
--Campos: LineTotal

select 
 count(1) cantidad_ventas,
sum(LineTotal) total_vendido
from Sales.SalesOrderDetail;





  



