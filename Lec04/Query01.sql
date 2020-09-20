
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

SELECT * INTO dbo.EMP_1994
FROM dbo.Employees
WHERE year(hiredate) = 1994;     --DATEDIFF(YEAR,HireDate,'19940101')=0;
GO

select * from Northwind.dbo.Employees;
go

select * from dbo.EMP_1993;
go

select * from dbo.EMP_1994;
go


select 
	BirthDate, DATEDIFF(year,BirthDate,GETDATE()) Edad,
	HireDate, DATEDIFF(year,HireDate,GETDATE()) [Tiempo de Servicio]
from Northwind.dbo.Employees;
go



USE RH
GO


select * into dbo.cargo_aux from dbo.cargo;
go

select * from dbo.cargo_aux;
go

DELETE FROM dbo.cargo_aux
WHERE idcargo = 'C10';
GO


-- Recomendación

-- Inicio de Tx
begin tran;
go

select @@TRANCOUNT;
go

select * from dbo.cargo_aux;
go

DELETE FROM dbo.cargo_aux
WHERE idcargo = 'C09';
GO

-- Cancela todo
rollback tran;
go

-- Confirmar todo
commit tran;
go



begin tran;
go

select * from rh.dbo.empleado;

update rh.dbo.empleado
set sueldo = 35000
where  idempleado = 'E0001';
GO

rollback tran;
go

COMMIT TRAN;
GO




USE RH;
GO

SELECT * FROM DBO.cargo;
GO

BEGIN TRAN;
GO

UPDATE dbo.cargo SET idcargo = 'C99'
WHERE idcargo = 'C10';
GO

ROLLBACK TRAN;
GO



BEGIN TRAN;
GO

SELECT @@TRANCOUNT;
GO

SELECT * FROM DBO.CARGO;
GO

DELETE FROM dbo.cargo
WHERE idcargo = 'C02';
GO

DELETE FROM dbo.cargo
WHERE idcargo = 'C10';
GO

ROLLBACK TRAN;
GO