-- Descarga de captura de errores 
/*
Puedes guardar en variables:
ERROR_MESSAGE() → mensaje del error
ERROR_NUMBER() → número del error
ERROR_SEVERITY() → severidad
ERROR_STATE() → estado
ERROR_LINE() → línea donde ocurrió
ERROR_PROCEDURE() → procedimiento
*/
-- 1.Realizar una división por cero y atrapar el error utilizando variables de sistema (revertir
-- la transacción)
begin transaction 
    begin try
         declare @valor1 int
         declare @valor2 int
         declare @resultado int
         declare @errorNumber int
         declare @errorMensaje varchar(4000);
         set @valor1 =10
         set @valor2=0
         select  @resultado=@valor1/@valor2
         if @resultado <>0
           begin 
             rollback transaction
           end
         else
           commit transaction
    end try 
    begin catch
        set @errorMensaje=ERROR_MESSAGE() 
        set @errorNumber =ERROR_NUMBER()
        print cast(@errorNumber as varchar) +' : '+ @errorMensaje
    end catch

    
-- 2. Realizar una división por cero y atrapar el error sin utilizar variables de sistema (revertir
-- la transacción).

    begin try
        begin transaction
         select 10/0
         commit transaction 
    end try 
    begin catch
          rollback transaction 
          throw
    end catch



-- 3. Agregar al ejercicio anterior el envío de un mensaje de error utilizando RAISERROR.
   begin transaction 
   begin try
         select 10/0
         commit transaction 
    end try 
    begin catch
         print('Error: '+cast(ERROR_NUMBER() as varchar(10)))
         raiserror('No es posible dividir por cero',16,1)
         if @@TRANCOUNT > 0
            rollback transaction 
    end catch


-- 4. Realizar una copia del punto 3 y enviar un mensaje de error utilizando THROW.
begin transaction
   begin try
         select 10/0
         commit transaction 
    end try 
    begin catch
        print('Error: '+cast(ERROR_NUMBER() as varchar(10)))
        raiserror('No es posible dividir por cero',10,1)
        if @@TRANCOUNT > 0
           rollback transaction 
        throw;
    end catch