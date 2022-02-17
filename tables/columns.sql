
-- Modify column’s data type
-- Change the size of a column
ALTER TABLE table_name 
ALTER COLUMN column_name new_data_type(size);
--OR
ALTER COLUMN c VARCHAR (20) NOT NULL;


-- ADD
ALTER TABLE table_name
ADD 
	column_name1 VARCHAR(5)
	,column_name2 INT
	,column_name3 DATETIME
;