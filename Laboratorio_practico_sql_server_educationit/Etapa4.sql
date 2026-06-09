-- Consignas
--1. Actualizar el stock de los productos vendidos en la tabla Productos.
     update producto
      set Stock = p.Stock - v.cantidad 
     from producto p inner join ventas v
     on (p.ID_Producto = v.id_producto)
     where p.Stock >v.cantidad
--2. Crear una subconsulta que identifique clientes con más de 3 compras.
   select cliente, total from (
    select id_cliente as cliente, count(*) as total from ventas
    group by id_cliente
   ) t
   where total >3;
 
--3. Eliminar de la tabla ventas los registros de productos con stock insuficiente.

 select * from ventas;
 select * from producto;
 select * from cliente; 

 delete v 
   from ventas v
   inner join 
      (select ID_Producto, Stock from producto) p
      on v.id_producto= p.ID_Producto
      where v.cantidad > p.Stock


      update ventas
      set cantidad =100 
      where id_producto in (1,2,3)

     select * from ventas v
   inner join 
      (select ID_Producto, Stock from producto) p
      on v.id_producto= p.ID_Producto
      where  p.Stock > v.cantidad


 INSERT INTO ventas
VALUES 
('2024-01-14', 1, 5, 4, 2),
('2024-01-15', 2, 6, 5, 3),
('2024-01-16', 1, 7, 6, 1),
('2024-01-17', 4, 8, 7, 4);