
-- CONVENTIONS
    -- Use lower letters when naming database objects. For separating words in the database object name, use underscore
    -- Use singular for table names (user, role)
    -- If you’re naming entities that represent real-world facts, you should use nouns. These are tables like employee, customer, city, and country.
    -- Las columnas deben tratar de ser únicas en la bd para evitar alias en las consultas con joins. e.g., country_name, country_code, customer_name
    -- We could use names like is_active, is_deleted

    -- Only Use Lowercase Letters, Numbers, and Underscores


-- SP
    -- p_<table_name>_<action_name>

-- Renombrar
EXEC sp_rename 'TABLE_NAME', 'NEW_TABLE_NAME'

-- Para activar/desactivar la inserción en campos identity
SET IDENTITY_INSERT NombreTabla ON
-- SENTENCIAS
SET IDENTITY_INSERT NombreTabla OFF

--RECOMENDACIONES
    --USAR smalldatetime


-- Rule 6c (Bad Prefixes) - Do not prefix your stored procedures with
-- something that will cause the system to think it is a system procedure.
-- For example, in SQL Server, if you start a procedure with "sp_", "xp_"
-- or "dt_" it will cause SQL Server to check the master database for this
-- procedure first, causing a performance hit. Spend a little time
-- researching if any of the prefixes you are thinking of using are known
-- by the system and avoid using them if they are.


CREATE TABLE products(
    product_id INT IDENTITY PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    unit_price DEC(10,2) CONSTRAINT positive_price CHECK(unit_price > 0)
);



select cast(GETDATE() as datetime2)
select GETDATE()
select cast(GETDATE() as datetimeoffset)

select cast(GETDATE() as smalldatetime)

select SYSDATETIME (), GETDATE()
select SYSUTCDATETIME(),GETUTCDATE()

select CURRENT_TIMESTAMP

SELECT USER_NAME()
SELECT SUSER_SID()