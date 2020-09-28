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


-- =====================================================
-- Operadores relacionales / Operadores de comparación
-- =, <, <=, >, >=, <>
-- Permiten construir una condición simple
-- =====================================================

/*
Ejercicio 10
Desarrollar una sentencia SELECT para consultar los empleados 
de contabilidad cuyo sueldo es mayor a 10,000.00. 
Base de datos RH.
*/

select * from rh.dbo.empleado
where (iddepartamento = 101) AND (sueldo > 10000.0);
go


/*
Ejercicio 11
Desarrollar una sentencia SELECT que permita averiguar los cursos 
que aún no tienen profesor. Base de datos EDUCA.
*/

select * from educa.dbo.CURSO;
go

select * from educa.dbo.CURSO where cur_profesor is null
union
select * from educa.dbo.CURSO where cur_profesor = '';
go

select * from educa.dbo.CURSO 
where (cur_profesor is null) OR (cur_profesor = '');
go

SELECT ISNULL('GANDOR','ES NULO');
GO

SELECT ISNULL(NULL,'ES NULO');
GO

select * from educa.dbo.CURSO 
where ISNULL(cur_profesor,'') = '';
go


-- =====================================================
-- Operadores Lógicos
-- AND OR NOT
-- Permiten construir una condición complejas
-- =====================================================

/*
Problema 12
Desarrollar una sentencia SELECT que permita averiguar los cursos 
que aún no tienen alumnos matriculados. Base de datos EDUCA.
*/

select * from educa.dbo.CURSO WHERE cur_matriculados = 0;
go



-- =======================================================
-- Operadores LIKE, BETWEEN, IN
-- 
--      <columna> [NOT] LIKE 'patron' 
-- 
-- =======================================================


select * from rh.dbo.empleado where nombre like 'A%';
go

select * from rh.dbo.empleado where nombre like '%O';
go

select * from rh.dbo.empleado where nombre like '_E%';
go

select * from rh.dbo.empleado where nombre like '__[AEIOU]%';
go

select * from rh.dbo.empleado where telefono like '_[1-3]%';
go

select * from rh.dbo.empleado 
where convert(varchar,fecingreso,103) like '__/05/2000';
go




