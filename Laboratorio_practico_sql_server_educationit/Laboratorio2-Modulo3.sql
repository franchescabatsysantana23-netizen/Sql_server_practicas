use AdventureWorks2022;


--1. Clonar estructura y datos de los campos
--   nombre, color y precio de lista de la tabla
--   Production.Product en una tabla llamada #Productos.

            select Name,ListPrice,Color 
            into #productos
            from Production.Product;

            select * from #productos;


-- 2. Clonar solo estructura de los campos identificador, nombre y apellido de la tabla.
--    Person.Person en una tabla llamada #Personas.

     --Tablas: Person.Person
     --Campos: BusinessEntityID, FirstName, LastName

   select BusinessEntityID, FirstName, LastName
   into #Personas
   from Person.Person
   where 1=0;

   select * from #Personas;

--3. Eliminar si existe la tabla #Productos

 if OBJECT_ID('#productos') is not null
 drop table #productos;

 select * from #productos;
  
  -- 4. Eliminar si existe la tabla #Personas.
  if object_id('#Personas') is not null
  drop table #Personas;


 -- 5. Crear una CTE con las órdenes de venta.

      -- Tablas: Sales.SalesOrderHeader
      -- Campos: SalesPersonID, SalesOrderID, OrderDate


      with Sales as (
      select SalesPersonID, SalesOrderID, OrderDate
      from Sales.SalesOrderHeader
      )
      select * from Sales;

