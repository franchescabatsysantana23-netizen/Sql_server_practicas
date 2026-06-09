/*
Funciones(Encriptado)
Las funciones definidas por el usuario pueden encriptarse, para evitar que sean leídas con "sp_helptext".

create function NOMBREFUNCION
 (@PARAMETRO TIPO) 
  returns TIPO
  with encryption
  as 
  begin
   CUERPO
   return EXPRESION
  end

 create function NOMBREFUNCION
 (@PARAMETRO TIPO)
 returns @NOMBRETABLARETORNO table-- nombre de la tabla
 --formato de la tabla
 (CAMPO1 TIPO,
  CAMPO2 TIPO,
  CAMPO3 TIPO
 )
 with encryption
 as
 begin
   insert @NOMBRETABLARETORNO
    select CAMPOS from TABLA
     where campo OPERADOR @PARAMETRO
   RETURN
 end

 Ejemplo de creacion de funciones 

 create function f_libros
 (@autor varchar(30)='Borges')
  returns table
  with encryption
  as
  return (
  select titulo
  from libros 
  where autor like '%'+@autor+'%');

  -- visualizacion de la creacion de la funcion 
  sp_helptext f_libros -- retorna que la funcion consultada se encuentra encryptada. 
*/