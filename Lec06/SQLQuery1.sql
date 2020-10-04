

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

