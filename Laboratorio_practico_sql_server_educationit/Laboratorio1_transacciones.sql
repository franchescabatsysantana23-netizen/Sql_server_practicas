-- 1. Borrar todos los productos que no se hayan vendido y luego revertir la operación.
--Tablas: Production.Product, Sales.SalesOrderDetail
--Campos: ProductID

 begin transaction 
    delete p from Production.Product p 
    where not exists (select 1 from Sales.SalesOrderDetail so 
      where p.ProductID=so.ProductID)
    rollback transaction;


-- 2. Incrementar el precio a 200 para todos los productos cuyo precio sea igual a cero y confirmar
-- la transacción.
 --Tablas: Production.Product
--Campos: ListPrice

begin transaction actualizacion
   update Production.Product
   set ListPrice=200
   where ListPrice=0
commit TRANSACTION actualizacion;

   select * from Production.Product
   where ListPrice=200


--3. Obtener el promedio del listado de precios y guardarlo
--    en una variable llamada @Promedio. Incrementar todos
--    los productos un 15%, pero si el precio mínimo no
---    supera el promedio revertir toda la operación
--Tablas: Production.Product
--Campos: ListPrice
select min(ListPrice) from Production.Product;
select avg(ListPrice) from Production.Product;

select * from Production.Product
where ListPrice= (select min(ListPrice) from Production.Product); --873

select * from Production.Product
where ListPrice> (select avg(ListPrice) from Production.Product); --680 price: 1431.50,706 price: 1431.50


select * from Production.Product
where ProductID in ('680','706')

begin transaction 
   declare @promedio money 
   select @promedio =avg(ListPrice) from Production.Product
   update Production.Product
    set ListPrice = ListPrice+(ListPrice*0.15)
    if(select min(ListPrice) from Production.Product) <@promedio 
       rollback transaction;
    else
        commit transaction;
   



