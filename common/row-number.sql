create table test(nombre varchar(100), edad int, sexo varchar(10))
insert into test 
values('Andrés', 26 , 'V'), ('Eva', 42 , 'H'), ('Javier', 18 , 'V'), ('Manolo', 54 , 'V'), ('María', 32 , 'H'), ('Pedro', 20 , 'V'), ('Vicente', 24 , 'V')


select * from test

select * from (
	select 
		ROW_NUMBER() OVER(order by x.edad desc) as orden
		,x.*
	from test x
) u where u.orden = 2

select * from (
	select
		ROW_NUMBER() OVER(partition by x.sexo order by x.edad desc) as orden
		,x.* 
	from test x
) u where u.orden = 2
