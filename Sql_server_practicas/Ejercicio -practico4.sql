/*
Repaso Practico
*/

use Facturas
go 
select * from Cliente;

declare @edad int
set @edad=40

select * 
 into cliente2
 from Cliente
 where Edad>=@edad

 select * from cliente2;
 drop table cliente2;


 insert into cliente2 select * from Cliente where DNI ='555556666I';
 select distinct(DNI) from cliente2;

 with CTE_consulta as(

					 select *,case
					 when Edad between 20 and 39 then 'Joven'
					 When Edad between 10 and 20 then 'Adolecente'
					 when( Edad >40 and Edad <45) then 'Adulto Mayor'
					 end as 'Categoria'
					 from Cliente)
					 
					 select DNI, Nombre,Email,Edad, Direccion, case
					 when Categoria is null then 'N/A'
					 when Categoria is not null then Categoria 
					 end as [Categoria2]
					 from CTE_consulta



					 select e.*, case 
					 when e.Categoria is null then 'N/A'
					 when e.Categoria is not null then e.Categoria
					 end as 'Clasificacion'
								 from ( select *,case
								 when Edad between 20 and 39 then 'Joven'
								 When Edad between 10 and 20 then 'Adolecente'
								 when( Edad >40 and Edad <45) then 'Adulto Mayor'
								 end as 'Categoria'
								 from Cliente) as e
					 where e.Categoria is null
					 order by DNI
					 offset 1 rows fetch next 5 rows only


					 use Facturas
					 go
					 select * from encargo

					 insert into Encargo
					 select(
					 select max(pedID) from Pedido) as pedID,
					 12 as prodID,
					 2 as cantidad,
					 0 as descuento
					 union
					  select(
					 select max(pedID) from Pedido) as pedID,
					 2 as prodID,
					 1 as cantidad,
					 0 as descuento
					 union
					   select(
					 select max(pedID) from Pedido) as pedID,
					 5 as prodID,
					 3 as cantidad,
					 0 as descuento
					 union
					 select(
					 select min(pedID) from Pedido) as pedID,
					 17 as prodID,
					 1 as cantidad,
					 5 as descuento


					 select min(pedID) from Pedido

					 update producto 
					 set prodID =17
					 where prodID =138

					 insert into encargo
					 values((select min(pedID) from Pedido),
					 (select prodID from producto 
					     where prodID=138),1,0.0)

					 select * from Encargo;
					 select * from Pedido;
					 select * from producto

					 delete from Encargo
					 where proID in (select producto.prodID
					 from producto, encargo
					 where producto.prodID =encargo.proID)



					 select producto.*, encargo.* 
					 from producto, encargo
					 where producto.prodID =encargo.proID


					 /*
					 operador in, busca todas las condicidencias del filtro especificado en una subconsulta.
					 operador any, comparar algunos registros de la seleccion de la subconsulta	 
					 */
					 select * from Cliente

					 declare @edad1 int
					 set @edad1=1

					 update Cliente
					 set Edad =Edad +@edad1

					 select @@ROWCOUNT 'Total Actualizados'

					 select * from producto


					 insert into producto
					 values('monitor',150.50,'EGP 100',1,'LG',CURRENT_TIMESTAMP,6.5),
					 ('monitor',170.50,'ADD 400',1,'DELL',CURRENT_TIMESTAMP,6.9),
					 ('monitor',270.50,'ULTRA WIDE 2',1,'DELL',CURRENT_TIMESTAMP,8.9),
					 ('monitor',420.65,'ULTRA WIDE 3',1,'DELL',CURRENT_TIMESTAMP,9.7)

					 select * from producto 
					 where Nombre like 'Monitor%'
					 and (Fabricacion <'2025-01-01' or Fabricacion is null)


					 update Encargo
					 set proID =51
					 where proID in (12,2,5,17)

		 select @@ROWCOUNT 'Total Actualizados'





