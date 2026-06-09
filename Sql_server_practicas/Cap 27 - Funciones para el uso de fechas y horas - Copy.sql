/*
-getdate(): retorna la fecha y hora actuales.
select getdate();
- datepart(partedefecha,fecha): retorna la parte específica de una fecha, el año,
trimestre, día, hora, etc
 
- select datepart(month,getdate());
     retorna el número de mes actual;

- select datepart(day,getdate());
    retorna el día actual;

- select datepart(hour,getdate());
     retorna la hora actual;
- datename(partedefecha,fecha): retorna el nombre de una parte específica de una fecha.
      select datename(month,getdate());
         retorna el nombre del mes actual;
      select datename(day,getdate());
-dateadd(partedelafecha,numero,fecha): agrega un intervalo a la fecha especificada, es decir, 
retorna una fecha adicionando a la fecha enviada como tercer argumento, el intervalo de tiempo indicado
por el primer parámetro, tantas veces como lo indica el segundo parámetro.

- datediff(partedelafecha,fecha1,fecha2): calcula el intervalo de tiempo (según el primer argumento) 
entre las 2 fechas. El resultado es un valor entero que corresponde a fecha2-fecha1.
- day(fecha): retorna el día de la fecha especificada.
- month(fecha): retorna el mes de la fecha especificada.
-year(fecha): retorna el año de la fecha especificada.
*/
if object_id('libros') is not null
drop table libros

create table libros(
titulo varchar(40) not null,
autor varchar(20) default 'Desconocido',
editorial varchar(20),
edicion datetime,
precio decimal(6,2))

select * from libros 
set dateformat ymd
insert into libros values('El aleph','Borges','Emece','1980/10/10',25.33);
insert into libros values('Java en 10 minutos','Mario Molina','Siglo XXI','2000/05/05',50.65);
insert into libros values('Alicia en el pais de las maravillas','Lewis Carroll','Emece','2000/08/09',19.95);
insert into libros values('Aprenda PHP','Mario Molina','Siglo XXI','2000/02/04',45);

select titulo [nombre], datepart(YEAR, '1980-10-10') from libros

 
select titulo [nombre], datepart(YEAR, edicion) 'Año' from libros

select * from libros 
select titulo [nombre], datepart(month,edicion) 'Mes' from libros
select * from libros 
select titulo [nombre], DATEPART(day, edicion) 'dia'  from libros

select datepart(day,GETDATE()) 'dia'
select datepart(month,getdate()) 'mes'
select datepart(year, getdate()) 'Año'
select datepart(hour,getdate()) 'hora'


select getdate() 'fecha Actual'
select datename(getdate()) 'dia'
SELECT DATENAME(day, '12:10:30.123')

select DATEDIFF(day,edicion, getdate()) [diferencia dos fechas] from libros
select * from libros
select DATEDIFF(month,edicion, getdate()) [diferencia dos fechas] from libros

select * from libros
select DATEDIFF(year,edicion, getdate()) [diferencia dos fechas] from libros

select DATEDIFF(year,'2023-09-10', getdate()) 'Diferencia de Año'
select datediff(month,'2023-09-10',getdate()) 'Diferencia de meses'
select datediff(day,'2023-09-10',getdate()) 'Diferencia de tiempo en dias'

select dateadd (day,5,getdate()) [Fecha Actual mas Cinco dias]
select dateadd (month,5,getdate()) [Fecha Actual mas Cinco meses]
select dateadd (year,5,getdate()) [Fecha Actual mas Cinco Años]

// retorna el nombre del titulo cuando el dia del campo fecha es igual a 10.
select titulo [nombre] from libros 
where datepart(day,edicion)=10