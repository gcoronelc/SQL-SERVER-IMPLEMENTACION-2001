

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



/*
2.	Desarrolle una sentencia SELECT para encontrar el mayor y menor sueldo 
en el departamento de ventas. Base de datos RH.
*/

SELECT * FROM RH.DBO.departamento;
GO

-- 103	Ventas	U01

SELECT 
	MAX(SUELDO) AS "MAYOR SUELDO",
	MIN(SUELDO) AS "MENOR SUELDO"
FROM RH.DBO.empleado
WHERE iddepartamento = 103;
GO


/*
3.	Desarrolle una sentencia SELECT para encontrar el salario promedio en la empresa. 
Base de datos RH.
*/

SELECT 
	AVG(SUELDO) AS "SUELDO PROMEDIO"
FROM RH.DBO.empleado;
GO


/*  CASO DE LA VIDA REAL */

create table notas(
	idalu int not null,
	tipo  varchar(10) not null,
	nota int null,
	constraint pk_notas primary key (idalu, tipo)
);
go

insert into notas values( 1, 'PC1', 20 );
insert into notas values( 1, 'PC2', null );
insert into notas values( 1, 'PC3', null );
insert into notas values( 1, 'PC4', null );
go

insert into notas values( 2, 'PC1', 18 );
insert into notas values( 2, 'PC2', 15 );
insert into notas values( 2, 'PC3', null );
insert into notas values( 2, 'PC4', null );
go

insert into notas values( 3, 'PC1', 14 );
insert into notas values( 3, 'PC2', 15 );
insert into notas values( 3, 'PC3', 10 );
insert into notas values( 3, 'PC4', 10 );
go


select * from notas where idalu = 1;
go

select avg(nota) promedio
from notas 
where idalu = 2;
go

select avg(isnull(nota,0)) promedio
from notas 
where idalu = 1;
go


/*  CASO DE LA VIDA REAL */

/*
4.	Desarrolle una sentencia SELECT para encontrar los departamentos que tienen 
por lo menos un trabajador. Base de datos RH.
*/

select * from rh.dbo.departamento
where iddepartamento in (select iddepartamento from rh.dbo.empleado);
go

select distinct d.* 
from rh.dbo.departamento d 
join rh.dbo.empleado e on d.iddepartamento = e.iddepartamento;
go


select d.* 
from rh.dbo.departamento d 
join (select distinct iddepartamento from rh.dbo.empleado) e on d.iddepartamento = e.iddepartamento;
go


with
v1 as (select distinct iddepartamento from rh.dbo.empleado)
select d.* 
from rh.dbo.departamento d 
join v1 on d.iddepartamento = v1.iddepartamento;
go

with
v1 as (select distinct iddepartamento from rh.dbo.empleado)
select d.* 
from rh.dbo.departamento d 
where iddepartamento in (select iddepartamento from v1);
go


/*
GROUP BY
Sirve para hacer resumenes por grupos y subgrupos.
*/

select idalu, avg(isnull(nota,0)) promedio
from notas 
group by idalu;
go

/*
5.	Desarrolle una sentencia SELECT para encontrar el salario promedio 
por departamento. Base de datos RH.
*/

select iddepartamento, avg(sueldo) "sueldo promedio"
from rh.dbo.empleado
group by iddepartamento;
go


/* 
RETO
Cuál es el departamento con menor salario promedio 
*/

/*
6.	Desarrolle una sentencia SELECT para encontrar la cantidad 
de trabajadores por departamento. Base de datos RH.
*/

select iddepartamento, count(1) "Cantidad de Trabajadores"
from rh.dbo.empleado
group by iddepartamento;
go

select iddepartamento, sum(1) "Cantidad de Trabajadores"
from rh.dbo.empleado
group by iddepartamento;
go

select iddepartamento, count(idempleado) "Cantidad de Trabajadores"
from rh.dbo.empleado
group by iddepartamento;
go

/* no es una solución validad */
select iddepartamento, count(comision) "Cantidad de Trabajadores"
from rh.dbo.empleado
group by iddepartamento;
go

/*
7.	Desarrolle una sentencia SELECT para encontrar los departamentos 
que tienen más de 5 trabajadores. Base de datos RH.

SINTAXIS GENERAL

SELECT col1, col2, ..., func1(), func2(), ...
FROM <tablas>
WHERE <filtro de filas>
GROUP BY col1, col2, ...
HAVING <filtro de grupo>
ORDER BY col1, col2, ...

*/

select iddepartamento, sum(1) "Cantidad de Trabajadores"
from rh.dbo.empleado
group by iddepartamento
having sum(1) > 5;
go


/*
8.	Desarrolle una sentencia SELECT para encontrar el importe recaudado por curso. 
Base de datos EDUCA.
*/

select * from educa.dbo.PAGO;
go

select cur_id, sum(pag_importe) "IMPORTE RECAUDADO"
from educa.dbo.pago
group by cur_id;
go

select cur_id, sum(pag_importe) "IMPORTE RECAUDADO"
from educa.dbo.pago
group by rollup( cur_id );
go

/*
Uso de los operadores ROLLUP, CUBE y GROUPING SETS.
Subtotales de los resumenes de datos.
*/

/*
9.	Desarrolle una sentencia SELECT para encontrar 
los ingresos por mes y los ingresos totales. 
Base de datos EDUCA.
Aplique: GROUP BY ROLLUP ( A, B, . . . )
*/

select * from educa.dbo.PAGO;
go

select month(pag_fecha) mes, sum(pag_importe) "INGRESOS"
from educa.dbo.PAGO 
group by rollup (month(pag_fecha));
go


/*
10.	Desarrolle una sentencia SELECT para encontrar el importe 
de la planilla por cargo en cada departamento, el total por cargo,
el total por departamento y el total general. Base de datos RH

Aplique: GROUP BY ROLLUP ( A, B, . . . )
*/

select iddepartamento, idcargo, sum(sueldo) planilla
from rh.dbo.empleado
group by rollup( iddepartamento, idcargo )
UNION
select iddepartamento, idcargo, sum(sueldo) planilla
from rh.dbo.empleado
group by rollup( idcargo, iddepartamento );
go


/*
11.	Desarrolle una sentencia SELECT para encontrar el importe de la 
planilla por cargo y departamento, encontrando resúmenes por todas las 
combinaciones posibles de estos datos. Base de datos RH.
Aplique: GROUP BY CUBE ( A, B, . . . )
*/

select iddepartamento, idcargo, sum(sueldo) planilla
from rh.dbo.empleado
group by cube( iddepartamento, idcargo )
order by 1, 2;
go


/*
12.	Desarrolle una sentencia SELECT para encontrar el importe de la 
planilla por cada cargo, y el importe de la planilla por cada departamento. 
Base de datos RH.
Aplique: GROUP BY GROUPING SETS ( A, B, . . . )
*/

select iddepartamento, idcargo, sum(sueldo) planilla
from rh.dbo.empleado
group by GROUPING SETS( (iddepartamento, idcargo), (iddepartamento), () )
order by 1, 2;
go


