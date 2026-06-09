---- Transacciones y manejo de errores

/*
1. Crear una transacción que registre una venta
completa (insertar en Ventas, actualizar el
stock en Productos) y que deshaga la
operación si ocurre algún error.
*/

 select * from ventas;
 select * from producto;

begin transaction 
    begin try
     declare @idproducto int
     set @idproducto=2
     insert into ventas
     values('2024-01-13',28,5,@idproducto,2)

     update producto
     set Stock=Stock-cantidad
     from producto p
     inner join ventas v
     on p.ID_Producto=v.id_producto
     where p.ID_Producto=@idproducto  
    end try 
    begin catch
       Rollback transaction
    end catch

    alter table dbo.producto 
    add constraint CK_producto_stock_positivo
    check(Stock>=0)



/*
2. Manejar errores en la transacción para
capturar problemas como claves foráneas
inexistentes o stock insuficiente.
*/





/*
3. Reportar errores en una tabla Errores con
información sobre el tipo de error y la fecha.
*/






