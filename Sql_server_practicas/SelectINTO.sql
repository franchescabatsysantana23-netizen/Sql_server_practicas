---select into (nos permite copiar la estructura de una tabla unicamente y sus datos)
--la misma no permite copia de pk ni indices.

exec sp_columns Customer
select * from SalesLT.Customer

--- crear una tabla con la copia de los registros anteriores
select * into SalesLT.Customer2
from salesLT.Customer
where CustomerID <200

select * into SalesLT.Customer3
from salesLT.Customer

select * from salesLT.Customer

--- crea una tabla customer4 con los nombres y apellido.

Create table salesLT.Customer4(
nombre varchar(50), 
apellido varchar(50))

--- copia unicamente los nombres, apellidos de la tabla customer a la tabla customer5
select FirstName,LastName into SalesLT.Customer5
from SalesLT.Customer where CustomerID <200

---unicamente inserta los nombre y apellido a la tabla customer4, extraido de
---la tabla customer.
insert into SalesLT.Customer4
select FirstName,LastName from SalesLT.Customer


exec sp_columns Customer

select * from SalesLT.Customer5

--crea la tabla customer8 sin registros
select * into SalesLT.Customer8
from SalesLT.Customer
where 1 =0
select * from SalesLT.Customer8

select * from SalesLT.Customer
--- al indicar dos puntos nos permite , hacer operaciones en una bases de datos distinta
--- a la utilizada.
/*
Copia los registros de una bases de datos a otra. 
*/
select * into bd1..customer
from salesLT.Customer

select * from SalesLT.Product

select identity(int,1,1) as id, * into bd1.dbo.ProductCategory
from AdventureWorksLT2016.SalesLT.ProductCategory

select identity(int,1,1) as ProductCategory, * into bd1.dbo.ProductCategory1
from AdventureWorksLT2016.SalesLT.ProductCategory

---realiza un insert into a la product category haciendo referencia a la otra bases de datos.
select  * into bd1.dbo.ProductCategory2
from AdventureWorksLT2016.SalesLT.ProductCategory