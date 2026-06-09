/*
Se pueden emplear las funciones del sistema en cualquier lugar en el que se permita una expresión en una sentencia "select".

Las funciones pueden clasificarse en:

- deterministicas: siempre retornan el mismo resultado si se las invoca enviando el mismo valor de entrada. Todas las funciones de agregado 
y string son deterministicas, excepto "charindex" y "patindex".

- no deterministicas: pueden retornar distintos resultados cada vez que se invocan con el mismo valor de entrada.
Las siguientes son algunas de las funciones no deterministicas: getdate, datename, textptr, textvalid, rand. Todas las funciones de configuración,
cursor, meta data, seguridad y estadísticas del sistema son no deterministicas.

 una función es un conjunto de sentencias que operan como una unidad lógica, una rutina que retorna un valor.
 Una función tiene un nombre, acepta parámetros de entrada y retorna un valor escalar o una tabla.

 Las funciones definidas por el usuario no permiten parámetros de salida.

 SQL Server admite 3 tipos de funciones definidas por el usuario clasificadas según el valor retornado:

1) escalares: retornan un valor escalar;

2) de tabla de varias instrucciones (retornan una tabla) y

3) de tabla en línea (retornan una tabla).

Las funciones definidas por el usuario se crean con la instrucción "create function" y se eliminan con "drop function".


*/