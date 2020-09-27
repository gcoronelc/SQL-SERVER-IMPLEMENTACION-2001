-- FILTRO DE FILAS
-- =========================================

/*
Pregunta 8
Desarrollar una sentencia SELECT para consultar los empleados 
del departamento de contabilidad. Base de datos RH.
*/

USE RH;
GO

select * from dbo.departamento;
go

-- Cantabilidad = 101

SELECT * FROM DBO.empleado 
WHERE iddepartamento = 101;
GO


SELECT * FROM DBO.empleado 
WHERE iddepartamento in ( select iddepartamento 
						  from dbo.departamento 
						  where nombre = 'contabilidad' );
GO


SELECT e.* 
FROM DBO.empleado E 
JOIN DBO.departamento D 
ON e.iddepartamento = D.iddepartamento 
WHERE D.nombre = 'contabilidad';
go


/*
Pregunta 9
Desarrollar una sentencia SELECT para consultar los empleados 
que se desempeñan como gerentes. Base de datos RH.
*/

select * from rh.dbo.cargo;
go
/*
C01	Gerente General
C02	Gerente
*/


SELECT * FROM RH.DBO.empleado where idcargo = 'C01'
UNION
SELECT * FROM RH.DBO.empleado where idcargo = 'C02'
GO

SELECT * FROM RH.DBO.empleado where idcargo IN ('C01','C02')
GO

SELECT * FROM RH.DBO.empleado where idcargo LIKE 'C0[12]'
GO

SELECT * FROM RH.DBO.empleado 
where idcargo = 'C01' OR idcargo = 'C02';
GO 


