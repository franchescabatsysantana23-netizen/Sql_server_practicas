-- Crear una función que calcule el descuento en
-- una venta basado en la cantidad (por ejemplo,
-- 10% para compras mayores a 10 unidades).


 create function dbo.calcular_descuento()
   returns table
   as 
      return(
  with informacion as (
  select codigo_venta,codigo_producto,
       nombre, precio, cantidad,total_parcial,Stock, 
       case
       when cantidad between 1 and 9 then total_parcial
       when cantidad between 10 and 19 then total_parcial*0.10
       when cantidad>=20 then total_parcial*0.30
       else 'fuera del rango'
       end as descuento
 from (
 select v.id_venta [codigo_venta],v.id_producto [codigo_producto], 
 p.Nombre [nombre],p.Precio [precio],v.cantidad [cantidad], precio*cantidad [total_parcial],
 p.Stock [Stock]
 from ventas v inner join producto p
 on v.id_producto=p.ID_Producto) t
 )
 select codigo_venta,codigo_producto,nombre,
   precio, cantidad, total_parcial, Stock,descuento
   , case when total_parcial = descuento then total_parcial
          when total_parcial != descuento then total_parcial-descuento
          end as total
 from informacion
);

select * from dbo.calcular_descuento()
    


-- 2. Implementar un trigger que valide que el stock
-- de un producto no sea negativo después de
-- una venta.

drop trigger dbo.TR_validar_Stock
create trigger dbo.TR_validar_Stock on dbo.ventas 
   after insert
      as 
       begin
         update producto
          set Stock =Stock -inserted.cantidad
           from producto p inner join inserted 
           on p.ID_Producto=inserted.id_producto
      

       if(select producto.Stock from dbo.producto inner join inserted 
           on producto.ID_Producto=inserted.id_producto
           where producto.ID_Producto =inserted.id_producto)<0
            rollback transaction;
            print 'El stock del producto seleccionado es insuficiente'
      end;


      select * from ventas;
      select * from producto;

      insert into ventas
      values('2026-04-06',27,1,1,4)





-- 3. Crear una función para convertir los precios de
-- los productos a otra moneda (por ejemplo, de USD a EUR).

create function dbo.convertir_moneda(@moneda char, @tasa_cambio money)
    returns table 
    as 
       return 
             ( select codigo_producto,@moneda+' '+cast(Total_precio as varchar) 
               [Total]
             from (  
             select ID_Producto 'codigo_producto', precio *@tasa_cambio 
              [Total_precio] from dbo.producto)t
             );

             select * from dbo.convertir_moneda('$',61)

 create function dbo.convertir_formato_precio (@moneda char)
     returns table 
     as 
       return(
            select ID_Producto, @moneda+' '+ cast(Precio as varchar) [precio] 
            from dbo.producto);


            select * from dbo.convertir_formato_precio('€');