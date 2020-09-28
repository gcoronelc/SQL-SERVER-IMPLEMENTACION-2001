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


-- ====================================================================
--  <columna> [NOT] BETWEEN <limite-inferior> AND <limite-superior>
-- ====================================================================


select * from rh.dbo.empleado
where sueldo between 3500 and 7500;
go

select * from rh.dbo.empleado
order by apellido;
go

select * from rh.dbo.empleado
where apellido between 'C'and 'M'
order by apellido;
go


create table rh.dbo.demo( nombre varchar(50) );
go


insert into rh.dbo.demo( nombre ) 
select nombre from rh.dbo.empleado;
go

insert into rh.dbo.demo values ('M');
insert into rh.dbo.demo values ('F');
go

select * from rh.dbo.demo 
order by 1;

select * from rh.dbo.demo
where nombre between 'F'and 'M'
order by nombre;
go

select * from rh.dbo.demo
where left(nombre,1) between 'F'and 'M'
order by nombre;
go

select * from rh.dbo.demo
where substring(nombre,1,1) between 'F'and 'M'
order by nombre;
go

select * from rh.dbo.empleado
order by fecingreso
go

select * from rh.dbo.empleado
where fecingreso between convert(datetime,'05/04/2000',103) and convert(datetime,'05/05/2000 23:59:59',103)
order by fecingreso
go


select * from rh.dbo.empleado
where fecingreso >= convert(datetime,'05/04/2000',103) 
and fecingreso < (convert(datetime,'05/05/2000',103) + 1)
order by fecingreso
go



-- ====================================================================
--  <columna> [NOT] IN (<valor1>, <valor2>, <valor3>, ....)
--  <columna> [NOT] IN (select <columna> from <tabla> ... )
-- ====================================================================

SELECT * FROM RH.DBO.empleado where idcargo IN ('C01','C02')
GO

SELECT * FROM RH.DBO.empleado 
where idcargo IN ( select idcargo from rh.dbo.cargo where nombre like 'Gerente%' );
GO


/*
Problema 13.	
Desarrollar una sentencia SELECT que permita consultar los empleados 
que su nombre finaliza con la letra "O". 
Base de datos RH.
*/

/* Claudia */
select * from rh.dbo.empleado where nombre like '%o';
go


/*
Problema 14.
Desarrollar una sentencia SELECT que permita consultar los empleados 
que su apellido tiene en la segunda posición la letra "A" ó "O". 
Base de datos RH.
*/

/* Huaman */
select * from rh.dbo.empleado
where apellido like '_A%' or apellido like '_O%';
go


/*
Problema 15.
Desarrollar una sentencia SELECT que permita averiguar que empleados 
tienen un sueldo mayor de 3,000.0 y menor de 10,000.0. 
Base de datos RH.
*/

/* Soberon */
SELECT * FROM DBO.empleado
WHERE sueldo BETWEEN 3000.0 AND 10000.0
GO


/*
Problema 16.
Desarrollar una sentencia SELECT que permita averiguar quiénes son los empleados 
de los departamentos de contabilidad y ventas. 
Base de datos RH.
*/





