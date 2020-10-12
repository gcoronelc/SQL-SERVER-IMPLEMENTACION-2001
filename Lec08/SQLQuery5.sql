/*
1.	
Crear una tabla que contenga la siguiente información:
	- Código de departamento
	- Nombre del departamento
	- Importe de planilla
	- Importe de planilla proyectada con un aumento de 15%
Base de datos a utilizar: RH.
*/

-- Annia Huaman
select e.idempleado, e.apellido, e.nombre, j.nombre,d.nombre,((j.sueldo*0.15)+j.sueldo) planilla
from rh.dbo.empleado E 
join rh.dbo.empleado J on e.jefe = j.idempleado
join rh.dbo.departamento d on e.iddepartamento=d.iddepartamento;
go 

-- Yerson Soberon
SELECT D.iddepartamento, D.nombre,(E.SUELDO+ISNULL(E.comision,0)) IMPORTE,
((E.SUELDO+ISNULL(E.comision,0))*1.15) 'PLANILLA PROYECTADA' 
FROM RH..departamento D 
INNER JOIN RH..empleado E ON D.iddepartamento=E.iddepartamento
GO


-- Miguel Arenas
select d.iddepartamento,d.nombre,sum(e.sueldo),sum(e.sueldo+(e.sueldo*0.15))  from departamento d
left join empleado e
	on e.iddepartamento=d.iddepartamento
left join cargo c
	on c.idcargo=e.idcargo
group by d.iddepartamento,d.nombre,e.sueldo;
go


select 
	d.iddepartamento, d.nombre, 
	sum(e.sueldo) planilla,
	sum(e.sueldo*1.15) planilla_proy
into rh.dbo.planilla
from rh.dbo.departamento d
join rh.dbo.empleado e on d.iddepartamento = e.iddepartamento
group by d.iddepartamento, d.nombre;
go

select * from rh.dbo.planilla;
go


/*
2.	
En una sola consulta combine los datos de los alumnos y profesores de la base de datos EDUTEC. 
La información a mostrar es:
- Categoría: Puede ser alumno o Profesor
- Nombre: debe ser el nombre del alumno o profesor
*/

select 'ALUMNO' tipo, IdAlumno codigo, ApeAlumno apellido, NomAlumno nombre
from EDUTEC.dbo.alumno
UNION
select 'PROFESOR' tipo, IdProfesor, ApeProfesor, NomProfesor 
from edutec.dbo.Profesor;
go



/*
3.	
Desarrolle una consulta para averiguar quiénes son los trabajadores 
que tienen el sueldo más bajo. Base de datos RH.
*/

-- Juan Durand
select * from empleado
where sueldo = (select min(sueldo) from empleado);
go

select top 1 with ties * from empleado
order by sueldo ASC;
go

-- Miguel Arenas
select 
	d.iddepartamento, d.nombre,e.nombre,
	min(e.sueldo) as 'Sueldo menor'
from rh.dbo.departamento d
join rh.dbo.empleado e on d.iddepartamento = e.iddepartamento
group by d.iddepartamento, d.nombre,e.nombre
go


/*
5.	
Desarrolle una consulta que muestre el listado de los profesores. Base de datos EDUCA.
*/

select distinct cur_profesor from educa.dbo.curso;
go


-- CTE
with v1 as (select min(sueldo) sueldo_min from empleado)
select e.* 
from empleado e
join v1 on e.sueldo = v1.sueldo_min;
go


/*
7.	
Encontrar el empleado que tiene el menor salario por departamento. Base de datos RH.
*/

with 
v1 as (
	select iddepartamento, min(sueldo) sueldo 
	from rh.dbo.empleado group by iddepartamento
)
select * 
from rh.dbo.empleado e
join v1 on e.iddepartamento = v1.iddepartamento
and e.sueldo = v1.sueldo;
go


/*
8.	Realice una consulta que califique la nota de cada alumno según el siguiente cuadro:
		Nota	Calificación
		[ 0, 10>	Malo
		[10, 14>	Regular
		[14, 18>	Bueno
		[18,20]	Excelente
Base de datos EDUCA.
*/


SELECT C.cur_nombre CURSO, A.alu_nombre, M.mat_nota,
	CASE WHEN M.mat_nota>= 0 AND M.MAT_NOTA < 10 then  'Malo'
	     WHEN M.mat_nota>= 10 AND M.MAT_NOTA < 14 then  'Regular'
		 WHEN M.mat_nota>= 14 AND M.MAT_NOTA < 18 then  'Bueno'
		 WHEN M.mat_nota>= 18 AND M.MAT_NOTA <= 20 then  'Excelente'
		 else 'NO SE SABE' END Calificacion
FROM EDUCA.DBO.ALUMNO A
JOIN EDUCA.DBO.MATRICULA M ON A.alu_id = M.alu_id
JOIN EDUCA.DBO.CURSO C ON M.cur_id = M.cur_id;

/*
6.	Encontrar el ingreso por mes de cada curso. Base de datos EDUCA.
*/


create view dbo.v_prueba
as
	select 
		cur_id curso,
		MONTH(pag_fecha) mes,
		pag_importe importe
	from educa.dbo.PAGO
go
	
select curso, [1] as Enero,[2] as Febrero,[3] as MArzo,[4] as Abril, [5] as Mayo, 
[6] as Junio, [7] as Julio, [8] as Agosto, [9] as Setiembre, [10] as Octubre,
[11] Noviembre, [12] Diciembre
from (select curso, mes, importe 	from v_prueba) datos
pivot( sum(importe) for mes in ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])) as piv
go

