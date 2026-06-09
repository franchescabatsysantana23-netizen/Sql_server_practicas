-- Crear un procedimiento almacenado que registre una nueva venta en la tabla Ventas,
-- actualizando automáticamente el stock del producto.
select * from ventas;
select * from producto;

if OBJECT_ID ('dbo.PA_registrar_ventas') is not null
drop procedure dbo.PA_registrar_ventas;

alter procedure dbo.PA_registrar_ventas 
    @fecha date,
    @cantidad int, 
    @id_cliente int,
    @id_producto int,
    @id_empleado int
  as  
  begin 
     begin transaction;
    if (@cantidad<(select Stock from producto where ID_Producto=@id_producto))
     begin
        -- insercion de venta
           insert into ventas values(@fecha,@cantidad,@id_cliente,@id_producto,@id_empleado)

        -- actualizacion de la tabla venta
         update producto 
         set Stock =Stock -@cantidad
         where ID_Producto=@id_producto
     end
    else if (@cantidad >(select Stock from producto where ID_Producto=@id_producto))
          or ((select Stock from producto where ID_Producto=@id_producto)<0)
       begin 
           rollback transaction;
           throw 50000,  'Stock insuficiente para completar la venta',1;
        end;
    commit transaction;
  end;    

    
select * from producto;
select * from ventas;

Exec dbo.PA_registrar_ventas '2026-04-04',5,4,1,4;


-- Crear un procedimiento almacenado que calcule el total de ventas de un cliente específico.

if object_id('dbo.PA_cantidad_total_vendida') is not null 
drop procedure dbo.PA_cantidad_total_vendida
     
     create procedure dbo.PA_cantidad_total_vendida 
     @cliente int 
     as 
      begin
        select v.id_cliente, sum(v.cantidad*p.Precio) [cantidad total]
         from ventas v inner join producto p
         on v.id_producto=p.ID_Producto
         where id_cliente=@cliente
          group by id_cliente
      end;

   EXEC dbo.PA_cantidad_total_vendida 5;

-- Usar variables para almacenar valores intermedios como el total de ventas y el stock disponible.
   -- valores intermedios 
       declare @cliente_nombre varchar(30)

    select @cliente_nombre=Nombre from cliente
    where ID_Cliente=5;

    -- total de ventas
     declare @total_ventas money;

     select @total_ventas= sum(v.cantidad*p.Precio)
         from ventas v inner join producto p
         on v.id_producto=p.ID_Producto
         where id_cliente=5
        

 -- Mostrar los resultados.

    print ('El cliente '+@cliente_nombre +' ha tenido un total de ventas de '+ cast(@total_ventas as varchar))

   


