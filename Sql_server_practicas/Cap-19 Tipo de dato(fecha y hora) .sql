/*
1) datetime: puede almacenar valores desde 01 de enero de 1753 hasta 31 de diciembre de 9999.
2) smalldatetime: el rango va de 01 de enero de 1900 hasta 06 de junio de 2079.
Para almacenar valores de tipo fecha se permiten como separadores "/", "-" y ".".
-mdy: 4/15/96 (mes y día con 1 ó 2 dígitos y año con 2 ó 4 dígitos),
-myd: 4/96/15,
-dmy: 15/4/1996
-dym: 15/96/4,
-ydm: 96/15/4,
-ydm: 1996/15/4,
Para ingresar una fecha con formato "día-mes-año", tipeamos:
 set dateformat dmy;

 Tipo		Bytes de almacenamiento
_______________________________________
datetime	8
smalldatetime	4
*/
if object_id('alumnos') is not null
drop table alumnos

select * from alumnos

create table alumnos(
apellido varchar(30),
nombre varchar(30),
documento char(8),
domicilio varchar(30),
fechaingreso datetime,
fechanacimiento datetime)

//setear la fecha en formato dia mes y ano
set dateformat 'dmy'
 insert into alumnos values('Gonzalez','Ana','22222222','Colon 123','10-08-1990','15/02/1972');
  insert into alumnos values('Juarez','Bernardo','25555555','Sucre 456','03-03-1991','15/02/1972');
   insert into alumnos values('Perez','Laura','26666666','Bulnes 345','03-03-91',null);
    insert into alumnos values('Lopez','Carlos','27777777','Sarmiento 1254','03-15-1990',null);
	select * from alumnos 
	where fechaingreso <'1-1-91'

	select * from alumnos
	where fechanacimiento is null
	insert into alumnos values('Rosas','Romina','28888888','Avellaneda 487','03151990',null);
	set dateformat 'mdy'
	 insert into alumnos values('Lopez','Carlos','27777777','Sarmiento 1254','03-15-1990',null);