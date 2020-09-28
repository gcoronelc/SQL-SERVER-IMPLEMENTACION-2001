

/*
==========================================================
FUNCIONES AGREGADAS
Actuan sobre columnas, lo mas utilizado.
Pueden actuar sobre expresiones, a traves de todas
las filas de una tala.
==========================================================
- COUNT
- MAX
- MIN
- SUM
- AVG
*/


SELECT SUM(SUELDO) planilla1, SUM(SUELDO*1.20) planilla2 
FROM RH.DBO.EMPLEADO;
GO

SELECT SUM(SUELDO) FROM RH.DBO.EMPLEADO;
GO


/*
Problema 1.
Desarrolle una sentencia SELECT para calcular el importe de la planilla del 
departamento de ventas. Debe incluir el sueldo y la comisión. Base de datos RH.
*/

select sum(sueldo + comision ) planilla from rh.dbo.empleado;
go

-- 50500.00


select sum(sueldo + isnull(comision,0) ) planilla from rh.dbo.empleado;
go

-- 220800.00
