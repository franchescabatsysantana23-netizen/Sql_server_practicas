if object_id('visitantes') is not null
drop table visitantes

use bd1
select * from visitantes
go
create table visitantes(
nombre varchar(30),
edad tinyint,
sexo char(1) default 'f',
domicilio varchar(30),
ciudad varchar(20) default 'Cordoba',
telefono varchar(11),
mail varchar(30) default 'no tiene',
montocompra decimal(6,2)
)
exec sp_columns visitantes

insert into dbo.visitantes(nombre,domicilio, montocompra)
values('Susana Molina','Colon 123',59.80)
insert into dbo.visitantes(nombre,edad,ciudad,mail)
values('Marcos Torres',29,'Carlos Paz','marcostorres@hotmail.com')

select * from dbo.visitantes
exec sp_columns visitantes

insert into dbo.visitantes(nombre,domicilio, mail,montocompra)
values('Susana Molina','Colon 123',default,59.80)


---Segunda Practica
if object_id('prestamos') is not null
drop table prestamos

select * from prestamos

create table prestamos(
titulo varchar(40) not null,
documento char(8) not null,
fechaprestamo datetime not null,
fechadevolucion datetime,
devuelto char(1) default 'n') 

select * from prestamos
insert into bd1.dbo.prestamos (titulo,documento,fechaprestamo,fechadevolucion,devuelto)
values ('Manual de 1 grado','23456789','2006-12-15','2006-12-18',default),
 ('Alicia en el pais de las maravillas','23456789','2006-12-16',null,default),
 ('El aleph','22543987','2006-12-16','2006-08-19',default),
 ('Manual de geografia 5 grado','25555666','2006-12-18',null,'s')


 insert into bd1.dbo.prestamos (titulo,documento,fechaprestamo,fechadevolucion,devuelto)
values ('Manual de 1 grado','23456789','2006-12-15','2006-12-18',default values)

insert into prestamos default values