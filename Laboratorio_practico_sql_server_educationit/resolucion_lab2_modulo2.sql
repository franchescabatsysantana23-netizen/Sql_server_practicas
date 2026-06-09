-- mostrar el codigo de subcategoria y el precio del producto mas barato de cada una de ellas. 
select ProductSubcategoryID,ListPrice from Production.Product p
where ListPrice =(select min(ListPrice) from Production.Product pp
                  where  p.ProductSubcategoryID=pp.ProductSubcategoryID)
  order by ListPrice asc -- el subproducto de la categoria 37 tiene el precio mas barato de cada una de ellas. 


-- mostrar los productos y la cantidad total vendida de cada una ellos. 

  select ProductID, sum(OrderQty) total from Sales.SalesOrderDetail
  group by ProductID

-- mostrar los productos y el total vendido de cada uno de ellos, ordenados por el total vendido.
 select ProductID,total_vendido from (
 select ProductID, ceiling(sum(LineTotal)) total_vendido
 from Sales.SalesOrderDetail
 group by ProductID ) t
 order by total_vendido 



-- mostrar el total vendido por factura 
select SalesOrderID, ceiling(sum(LineTotal)) 'Total factura' 
from Sales.SalesOrderDetail
group by SalesOrderID


-- mostrar el promedio vendido por factura 
select SalesOrderID, ceiling(avg(LineTotal)) 'Promedio factura' 
from Sales.SalesOrderDetail
group by SalesOrderID


/*
mostrar todas las facturas realizadas y el total facturado de cada una de ellas, 
ordenado por el numero de factura pero solo de aquellas ordenes que superen un 
total de 10.000.
*/

select SalesOrderID, round(sum(LineTotal),2,1) 'Total'
from  Sales.SalesOrderDetail
group by SalesOrderID
having(sum(LineTotal))>10000
order by SalesOrderID;




-- mostrar la cantidad de facturas que vendieron mas de 20 cantidad de ordenes.

select * from Sales.SalesOrderDetail;

select SalesOrderID , sum(OrderQty) cantidad
from Sales.SalesOrderDetail
group by SalesOrderID
having(count(SalesOrderID)) >20



-- mostrar la subcategoria de los productos que tienen dos o mas productos que cuestan menos de 150.

 select ProductSubcategoryID,cantidad_categoria
 from (
    select ProductSubcategoryID , count(ProductSubcategoryID) as cantidad_categoria
    from Production.Product
    where ListPrice<150 
    group by ProductSubcategoryID
 
 ) p
 where cantidad_categoria >=2; 



/*
mostrar todos los codigos de subcategoria existente junto con la cantidad para 
los productos cuyo precio de lista sea mayor a 70 y el precio promedio sea mayor
a 300.
*/
-- solucion 1

 select ProductSubcategoryID , count(ProductSubcategoryID) as cantidad_categoria,
 avg(ListPrice) promedio
 from Production.Product
 where ListPrice>70 
 group by ProductSubcategoryID
 having avg(ListPrice)>300;

 -- solucion 2
 select ProductSubcategoryID,cantidad_categoria, promedio
 from (
    select ProductSubcategoryID , count(ProductSubcategoryID) as cantidad_categoria, avg(ListPrice) promedio
    from Production.Product
    where ListPrice>70 
    group by ProductSubcategoryID
 
 ) p
 where promedio >300; 


-- mostrar el numero de factura, el monto vendido,y al final, total de la facturacion.

--ceiling((OrderQty * UnitPrice)) 'Total1',

select * from Sales.SalesOrderDetail;

/*
"group by" con los operadores "rollup" y "cube" para generar valores de resumen a la salida.
el modificador "rollup", que agrega filas extras mostrando resultados de resumen por cada grupo y subgrupo.
"cube" genera filas de resumen de subgrupos para todas las combinaciones posibles de los valores de los campos por los que agrupamos.
*/
-- solucion 1
select SalesOrderID, ceiling(sum((OrderQty * UnitPrice))) 'Total1'
from Sales.SalesOrderDetail
group by  SalesOrderID with rollup;


-- solucion 2
 select SalesOrderID,CEILING(sum(LineTotal)) 'Total_X_Orden'
 from Sales.SalesOrderDetail
 group by SalesOrderID with rollup;

/*
 select SalesOrderID,CEILING(sum(LineTotal)) 'Total_X_Orden'
 from Sales.SalesOrderDetail
 group by SalesOrderID with cube;
 */
