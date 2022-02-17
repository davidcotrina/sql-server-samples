DECLARE @xml XML= '<encuesta><participanteId>3</participanteId><pregunta><id>1</id><grupoOpcion><preguntaGrupoId>1</preguntaGrupoId><valorEntero>4</valorEntero></grupoOpcion></pregunta><pregunta><id>2</id><grupoOpcion><preguntaGrupoId>2</preguntaGrupoId><valorEntero>4</valorEntero></grupoOpcion><grupoOpcion><preguntaGrupoId>3</preguntaGrupoId><valorTexto>TTT</valorTexto></grupoOpcion></pregunta><pregunta><id>3</id><grupoOpcion><preguntaGrupoId>4</preguntaGrupoId><valorEntero>5</valorEntero></grupoOpcion></pregunta><pregunta><id>4</id><grupoOpcion><preguntaGrupoId>5</preguntaGrupoId><valorTexto>HHH</valorTexto></grupoOpcion></pregunta><pregunta><id>5</id><grupoOpcion><preguntaGrupoId>6</preguntaGrupoId><valorEntero>3</valorEntero></grupoOpcion></pregunta><pregunta><id>6</id><grupoOpcion><preguntaGrupoId>7</preguntaGrupoId><valorEntero>1</valorEntero></grupoOpcion></pregunta><pregunta><id>7</id><grupoOpcion><preguntaGrupoId>8</preguntaGrupoId><valorEntero>5</valorEntero></grupoOpcion></pregunta><pregunta><id>8</id><grupoOpcion><preguntaGrupoId>9</preguntaGrupoId><valorEntero>0</valorEntero></grupoOpcion></pregunta><pregunta><id>9</id><grupoOpcion><preguntaGrupoId>10</preguntaGrupoId><valorEntero>5</valorEntero></grupoOpcion></pregunta></encuesta>'
DECLARE @handlerOne int  
EXEC sp_xml_preparedocument @handlerOne OUTPUT, @xml;

	SELECT *
	INTO #RIVERA
	FROM OPENXML(@handlerOne, '/encuesta/pregunta/grupoOpcion', 2)
	WITH (
		participanteId INT '../../participanteId'
		,preguntaId INT '../id'
		,preguntaGrupoId INT
		,valorEntero INT
		,valorTexto VARCHAR(1000)
	)  

EXEC sp_xml_removedocument @handlerOne;
 
SELECT * FROM #RIVERA

DROP TABLE #RIVERA



--DECLARE @handler int  
--EXEC sp_xml_preparedocument @handler OUTPUT, @xml;

--	SELECT *
--	INTO #TIBURON
--	FROM OPENXML(@handler, '/encuesta/pregunta/grupoOpcion', 2)
--	WITH (
--		id INT,
--		valor VARCHAR(50)
--	)  

--EXEC sp_xml_removedocument @handler;
 
--SELECT * FROM #TIBURON
--DROP TABLE #TIBURON