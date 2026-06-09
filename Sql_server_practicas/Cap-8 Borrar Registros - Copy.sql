delete from usuarios 

if object_id('usuarios') is not null
  drop table usuarios;

create table usuarios(
  nombre varchar(30),
  clave varchar(10)
);

go

insert into usuarios (nombre,clave)
  values ('Marcelo','River');
insert into usuarios (nombre,clave)
  values ('Susana','chapita');
insert into usuarios (nombre,clave)
  values ('CarlosFuentes','Boca');
insert into usuarios (nombre,clave)
  values ('FedericoLopez','Boca');

select * from usuarios;

-- Eliminamos el registro cuyo nombre de usuario es "Marcelo"
delete from usuarios
  where nombre='Marcelo';

select * from usuarios;

-- Intentamos eliminarlo nuevamente (no se borra registro)
delete from usuarios
 where nombre='Marcelo';

select * from usuarios;

-- Eliminamos todos los registros cuya clave es 'Boca'
delete from usuarios
  where clave='Boca';

select * from usuarios;

-- Eliminemos todos los registros
delete from usuarios;

select * from usuarios;


if object_id('agenda') is not null
drop table agenda

select * from agenda
create table agenda(
apellido varchar(30),
nombre varchar(20),
domicilio varchar(30),
telefono varchar(11))
insert into agenda values
 ('Alvarez','Alberto','Colon 123','4234567'),
 ('Juarez','Juan','Avellaneda 135','4458787'),
 ('Lopez','Maria','Urquiza 333','4545454'),
 ('Lopez','Jose','Urquiza 333','4545454'),
 ('Salas','Susana','Gral. Paz 1234','4123456')

 select * from agenda
 select * from agenda
 where nombre ='Juan'
 select * from agenda
 where telefono ='4545454'

 select * from agenda
 delete from agenda
 select * from agenda