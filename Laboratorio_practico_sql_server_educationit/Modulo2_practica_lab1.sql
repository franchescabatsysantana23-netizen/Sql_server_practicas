select * from HumanResources.Department; 
select * from Sales.SalesOrderDetail;

/*Mostrar los diferentes productos vendidos. usando distinct*/
select distinct(ProductID), SpecialOfferID,UnitPrice
from Sales.SalesOrderDetail;

select 
 *
from Sales.SalesOrderDetail
order by ProductID asc

select * from production.WorkOrder;
select * from HumanResources.Employee;
select BusinessEntityID, Gender from HumanResources.Employee;

/*Mostar todos los producto vendidos y ordenados.. usando union*/
select ProductID from Sales.SalesOrderDetail 
 union all
select ProductID from production.WorkOrder 

/*
Obtener el ID y una columna denominada
sexo cuyo valores disponibles sean
“Masculino” y ”Femenino”.
*/

select BusinessEntityID,JobTitle, Gender , Gender = case Gender
  when 'M' then 'Masculino'
  when 'F' then 'Femenino'
  else 'no definido'
  end
from HumanResources.Employee;

/*
Mostrar el ID de los empleados, si tiene salario
deberá mostrarse descendente, de lo
contrario ascendente.
*/

select  BusinessEntityID, SalariedFlag
from HumanResources.Employee
order by case SalariedFlag 
when 1 then BusinessEntityID end desc, 
case when SalariedFlag=0 then BusinessEntityID
end; 



/*

select BusinessEntityID, SalariedFlag,
SalariedFlag= case SalariedFlag
when 1 then 'descendente'
else 'ascendente'
end
from HumanResources.Employee;
*/




