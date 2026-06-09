use TechSalesDB; 

go

create table ventas(
id_venta int identity primary key,
fecha date,  
cantidad int, 
id_cliente int, 
id_producto int,
id_empleado int,
foreign key(id_empleado) references empleados(ID_Empleado),
foreign key(id_producto) references producto(ID_producto),
foreign key(id_cliente) references cliente(ID_Cliente));


select * from empleados;

 exec sp_helpconstraint cliente;
 exec sp_helpconstraint empleados;
 exec sp_helpconstraint ventas;

 exec sp_help cliente;
  exec sp_help empleados;
    exec sp_help producto;
   

   select * from cliente;
INSERT INTO cliente (ID_Cliente, Nombre, Email, Ciudad) VALUES
(1,'Juan Perez','juan@gmail.com','Santiago'),
(2,'Maria Lopez','maria@gmail.com','Santo Domingo'),
(3,'Carlos Diaz','carlos@gmail.com','La Vega'),
(4,'Ana Rodriguez','ana@gmail.com','Puerto Plata'),
(5,'Luis Martinez','luis@gmail.com','Moca'),
(6,'Pedro Gomez','pedro@gmail.com','Santiago'),
(7,'Laura Sanchez','laura@gmail.com','San Francisco'),
(8,'Miguel Torres','miguel@gmail.com','Bonao'),
(9,'Sofia Ramirez','sofia@gmail.com','La Romana'),
(10,'Daniel Cruz','daniel@gmail.com','Santo Domingo');


   select * from empleados; 

INSERT INTO empleados (ID_Empleado, Nombre, Cargo, Fecha_Contratacion) VALUES
(1,'Jose Ramirez','Vendedor','2020-01-10'),
(2,'Luis Torres','Vendedor','2019-03-15'),
(3,'Ana Lopez','Supervisor','2018-07-20'),
(4,'Carlos Gomez','Cajero','2021-02-11'),
(5,'Maria Perez','Gerente','2017-11-05');



INSERT INTO producto (ID_Producto, Nombre, Precio, Stock, Categoria) VALUES
(1,'Laptop HP',45000,10,'Tecnologia'),
(2,'Mouse Logitech',800,50,'Accesorios'),
(3,'Teclado Redragon',2500,30,'Accesorios'),
(4,'Monitor Samsung',12000,15,'Tecnologia'),
(5,'Impresora Epson',9500,8,'Oficina'),
(6,'Disco SSD 1TB',7000,20,'Tecnologia'),
(7,'Memoria USB 64GB',600,60,'Accesorios'),
(8,'Router TP-Link',3000,18,'Redes');

INSERT INTO ventas (fecha, cantidad, id_cliente, id_producto, id_empleado) VALUES
('2024-01-10',1,1,1,1),
('2024-01-11',2,2,2,2),
('2024-01-12',1,3,3,1),
('2024-01-13',3,4,7,4),
('2024-01-14',1,5,4,2),
('2024-01-15',2,6,5,3),
('2024-01-16',1,7,6,1),
('2024-01-17',4,8,7,4),
('2024-01-18',1,9,8,2),
('2024-01-19',2,10,2,1);


select * from ventas; 
select * from dbo.cliente; 

select * from producto;
select * from empleados; 

--Relacionen las tablas Ventas y Clientes
--para obtener el historial de compras de un
-- cliente.

with historial_compras as (
      select v.id_venta,v.fecha,v.cantidad,
      v.id_cliente, v.id_producto,v.id_empleado,empleados.Nombre,
       c.Email,c.Ciudad
      from dbo.cliente c
           inner join dbo.ventas v
        on (v.id_cliente = c.ID_Cliente) inner join producto p
        on p.ID_Producto =v.id_producto inner join empleados 
        on empleados.ID_Empleado =v.id_empleado

) select * from historial_compras


 -- Relacionen las tablas Ventas y Productos para obtener el total vendido de cada producto.
 select * from dbo.producto;
 select * from dbo.ventas; 

 select v.id_producto, sum(Precio*v.cantidad) as total_vendido
  from dbo.producto p inner join ventas v
  on v.id_producto=p.ID_Producto
  group by v.id_producto;

--Utilicen un OUTER JOIN para listar todos los productos, incluyendo los que no han sido vendidos.
with listar_productos AS(
        select id_producto_venta, id_producto, 
               Nombre_producto,precio_producto,
               stock_producto,categoria_producto,
               id_venta,fecha_venta,cantidad_venta
        from (
             select v.id_producto as id_producto_venta,
             p.ID_Producto as id_producto,
             p.Nombre as Nombre_producto,
             p.Precio as precio_producto,
             p.Stock as stock_producto,
             p.Categoria as categoria_producto,
             v.id_venta as id_venta,
             v.fecha as fecha_venta,
             v.cantidad as cantidad_venta
              from dbo.producto p left outer join dbo.ventas v
              on v.id_producto=p.ID_Producto) t
  )
  select * from listar_productos;


  -- Tabla: Errores (para manejo de errores en transacciones)

  CREATE TABLE Errores (
     ID_Error INT IDENTITY PRIMARY KEY,
     Tipo NVARCHAR(100),
     Mensaje NVARCHAR(255),
     Fecha DATE);


