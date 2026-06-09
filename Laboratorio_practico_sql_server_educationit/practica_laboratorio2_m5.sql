-- Crear un procedimiento almacenado en el esquema
-- HumanResources que dada una determinada inicial
-- devuelva código, nombre, apellido y dirección de
-- correo de los empleados cuyo nombre coincida con la inicial ingresada.

--Vistas: HumanResources.vEmployee
--Campos: BusinessEntityID, FirstName, LastName, EmailAddress

drop procedure dbo.PA_consulta_empleado;

 CREATE PROCEDURE dbo.PA_consulta_empleado 
      @nombre char as
	  BEGIN
		select BusinessEntityID, FirstName, LastName, EmailAddress
		 from HumanResources.vEmployee
		 where FirstName like @nombre
		 END;
EXEC dbo.PA_consulta_empleado 'A%';




--Crear un procedimiento almacenado llamado ProductoVendido que permita ingresar un producto
-- como parámetro. Si el producto ha sido vendido, imprimir el mensaje “El PRODUCTO HA SIDO
-- VENDIDO” de lo contrario imprimir “El PRODUCTO NO HA SIDO VENDIDO”.

--Tablas: Sales.SalesOrderDetail
--Campos: ProductID

CREATE PROCEDURE dbo.PA_Producto_Vendido 
  @numero_producto int  as 
    begin 
    if exists (select ProductID from Sales.SalesOrderDetail where ProductID =@numero_producto)
	  begin
		print ('El producto ha sido vendido')
      end
      else
	      begin
	         print('El producto no ha sido vendido')
          end   
      end;
EXEC dbo.PA_Producto_Vendido 773

 

 /*
  declare @productID int; 
  set @productID =776; 
  if exists (select * from Sales.SalesOrderDetail where ProductID =@productID)
     print ('El producto ha sido vendido')
  else
      print ('El producto no ha sido vendido')
*/

-- Crear un procedimiento almacenado en el esquema
-- DBO llamado ActualizaPrecio recibiendo como
-- parámetros el producto y el precio.
--Tablas: Production.Product
--Campos: ProductID, Name, ListPrice

CREATE PROCEDURE dbo.PA_Actualizar_precio 
 @productoID int, @precio money
 as
   begin
       update Production.Product
       set ListPrice =@precio
       where ProductID=@productoID
   end;

   EXEC dbo.PA_Actualizar_precio 773,600;
    
    select ProductID, Name, ListPrice from Production.Product
    where  ProductID=773;

-- Crear un procedimiento almacenado llamado ProveedorProducto que devuelva los proveedores, el
-- nombre del producto, el número de cuenta y el código de unidad de medida que proporciona el producto
-- especificado por parámetro.
-- Tablas: Purchasing.Vendor, Purchasing.ProductVendor, Production.Product
-- Campos: Name, AccountNumber, UnitMeasureCode

CREATE PROCEDURE dbo.PA_proveedor_producto 
  @codigo_producto int
  as 
  begin 
      select p.Name [nombre producto],v.AccountNumber[Numero de cuenta],pv.UnitMeasureCode [unidad de medida]
      from Production.Product p inner join  Purchasing.ProductVendor pv
      on p.ProductID =pv.ProductID 
      inner join Purchasing.Vendor v
      on pv.BusinessEntityID =v.BusinessEntityID
      where p.ProductID=@codigo_producto
  end;

EXEC dbo.PA_proveedor_producto 1;


-- Crear un procedimiento almacenado llamado EmpleadoSector que retorne el nombre, apellido y
-- sector del empleado cuyo nombre se proporcione como argumento. No es necesario 
-- que el apellido coincida de manera exacta en la consulta del procedimiento.
-- Vistas: HumanResources.vEmployeeDepartmentHistory
-- Campos: FirstName, LastName, Department

create procedure dbo.PA_Empleado_sector 
@nombre varchar(30)
as 
  begin 
     select FirstName, LastName, Department 
         from HumanResources.vEmployeeDepartmentHistory
         where FirstName=@nombre
   end;
EXEC dbo.PA_Empleado_sector Sean;










