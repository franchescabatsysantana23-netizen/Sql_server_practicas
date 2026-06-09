---1. Mostrar el ID de los empleados que tienen más de 90 horas de vacaciones.
--Tablas: HumanResources.Employee
--Campos: VacationHours, BusinessEntityID

select BusinessEntityID, VacationHours
from HumanResources.Employee
where VacationHours>90;


-- 2. Mostrar el nombre, precio de lista y precio de lista con IVA de los productos con precio
-- distinto de cero.
--Tablas: Production.Product
--Campos: Name, ListPrice

select Name,ListPrice, ListPrice+(ListPrice*0.18) as 'Precio de lista con iva'
from Production.Product
where ListPrice <>0

--3. Mostrar precio de lista y nombre de los productos 776, 777, 778
--Tablas: Production.Product
--Campos: ProductID, Name, ListPrice

select Name, ListPrice from Production.Product
where ProductID in (776, 777, 778)

-- 4. Mostrar el nombre concatenado con el apellido de las personas cuyo apellido sea Johnson.
--Tablas: Person.Person
--Campos: FirstName, LastName

select concat(FirstName, ' ', LastName) 'Nombre Completo'
from Person.Person
where LastName='Johnson';

---5. Mostrar todos los productos cuyo precio de lista sea inferior a $150 de color rojo o cuyo
-- precio de lista sea mayor a $500 de color negro.
--Tablas: Production.Product
--Campos: ProductID, ListPrice, Color

  select ProductID, ListPrice, Color from Production.Product
  where (ListPrice<150 and color='Red') or (ListPrice>500 and color='Black');

--6. Mostrar el ID, fecha de ingreso y horas de vacaciones de los empleados que ingresaron
-- a partir del año 2000.
--Tablas: HumanResources.Employee
--Campos: BusinessEntityID, HireDate, VacationHours

select  BusinessEntityID, HireDate, VacationHours
from HumanResources.Employee
where year(HireDate)>=2000;

-- 7. Mostrar el nombre, número de producto, precio de lista y el precio de lista
-- incrementado en un 10% de los productos cuya fecha de fin de venta sea anterior al día de hoy.
   --Tablas: Production.Product
   --Campos: Name, ProductNumber, ListPrice,SellEndDate

   select Name, ProductNumber, ListPrice,ListPrice+(ListPrice*0.10) as 'precio incrementado',
   SellEndDate from Production.Product
   --where SellEndDate <='2026-03-07'
   where SellEndDate <=DATEADD(DAY, -1, GETDATE())

   ------------------Ejercicio 2: AdventureWorks . NULL---------------------

   -- 1. Mostrar los representantes de ventas (vendedores) que no tienen definido el número de territorio.
   --Tablas: Sales.SalesPerson
   --Campos: BusinessEntityID, TerritoryID
   select BusinessEntityID, TerritoryID from Sales.SalesPerson
   where TerritoryID is null;

   --- 2. Mostrar el peso de todos los artículos. Si el peso no estuviese definido, reemplazar por cero.
   --Tablas: Production.Product
   --Campos: ProductID, Weight

   select ProductID, Weight, Weight= case when Weight is null then 0 else Weight end 
   from Production.Product


















 





