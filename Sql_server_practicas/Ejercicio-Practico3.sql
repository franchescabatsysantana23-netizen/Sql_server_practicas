/*
Uso de declare
*/

use Facturas
goto ir
declare @miParametro INT
set @miParametro =9;

select * from Pedido WHERE pedID!=@miParametro;

select * from Pedido WHERE pedID!>@miParametro;
select * from Pedido WHERE not pedID<=@miParametro;

declare @miparametro2 varchar(20)
set @miparametro2 ='Ali%'
select * from Cliente
where Nombre like @miparametro2

ir:

declare @miparametro21 varchar(20)
set @miparametro21 ='Al_%'
select * from Cliente
where Nombre like @miparametro21;

select * from cliente1;

select * into cliente1
from Cliente 
where Nombre like @miparametro21





