if object_id('cuentas') is not null
drop table cuentas

select * from cuentas
create table cuentas(
numero int identity,
documento char(8) not null,
nombre varchar(30),
saldo money)
insert into cuentas values(1,'25666777','Juan Perez',2500.50)
insert into cuentas values ('25666777','Juan Perez',2500.50)
insert into cuentas (numero,documento,nombre,saldo) values(5,'28999777','Luis Lopez',34000)

insert into cuentas (nombre, saldo) values('Luis Lopez',34000)
select * from cuentas