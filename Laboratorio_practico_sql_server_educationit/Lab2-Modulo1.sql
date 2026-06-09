-- 1.Mostrar el nombre, precio y color de los accesorios para asientos, las bicicletas cuyo precio sea mayor a 100 pesos.
use AdventureWorks2022;
select *from Production.Product;
select Name,Color, ListPrice from Production.Product
where ListPrice>100 and name like '%Seat%';

-- 2. Mostrar el nombre de los productos que tengan cualquier combinación de ‘mountain bike’

select Name from Production.Product
where name like '%mountain bike%'

-- 3. Mostrar las personas cuyo nombre comience con la letra “y”.
--Tablas: Person.Person
--Campos: FirstName
select * from Person.Person;
select FirstName from Person.Person
where FirstName like 'y%';

-- 4. Mostrar las personas que en la segunda letra de su apellido tienen una ‘s.
--Tablas: Person.Person
--Campos: LastName
  select *  from Person.Person
  where LastName like '_[s]%';  --la segunda letra de su apellido tienen una ‘s

  select *  from Person.Person
  where LastName like '__[s]%'; -- selecciona el apellido que contenga la tercera letra con s en su apellido.


  -- 5. Mostrar el nombre concatenado con el apellido de las personas cuyo apellido terminen en ‘ez’.

      --Tablas: Person.Person
      --Campos: FirstName, LastName
      --solucion 1
      select concat (FirstName,'-',LastName) from Person.Person
      where LastName like '%ez';

      --solucion 2
         select FirstName + '-' + LastName from Person.Person
      where LastName like '%ez';

      --6. Mostrar los nombres de los productos que terminen en un número.
      --Tablas: Production.Product
      --Campos: Name

      select * from Production.Product
      where name like'%[0-9]' -- Busca los nombre de los productos que terminen en numeros. 


      /* 7. Mostrar las personas cuyo nombre tenga una ‘C’ o ‘c’ como primer carácter, cualquier otro
        como segundo carácter, ni ‘d’ ni ‘e’ ni ‘f’ ni ‘g’ como tercer carácter, cualquiera entre ‘j’ y ‘r’ o
        entre ‘s’ y ‘w’ como cuarto carácter y el resto sin restricciones.*/

        --Tablas: Person.Person
        --Campos: FirstName

        select * from Person.Person
        where FirstName like '[Cc]_[^defg][jrsw]%'


        ---------AdventureWorks : BETWEEN --------------------------------

        -- 1. Mostrar todos los productos cuyo precio de lista esté entre 200 y 300.
        --Tablas: Production.Product
        --Campos: ListPrice
 
         select * from Production.Product
         where ListPrice between  200 and 300 

     --- 2. Mostrar todos los empleados que nacieron entre 1970 y 1985.
     --Tablas: HumanResources.Employee
     --Campos: BirthDate

      select * from HumanResources.Employee
      where year(BirthDate) between 1970 and  1985;

      --- 3. Mostrar la fecha, número de cuenta y subtotal de las órdenes de venta efectuadas en los años 2005 y 2006.
      --Tablas: Sales.SalesOrderHeader
      --Campos: OrderDate, AccountNumber, SubTotal

      select OrderDate, AccountNumber, SubTotal from Sales.SalesOrderHeader
      where year(OrderDate) between 2005 and 2006;

     --4. Mostrar todas las órdenes de venta cuyo Subtotal no esté entre 50 y 70.
     --Tablas: Sales.SalesOrderHeader
     --Campos: OrderDate, AccountNumber, SubTotal

         select OrderDate, AccountNumber, SubTotal from Sales.SalesOrderHeader
      where not SubTotal between 50 and 70;

               select OrderDate, AccountNumber, SubTotal from Sales.SalesOrderHeader
      where SubTotal not between 50 and 70;

      --------------Ejercicio 3. AdventureWorks : IN----------------------

      /*
      Mostrar los códigos de orden de venta, código de producto, cantidad vendida y precio
      unitario de los productos 750, 753 y 770.
      */
      --Tablas: Sales.SalesOrderDetail
      --Campos: SalesOrderID, OrderQty, ProductID,UnitPrice

       select SalesOrderID,ProductID,OrderQty, ProductID,UnitPrice
       from Sales.SalesOrderDetail
       where ProductID in (750, 753 , 770)

       /*2. Mostrar todos los productos cuyo color sea
       verde, blanco y azul.*/

       --Tablas: Production.Product
       --Campos: Color

       select * from Production.product
       where Color in('Green','White','Blue')

       








        






  -- 

