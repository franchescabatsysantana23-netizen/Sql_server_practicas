/*
Exponer un listado de las marcas, las fechas de fabricacion agrupadas por anos y el total de ventas anual de los productos.
*/
use Facturas
go
select * from producto;

select 
    Marca,
	 year(Fabricacion) [Anio],
	 sum (precio *cantidad) [ventas]
	from producto
	where 
	group by Marca, year(Fabricacion)

	exec sp_help producto

select Marca,Anio,sum(precio*cantidad)[ventas] from (
									select 
											Marca,
											precio,
											cantidad,
											year(Fabricacion) [Anio]
									from producto) [producto2]
									where not anio is null
									group by Anio,Marca
									order by anio 


	select Marca,Anio,sum(precio*cantidad)[ventas] from (
									select 
											Marca,
											precio,
											cantidad,
											year(Fabricacion) [Anio]
									from producto) [producto2]
									where not anio is null
									group by Anio,Marca
									order by anio 
									offset 1 rows fetch next 5 rows only

/*
Evitar los datos de televisores,y los productos que han suspendido en valoracion
*/


select * from producto
where (not Nombre like '%Televisi_n%') and (Valoracion is not null);

/*
Filtrar las mas exitosas segun hayan tenido mas de 7000 euros en ventas en productos de cada ano.
Es un filtro de agrupacion previa. 
info 1: se realiza suposicion de que se han vendido 10 cajas de cada producto.
info 2: el modificador que nos indica el ano de un smalldatetime es year()
*/


/*
A continuacion, en otro listado,ordenar las marcas de mayor a menor numero de anos con esas ventas.
info 3: la clasula order by  no es valida en subconsultas.
*/












	       