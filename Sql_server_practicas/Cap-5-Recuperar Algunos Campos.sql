exec sp_columns peliculas
--- insercion de registros
 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Mision imposible','Tom Cruise',180,3);
 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Mision imposible 2','Tom Cruise',190,2);
 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Mujer bonita','Julia Roberts',118,3);
 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Elsa y Fred','China Zorrilla',110,2);

  select * from peliculas
  select nombre from peliculas
  select nombre,duracion from peliculas
  select nombre,cantidad from peliculas


  if object_id('empleados') is not null 
  drop table empleados

  select * from empleados 
  create table empleados(
  nombre varchar(20),
  documento varchar(8),
  sexo varchar(1),
  domicilio varchar(30),
  sueldobasico float);

  exec sp_columns empleados

  insert into empleados(nombre,documento,sexo,domicilio,sueldobasico) values
  ('Juan Jerez','22333444','m','Sarmiento 123',500),
  ('Ana Acosta','27888999','f','Colon 134',700),
  ('Carlos Caceres','31222333','m','Urquiza 479',850)

  select * from empleados
  select nombre, documento, domicilio from empleados
  select documento, sexo, sueldobasico from empleados



