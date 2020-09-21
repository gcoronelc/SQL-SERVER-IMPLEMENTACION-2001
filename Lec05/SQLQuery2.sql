
select * 
from rh.dbo.empleado;
go


select idempleado, sueldo 
from rh.dbo.empleado;

-- Selección de columnas

-- Pregunta 1 (Durand)
SELECT nombre, apellido, email
FROM RH..empleado;
go

-- Pregunta 2 (Diana)
Select cur_nombre,cur_vacantes,cur_precio From educa.dbo.CURSO;
go

-- Pregunta 2 (Zully)
select cur_nombre,cur_vacantes, cur_precio from educa.dbo.CURSO 
go


-- Campos calculados

select * from northwind..employees;
go

select 
	EmployeeID Codigo, CONCAT( LastName, ', ', FirstName ) Nombre,
	DATEDIFF( year, BirthDate, GETDATE() ) Edad
from northwind..Employees;
go


-- Pregunta 3 (Durand)
SELECT
cur_id,'cur_importe'=cur_vacantes*cur_precio
FROM EDUCA..CURSO;
go

-- Pregunta 4 (Durand)
SELECT
cur_id
,'cur_recaudado'=cur_matriculados*cur_precio
FROM EDUCA..CURSO

-- Profe
select sum(pag_importe) [IMPORTE RECAUDADO] from educa..PAGO;
go

-- Pregunta 5

SELECT
cur_id
,'cur_recaudado'=cur_matriculados*cur_precio
,'cur_norecaudado'=cur_vacantes*cur_precio-cur_matriculados*cur_precio
FROM EDUCA..CURSO
WHERE cur_matriculados<>0

-- Profe

select sum(cur_matriculados * cur_precio) importe from educa..curso;
go

-- 9500.00


select sum(mat_precio) importe from educa..MATRICULA;
go

-- 8200.00

