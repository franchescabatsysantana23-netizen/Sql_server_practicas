
--                       Funciones Escalares
-- Crear una función que devuelva el promedio de los productos.
--Tablas: Production.Product
--Campos: ListPrice

if OBJECT_ID('dbo.f_promedio') is not null
drop function dbo.f_promedio;

create function dbo.f_promedio()
 returns money
 as
 begin
      declare @promedio money;
      select @promedio=avg(ListPrice) from Production.Product
      return @promedio
   end;

   select dbo.f_promedio();

-- Crear una función que, dado un código de producto, devuelva el total de ventas para
-- dicho producto. Luego, mediante una consulta, traer código y total de ventas.
-- Tablas: Sales.SalesOrderDetail
-- Campos: ProductID, LineTotal

alter function dbo.totalVentas(@codigo_producto int)
 returns money 
 as 
    begin
       declare @totalVentas money;
       select @totalVentas=sum(LineTotal) from Sales.SalesOrderDetail
       where ProductID =@codigo_producto
       if (@totalVentas is null)
         set @totalVentas =0

       return @totalVentas
    end;

     select productID,  dbo.totalVentas(712)
      from Sales.SalesOrderDetail
      where ProductID=712


-- Crear una función que, dado un código, devuelva la cantidad de productos vendidos o
-- cero si no se ha vendido.
--Tablas: Sales.SalesOrderDetail
--Campos: ProductID, OrderQty

alter  function dbo.cantidad_productos (@codigo_producto int)
returns int
  as 
   begin 
      declare @cantidad_venta int;
          select @cantidad_venta = sum(OrderQty) 
          from Sales.SalesOrderDetail
          where ProductID=@codigo_producto
      
          if (@cantidad_venta is null)
             set @cantidad_venta=0;
  
          return @cantidad_venta
   end;
       
    select dbo.cantidad_productos(773)

-- Crear una función que devuelva el promedio de venta, luego obtener los productos cuyo
-- precio sea inferior al promedio.
--Tablas: Sales.SalesOrderDetail, Production.Product
--Campos: ProductID, ListPrice
drop function dbo.promedio_venta
   
   create function dbo.promedio_venta ()
   returns money
    as 
     begin 
       declare @promedioVenta money
       select @promedioVenta =avg(LineTotal) from  Sales.SalesOrderDetail
       return @promedioVenta 
     end;

     select productID,ListPrice from Production.Product
     where ListPrice <dbo.promedio_venta();

       select * from Sales.SalesOrderDetail;


--                      Funciones en tabla en linea

--Crear una función que, dado un año, devuelva nombre y apellido de los empleados que ingresaron ese año. 
--Tablas: Person.Person, HumanResources.Employee
--Campos: FirstName, LastName,HireDate, BusinessEntityID
  select p.BusinessEntityID ,p.FirstName , p.LastName, 
           e.HireDate
           from Person.Person p inner join HumanResources.Employee e
            on p.BusinessEntityID =e.BusinessEntityID
            where year(e.HireDate)=2009
           select * from Person.Person;
           select * from HumanResources.Employee;

create function dbo.info_empleado(@ano int)
   returns table
      as 
      return (
           select p.BusinessEntityID ,p.FirstName , p.LastName,e.HireDate
           from Person.Person p inner join HumanResources.Employee e
            on p.BusinessEntityID =e.BusinessEntityID
            where year(e.HireDate)=@ano
      );

  select * from dbo.info_empleado(2009)


-- Crear una función que reciba un parámetro correspondiente a un precio y que devuelva una
-- tabla con código, nombre, color y precio de todos los productos cuyo precio sea inferior al parámetro
-- ingresado
--Tablas: Production.Product
--Campos: ProductID, Name, Color, ListPrice


   drop function dbo.precio_inferior;
   create function dbo.precio_inferior(@precio money)
   returns table 
      as 
        return(
            select ProductID as [codigo producto],
            Name [Nombre de Producto],
            Color,
            ListPrice [precio] from Production.Product
            where ListPrice <@precio
        
           );
       select * from dbo.precio_inferior(10)


--                       Funciones multisentencia

-- Realizar el mismo pedido que en el punto anterior pero utilizando este tipo de función.
--Tablas: Production.Product
--Campos: ProductID, Name, Color, ListPrice
 sp_help

 -- consulta de los tipos de funciones en el sistema. 
  select name,xtype as tipo,crdate as fecha
  from sysobjects
  where xtype in ('FN','TF','IF');

   create function dbo.precio_inferior_multisentecia(@precio money)
   returns  @producto table (
        codigoProducto int, 
        nombre varchar(30),
        color varchar(20),
        ListPrice money
       )
         as  
           begin 
                insert into @producto
                select ProductID,Name,Color,ListPrice from Production.Product
                where ListPrice <@precio
              return
           end

           
select codigoProducto,nombre from dbo.precio_inferior_multisentecia(10)
order by codigoProducto desc;






