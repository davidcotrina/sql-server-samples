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