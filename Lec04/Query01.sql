
USE RH;
GO

SELECT * FROM dbo.empleado
WHERE idcargo = 'C02';
GO

SELECT nombre FROM dbo.Cargo WHERE idcargo='C02';
GO

Select * from dbo.cargo where idcargo = 'c02';
GO

-- Crea la tabla emp_aux con la misma
-- estructura que empleado
select * into dbo.emp_aux 
from dbo.empleado 
where idcargo = 'ZZ';
go


select * from dbo.emp_aux;

insert into dbo.emp_aux 
select * from dbo.empleado where iddepartamento = 102;

select * from dbo.emp_aux;


truncate table dbo.emp_aux;
go

select * from dbo.emp_aux;
go

-- Ejercicio 01
/*
Se necesita una tabla de nombre EMP_1987, que tenga todos 
los empleados que ingresaron en el año 1993.
BD: NORTHWIND
*/

-- Durand

USE Northwind;
GO

SELECT * INTO dbo.EMP_1993
FROM dbo.Employees
WHERE DATEDIFF(YEAR,HireDate,'19930101')=0;
GO

select * from Northwind.dbo.Employees;
go

select * from dbo.EMP_1993;
go


select 
	BirthDate, DATEDIFF(year,BirthDate,GETDATE()) Edad,
	HireDate, DATEDIFF(year,HireDate,GETDATE()) [Tiempo de Servicio]
from Northwind.dbo.Employees;
go










