use AdventureWorks2022;

/*
Listar todos los productos disponibles,
ordenados por categoria y precio. 
*/
select * from Production.Product
order by ProductSubcategoryID desc ,ListPrice desc

/*
Mostrar los clientes unicos por ciudad
utilizando distinct.
*/

select distinct(CustomerID), TerritoryID from Sales.Customer;

/*
Calcular el precio promedio de los productos 
por categoria. 
*/

select ProductSubcategoryID ,avg(ListPrice) 'promedio' from Production.Product
group by ProductSubcategoryID;

/*
Mostrar las categorias con un promedio de 
precio superior a 50 usando having. 
*/

select ProductSubcategoryID ,avg(ListPrice) 'promedio' from Production.Product
group by ProductSubcategoryID
having (avg(ListPrice))>50;
