-- Descarga de Cursores ---

/*
Incrementar las comisiones un 10% de aquellos
vendedores que superaron el promedio de venta
y que pertenezcan a un territorio.
*/

use AdventureWorks2022;
go

--------------------------------------------------------------------------

create table #tempSales(
    promedio money, 
    TerritoryID int)
go 
insert into #tempSales (promedio,TerritoryID)
select AVG(SOH.TotalDue), ST.TerritoryID from  Sales.SalesOrderHeader SOH
inner join Sales.SalesPerson sp 
on SOH.SalesPersonID=sp.BusinessEntityID 
inner join Sales.SalesTerritory ST
on sp.TerritoryID=ST.TerritoryID
group by ST.TerritoryID

declare @promedio money 
declare @TerritoryID int 

--declararar el cursor
declare salesPerson_cursor cursor fast_forward for 
 select promedio, TerritoryID from #tempSales

 -- open el cursor 
  open salesPerson_cursor 
 -- Lectura del primer registro
 Fetch next from salesPerson_cursor into @promedio, @TerritoryID

 while @@FETCH_STATUS=0
   begin 
      --Actualizar el registro
      update sp
      set sp.CommissionPct +=sp.CommissionPct*0.10
      from Sales.SalesPerson sp 
      inner join Sales.SalesOrderHeader soh
      on sp.BusinessEntityID=soh.SalesPersonID
      where soh.TotalDue>@promedio and soh.TerritoryID=@TerritoryID

      FETCH NEXT FROM salesPerson_cursor into @promedio,@TerritoryID
   end; 
   -- cerrar el cursor
   close salesPerson_cursor;
   deallocate salesPerson_cursor;
