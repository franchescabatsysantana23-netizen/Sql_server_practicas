/*
- "sp_help": sin parámetros nos muestra todos los objetos de la base de datos seleccionada, incluidas las funciones definidas por el usuario.
En la columna "Object_type" aparece "scalar function" si es una función escalar, "table function" si es una función de tabla de varias sentencias y 
"inline function" si es una función de tabla en línea.
- "sp_helptext": seguido del nombre de una función definida por el usuario nos muestra el texto que define la función, excepto si ha sido encriptado.

- "sp_stored_procedures": muestra todos los procedimientos almacenados y funciones definidas por el usuario.

- "sp_depends": seguido del nombre de un objeto, nos devuelve 2 resultados: 1) nombre, tipo, campos, etc.

 select name,xtype as tipo,crdate as fecha
  from sysobjects
  where xtype in ('FN','TF','IF');---> permite visualizar todas las funciones definidas por el usuario. 

- La tabla del sistema "sysobjects": muestra nombre y varios datos de todos los objetos de la base de datos actual. La columna "xtype" indica el tipo de objeto


*/