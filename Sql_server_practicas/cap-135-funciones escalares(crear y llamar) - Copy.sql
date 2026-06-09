/*
Una función escalar retorna un único valor. Como todas las funciones, se crean con la instrucción "create function".
 create function NOMBRE
 (@PARAMETRO TIPO=VALORPORDEFECTO)
  returns TIPO
  begin
   INSTRUCCIONES
   return VALOR
  end;

La cláusula "returns" indica el tipo de dato retornado.
El cuerpo de la función, se define en un bloque "begin...end" que contiene las instrucciones que retornan el valor. 
El tipo del valor retornado puede ser de cualquier tipo, excepto text, ntext, image, cursor o timestamp.

//creacion de funcion del promedio

 create function f_promedio
 (@valor1 decimal(4,2),
  @valor2 decimal(4,2)
 )
 returns decimal (6,2)
 as
 begin 
   declare @resultado decimal(6,2)
   set @resultado=(@valor1+@valor2)/2
   return @resultado
 end;

 Ejemplo de creacion de funcion

 create function f_nombreMes
 (@fecha datetime='2007/01/01')
  returns varchar(10)
  as
  begin
    declare @nombre varchar(10)
    set @nombre=
     case datename(month,@fecha)
       when 'January' then 'Enero'
       when 'February' then 'Febrero'
       when 'March' then 'Marzo'
       when 'April' then 'Abril'
       when 'May' then 'Mayo'
       when 'June' then 'Junio'
       when 'July' then 'Julio'
       when 'August' then 'Agosto'
       when 'September' then 'Setiembre'
       when 'October' then 'Octubre'
       when 'November' then 'Noviembre'
       when 'December' then 'Diciembre'
     end--case
    return @nombre
 end;

 Las funciones que retornan un valor escalar pueden emplearse en cualquier consulta donde se coloca un campo.if object_id('empleados') is not null
  drop table empleados;

 Podemos colocar un valor por defecto al parámetro, pero al invocar la función, para que tome el valor por defecto DEBEMOS especificar "default". Por ejemplo, 
  select dbo.f_nombreMes(default);

  /*
  Contenido Practico
  */
  set language us_english;   --coloca el contenido de la sesion en ingles.

  if object_id('empleados') is not null
  drop table empleados

  Create table empleados(
  documento char(8) not null,
  nombre varchar(30),
  fechaingreso datetime,
  mail varchar(50),
  telefono varchar(12))

  set dateformat ymd

insert into empleados values('22222222', 'Ana Acosta','1985/10/10','anaacosta@gmail.com','4556677');
insert into empleados values('23333333', 'Bernardo Bustos', '1986/02/15',null,'4558877');
insert into empleados values('24444444', 'Carlos Caseros','1999/12/02',null,null);
insert into empleados values('25555555', 'Diana Dominguez',null,null,'4252525');

if object_id('dbo.f_fechaCadena') is not null
drop function dbo.f_fechaCadena

create function f_fechaCadena
(@fecha varchar(25))
returns varchar(25)
as
begin
declare @nombre varchar(25)
set @nombre ='Fecha invalida'
if(isdate(@fecha)=1)
begin 
set @fecha =cast (@fecha as datetime)
set @nombre=
case datename(month,@fecha)
when 'Junuary' then 'Enero'
when 'February' then 'Febrero'
when 'March' then 'Marzo'
when 'April' then 'Abril'
when 'May' then 'Mayo'
when 'June' then 'Junio'
when 'July' then 'Julio'
when 'August' then 'Agosto'
 when 'September' then 'Setiembre'
 when 'October' then 'Octubre'
 when 'November' then 'Noviembre'
 when 'December' then 'Diciembre'
 end--case
 set @nombre =rtrim (cast (datepart(day,@fecha) as char(2))+'de'+@nombre)
 set @nombre =@nombre+'de'+rtrim(cast(datepart(year,@fecha) as char(4)))
 end
 return @nombre
 end

 -- Recuperamos los registros de "empleados", mostrando el nombre y la fecha
-- de ingreso empleando la función creada anteriormente:
 select nombre, dbo.f_fechaCadena(fechaingreso) as ingreso from empleados

 -- Empleamos la función en otro contexto:
select dbo.f_fechaCadena(getdate());
*/
--contenido practico

if object_id('consultas') is not null
drop table consultas

if object_id('medicos') is not null 
drop table medicos

create table medicos(
documento char(8) not null,
nombre varchar(30),
constraint PK_medicos 
primary key clustered(documento))


create table consultas(
fecha datetime,
medico char(8) not null,
paciente varchar(30),
constraint PK_consultas
primary key(fecha,medico),
constraint FK_consultas_medicos
foreign key(medico)
references medicos(documento)
on update cascade
on delete cascade)

--insercion de registros 


 insert into medicos values('22222222','Alfredo Acosta');
 insert into medicos values('23333333','Pedro Perez');
 insert into medicos values('24444444','Marcela Morales');

 insert into consultas values('2007/03/26 8:00','22222222','Juan Juarez');
 insert into consultas values('2007/03/26 8:00','23333333','Gaston Gomez');
 insert into consultas values('2007/03/26 8:30','22222222','Nora Norte');
 insert into consultas values('2007/03/28 9:00','22222222','Juan Juarez');
 insert into consultas values('2007/03/29 8:00','24444444','Nora Norte');
 insert into consultas values('2007/03/24 8:30','22222222','Hector Huerta'); 
 insert into consultas values('2007/03/24 9:30','23333333','Hector Huerta');

 --eliminacion de la funcion nombre dia
 if  object_id('f_nombreDia') is not null
 drop function f_nombreDia

 ---

  if  object_id('f_horario') is not null
 drop function f_horario

 if object_id('f_fecha') is not null
 drop function f_fecha


 ---5- Cree la función "f_nombreDia" que recibe una fecha (tipo string) y nos retorne el nombre del día en español.

/*
7- Cree la función "f_horario" que recibe una fecha (tipo string) y nos retorne la hora y minutos.
9- Cree la función "f_fecha" que recibe una fecha (tipo string) y nos retorne la fecha (sin hora ni 
minutos)
10- Muestre todas las consultas del médico llamado 'Alfredo Acosta', incluyendo el día (emplee la 
función "f_nombreDia", la fecha (emplee la función "f_fecha"), el horario (emplee la función 
"f_horario") y el nombre del paciente.
11- Muestre todos los turnos para el día sábado, junto con la fecha, de todos los médicos.
*/





 create function f_nombreDia
 (@fecha varchar(30))
  returns varchar(10)
  as
  begin
    declare @nombre varchar(10)
    set @nombre='Fecha inválida'   
    if (isdate(@fecha)=1)
    begin
      set @fecha=cast(@fecha as datetime)
      set @nombre=
      case datename(weekday,@fecha)
       when 'Monday' then 'lunes'
       when 'Tuesday' then 'martes'
       when 'Wednesday' then 'miércoles'
       when 'Thursday' then 'jueves'
       when 'Friday' then 'viernes'
       when 'Saturday' then 'sábado'
       when 'Sunday' then 'domingo'
      end--case
    end--si es una fecha válida
    return @nombre
 end;

select dbo.f_nombredia(getdate()) as dia 