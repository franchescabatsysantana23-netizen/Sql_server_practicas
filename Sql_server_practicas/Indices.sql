--limpieza de la cache.
DBCC FREEPROCCACHE WITH NO_INFOMSGS --para que no retorne mensaje en la consola.
DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS

select count(*) from dbo.myTable
where email ='et@icloud.org'

create clustered index IX_Contact_Email
on[dbo].[myTable] (email) --creacion de indice de tipo clustered 

--nota, una tabla unicamente puede contener un unico indice ya sea clustered, pk, no clustered. 
create nonclustered index IX_Contact_Email
on[dbo].[myTable] (email) --creacion de indice de tipo no clustered, no unique. 