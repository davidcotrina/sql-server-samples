-- EJM: 
-- Si tenemos campoA y campoB como CLUSTERED
-- Si buscamos por campoA y campoB a la vez obtendremos SEEK
-- Si buscamos por campoB y campoA a la vez obtendremos SEEK
-- Si buscamos sólo por campoA obtendremos SEEK
-- Si buscamos sólo por campoB obtendremos SCAN