--JOINS
	MERGE: ambas tablas tienen que estar ordenadas
	Nested
	Hash

--
	--Key Lookup: Hace una busqueda adicional al indice principal
	--indice agregar campos en el include crear uno nuevo


SET STATISTICS IO ON;
SET STATISTICS IO OFF;

SET STATISTICS TIME ON;
SET STATISTICS IO ON;


--Borrar todos los planes de memoria caché
DBCC FREEPROCCACHE WITH NO_INFOMSGS

--Vaciar la cache de datos
DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS