-- Mostrar las personas ordenadas, primero por su apellido y luego por su nombre.

--Tablas: Person.Person
--Campos: Firstname, Lastname


select * from Person.Person
order by Firstname, Lastname;

--Mostrar los cinco productos más caros y su nombre, ordenados en forma alfabética.
--Tablas: Production.Product
--Campos: Name, ListPrice
select * from Production.Product
order by name asc, ListPrice desc;
