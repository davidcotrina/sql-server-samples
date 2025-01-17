--UG.363
--UG.457

--Búsquedas por patrón
--[] => Representa cualquier carácter individual dentro de los corchetes. No rango.
--^  => Representa cualquier carácter que no esté entre paréntesis

select * from PO_DetalleTipoOperacion DT
WHERE dt.s_con_codigo like '[UW]_.%'

select * from semestre s where s.s_sem_tipo like '[UW]%'

select * from PO_DetalleTipoOperacion DT
WHERE dt.s_con_codigo like '[^UW]%'
and dt.s_con_codigo like '[UW][GA].%' --UG. o WA.

--CUANDO ES MUCHA DATA EVITAR USAR "IN CLAUSE", en su lugar es mejor utilizar un JOIN