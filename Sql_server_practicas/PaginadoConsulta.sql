declare @pageNumber as int,
        @pageSize as int,
		@totalPages as int
set @pageNumber =0
set @pageSize =10
set @totalPages = (select count(*) from SalesLT.Customer) /@pageSize

select * from 
(select *,
     ROW_NUMBER() over (order by CustomerID) as ROW_NUMBER
	 from SalesLT.Customer) as [customer]
	 where ROW_NUMBER BETWEEN @pageSize * @pageNumber +1
	       and @pageSize * (@pageNumber +1)


	 select * from SalesLT.Customer

	 select count(*) [total] from SalesLT.Persona