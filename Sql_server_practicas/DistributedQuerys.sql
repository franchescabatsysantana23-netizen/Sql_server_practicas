-- Activar distributed queries 

sp_configure 'show advanced options',1
RECONFIGURE ---Configuracion de opciones advanzadas. 
sp_configure
sp_configure 'Ad Hoc Distributed Queries',1
RECONFIGURE
---conexion sql para conectar a otro servidor remoto en otra ubicacion.

--Query para conectarse a un servidor remoto.
select * from openrowset ('SQLNCLI','Server =192.168.0.14;
                          UID =sa; PWD=123456', bd1.dbo.alumnos

/*Para importacion de registros en json*/
DECLARE @JSON varchar(max)
select @JSON = bulkcolumn
from openrowset (bulk 'C:\SQLDATA\archivo.json', single_clob) import
select * from OPENJSON (@JSON)

--- Aumenta el nivel de compatibilidad de la bases de datos. 
ALTER DATABASE AdventureWorksLT2016
SET COMPATIBILITY_LEVEL = 150;


select * from @json