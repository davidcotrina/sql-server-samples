--Storage size
--6 bytes for precisions less than 3.
--7 bytes for precisions 3 and 4.
--All other precisions require 8 bytes.

--DATETIME2		- 8bytes // 2022-04-04 11:37:46.5795787
--DATETIME2(3)	- 7bytes // 2022-04-04 11:37:46.580
--DATETIME2(0)	- 6bytes // 2022-04-04 11:37:47 


CREATE TABLE ae (
	_datetime datetime,
	_datetime2 datetime2,
	_datetime2_3 datetime2(3),
	_smalldatetime smalldatetime,
	_datetime2_0 datetime2(0)
)

declare @i int = 0
while (@i < 1000)
begin
	insert into ae values (SYSDATETIME(), SYSDATETIME(), SYSDATETIME(), SYSDATETIME(), SYSDATETIME())
	set @i = @i +1
end

--drop table ae

--select * from ae

SELECT 
  x.name
  ,x.max_length
  ,x.precision
  ,COL_LENGTH(OBJECT_NAME(object_id), name) AS [COL_LENGTH()]
FROM sys.columns x
WHERE OBJECT_NAME(object_id) = 'ae'