
-- OUTPUT inserted VS SCOPE_IDENTITY
-- OUTPUT inserted.COLUMN_TABLE_ID returns id was inserted
-- Este es necesario cuando se desea retornar todos los ids insertados
-- SCOPE_IDENTITY sólo retorna el último ID insertado
-- OUTPUT inserted.column1, inserted.column2...
INSERT INTO products (product_name, unit_price)
OUTPUT inserted.product_id
VALUES ('Leche Gloria',3.50)

SELECT SCOPE_IDENTITY()
	