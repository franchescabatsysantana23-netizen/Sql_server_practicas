-- Clonar estructura (ProductID, ListPrice) y datos de la tabla Production.Product en una
-- tabla llamada Productos.

select ProductID,ListPrice 
into Productos
from Production.Product


--Crear un trigger sobre la tabla Productos llamado TR_ActualizaPrecios donde
-- actualice la tabla #HistoricoPrecios con los cambios de precio.
--Tablas: Productos
--Campos: ProductID, ListPrice

create table #historicoPrecios (
productID int, 
ListPrice decimal)

insert into #historicoPrecios
select * from Productos;

alter trigger TR_Actualizar_Precios on dbo.Productos
after update as
 begin 
      update h
      set ListPrice = j.ListPrice
      from #historicoPrecios h inner join inserted j
      on h.productID = j.ProductID
end

select * from Productos;

update Productos
set ListPrice=850
where ProductID=1

select * from #historicoPrecios
select * from Productos;

--3. Adaptar el trigger del punto anterior donde
--valide que el precio no pueda ser negativo.

alter trigger TR_Actualizar_Precios on dbo.Productos
after update as
 begin 
      if exists(
           select 1 
               from inserted j
               join Productos p on j.ProductID=p.ProductID
               where p.ListPrice >=0 )
            begin
                  update h
                  set ListPrice = j.ListPrice
                  from #historicoPrecios h inner join inserted j
                  on h.productID = j.ProductID
            end

        else 
            begin
              PRINT 'El valor del precio del producto no puede ser menor a cero';
              rollback transaction;
            end      
end;



update Productos
set ListPrice=830
where ProductID=1

select * from #historicoPrecios
select * from Productos;