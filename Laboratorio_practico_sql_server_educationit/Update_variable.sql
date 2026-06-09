 declare @promedio money
 declare @TerritoryID int
  
  set @promedio=14737.9949
  set @TerritoryID=9


    select soh.TotalDue,soh.TerritoryID,sp.CommissionPct
       from Sales.SalesPerson sp 
      inner join Sales.SalesOrderHeader soh
      on sp.BusinessEntityID=soh.SalesPersonID
      where soh.TotalDue>@promedio and soh.TerritoryID=@TerritoryID
      
      update sp
      set sp.CommissionPct +=sp.CommissionPct*0.50
      from Sales.SalesPerson sp 
      inner join Sales.SalesOrderHeader soh
      on sp.BusinessEntityID=soh.SalesPersonID
      where soh.TotalDue>@promedio and soh.TerritoryID=@TerritoryID


         select soh.TotalDue,soh.TerritoryID,sp.CommissionPct
       from Sales.SalesPerson sp 
      inner join Sales.SalesOrderHeader soh
      on sp.BusinessEntityID=soh.SalesPersonID
      where soh.TotalDue>@promedio and soh.TerritoryID=@TerritoryID