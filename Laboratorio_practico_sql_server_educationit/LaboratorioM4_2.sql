-- Clonar estructura y datos de los campos nombre, color y precio de lista de la tabla 
-- Production.Product en una tabla llamada Productos.

--Tablas: Production.Product
--Campos: ProductID, Name, Color, ListPrice
 
select ProductID,Name,Color, ListPrice
into producto1  
from Production.Product

select * from producto1 where ListPrice >0;
select  ProductID,Name,Color, ListPrice from Production.Product where ListPrice >0;

-- Aumentar un 20% el precio de lista de todos los productos.
--Tablas: Productos
--Campos: ListPrice
 update producto1 
 set ListPrice += ListPrice *0.20;  

 --Aumentar un 20% el precio de lista de los productos del proveedor 1540. 

--Tablas: Productos, Purchasing.ProductVendor
--Campos: ProductID, ListPrice,
--BusinessEntityID

select * from Purchasing.ProductVendor
where BusinessEntityID=1540;

update producto1 
set ListPrice += ListPrice *0.20
where ProductID in (
     select ProductID from Purchasing.ProductVendor
     where BusinessEntityID=1540)

     select * from Producto1
            where ProductID in (
                 select ProductID from Purchasing.ProductVendor
                    where BusinessEntityID=1540)

                    /*
                    insert into producto 
                         select ProductID,Name,Color, ListPrice from Production.Product
                              where ProductID in (
                              select ProductID from Purchasing.ProductVendor
                              where BusinessEntityID=1540)*/

--4. Eliminar los productos cuyo precio sea igual a cero.
--Tablas: Productos
--Campos: precio
delete from producto1
where ListPrice=0; 


--Insertar un producto dentro de la tabla Productos. Tener en cuenta los siguientes datos.
--El color de producto debe ser rojo, el nombre debe ser "bicicleta mountain bike" y el
--precio de lista debe ser $4000.

--Tablas: Productos
--Campos: Color, Nombre, Precio

insert into producto1 
(color,Name, ListPrice)
values ('rojo','bicicleta mountain bike',4000)

--Aumentar en un 15% el precio de los pedales de bicicleta.
--Tablas: Productos
--Campos: Nombre, Precio
 update producto1
 set ListPrice +=ListPrice +0.15
 where Name like '%pedal'

 select * from producto1
 where Name like '%pedal'

-- Eliminar los productos cuyo nombre comience con la letra m
--Tablas: Productos
--Campos: Nombre
delete from producto1 where Name like 'm%';

--Borrar todo el contenido de la tabla producto sin utilizar la instrucción DELETE.
truncate table producto1;


-- Eliminar tabla Productos.
drop table producto1;



















