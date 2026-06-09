/*
La clasula over convierte una funcion normal en una funcion de ventana. 
Ejemplo: 
  SELECT nombre, salario,
       SUM(salario) OVER() AS total_salarios
FROM empleados;

| nombre | salario | total_salarios |
| ------ | ------- | -------------- |
| Ana    | 1000    | 5000           |
| Luis   | 2000    | 5000           |
| Carlos | 2000    | 5000           |

PARTITION BY (como un GROUP BY sin agrupar)

SELECT nombre, departamento, salario,
       SUM(salario) OVER(PARTITION BY departamento) AS total_depto
FROM empleados;

| nombre | depto | salario | total_depto |
| ------ | ----- | ------- | ----------- |
| Ana    | IT    | 1000    | 3000        |
| Luis   | IT    | 2000    | 3000        |
| Pedro  | HR    | 1500    | 1500        |

ORDER BY dentro de OVER

SELECT nombre, salario,
       SUM(salario) OVER(ORDER BY salario) AS acumulado
FROM empleados;

| nombre | salario | acumulado |
| ------ | ------- | --------- |
| Ana    | 1000    | 1000      |
| Luis   | 2000    | 3000      |
| Carlos | 2000    | 5000      |

Funciones Comunes con OVER

SUM() -> totales
AVG()--> promedios
ROW_NUMBER() -> numerar filas
RANK() -> ranking
LAG()/LEAD()-> ver filas anteriores /siguientes. 

SELECT nombre, salario,
       RANK() OVER(ORDER BY salario DESC) AS ranking
FROM empleados;

SELECT nombre, depto, salario,
       ROW_NUMBER() OVER(PARTITION BY depto ORDER BY salario DESC) AS fila
FROM empleados;

| nombre | depto | salario | fila |
| ------ | ----- | ------- | ---- |
| Luis   | IT    | 2000    | 1    |
| Pedro  | IT    | 2000    | 2    |
| Ana    | IT    | 1000    | 3    |
| Marta  | HR    | 1500    | 1    |
| Juan   | HR    | 1200    | 2    |

SELECT nombre, depto, salario,
       RANK() OVER(PARTITION BY depto ORDER BY salario DESC) AS ranking
FROM empleados;

| nombre | depto | salario | ranking |
| ------ | ----- | ------- | ------- |
| Luis   | IT    | 2000    | 1       |
| Pedro  | IT    | 2000    | 1       |
| Ana    | IT    | 1000    | 3       |

SELECT nombre, salario,
       LAG(salario) OVER(ORDER BY salario) AS salario_anterior
FROM empleados;

| nombre | salario | anterior |
| ------ | ------- | -------- |
| Ana    | 1000    | NULL     |
| Juan   | 1200    | 1000     |
| Marta  | 1500    | 1200     |
| Luis   | 2000    | 1500     |

SELECT nombre, salario,
       LEAD(salario) OVER(ORDER BY salario) AS siguiente
FROM empleados;

| nombre | salario | siguiente |
| ------ | ------- | --------- |
| Ana    | 1000    | 1200      |
| Juan   | 1200    | 1500      |
| Marta  | 1500    | 2000      |
| Luis   | 2000    | NULL      |

SELECT nombre, salario,
       salario - LAG(salario) OVER(ORDER BY salario) AS diferencia
FROM empleados; --> Calcula cuanto sube el salario respecto al anterior. 

SELECT nombre, depto, salario,
       ROW_NUMBER() OVER(PARTITION BY depto ORDER BY salario DESC) AS top_depto,
       LAG(salario) OVER(PARTITION BY depto ORDER BY salario) AS anterior
FROM empleados;

*/

select * from Sales.SalesOrderDetail;      --ProductID 
select * from Production.ProductCategory   -- ProductCategoryID
select * from Production.ProductSubcategory  -- productSubcategoryID, ProductCategoryID
select * from Production.Product;    --ProductID, productSubcategoryID

select ProductID,
  sum(LineTotal) over(order by LineTotal desc) as total
      from Sales.SalesOrderDetail

select codigo_producto,categoria,
        sum(Total_Linea) over (partition by categoria) as Total_categorias
   from (
    select p.ProductID [codigo_producto],
           pc.Name [categoria],SOD.LineTotal as [Total_Linea]
         from  Production.Product p 
           inner join Sales.SalesOrderDetail SOD 
           on p.ProductID=SOD.ProductID   inner join Production.ProductSubcategory ps
           on p.ProductSubcategoryID =ps.ProductSubcategoryID inner join Production.ProductCategory pc
           on ps.ProductCategoryID=pc.ProductCategoryID
          ) as t



with consultas as (
          select p.ProductID [codigo_producto],
           pc.Name [categoria],SOD.LineTotal as [Total_Linea]
         from  Production.Product p 
           inner join Sales.SalesOrderDetail SOD 
           on p.ProductID=SOD.ProductID   inner join Production.ProductSubcategory ps
           on p.ProductSubcategoryID =ps.ProductSubcategoryID inner join Production.ProductCategory pc
           on ps.ProductCategoryID=pc.ProductCategoryID

)
select 
     categoria,
        sum(Total_Linea) as total,
        avg(Total_Linea) as promedio
 from consultas
 group by categoria;


 select codigo_producto,categoria,Total_Linea,
        row_number() over (partition by categoria order by Total_Linea desc) as Total_categorias
   from (
    select p.ProductID [codigo_producto],
           pc.Name [categoria],SOD.LineTotal as [Total_Linea]
         from  Production.Product p 
           inner join Sales.SalesOrderDetail SOD 
           on p.ProductID=SOD.ProductID   inner join Production.ProductSubcategory ps
           on p.ProductSubcategoryID =ps.ProductSubcategoryID inner join Production.ProductCategory pc
           on ps.ProductCategoryID=pc.ProductCategoryID
          ) as t

