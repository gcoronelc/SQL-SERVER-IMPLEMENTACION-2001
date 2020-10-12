
/*
1.	
Desarrolle una sentencia SELECT para obtener un listado que incluya 
el nombre del curso con sus respectivos nombres de alumnos. Base de datos EDUCA.
*/

select c.cur_id, c.cur_nombre, a.alu_id, a.alu_nombre
from educa..CURSO c
inner join educa..MATRICULA m on c.cur_id = m.cur_id
inner join educa..ALUMNO a on m.alu_id = a.alu_id
order by 1, 3;
go


select count(1) from educa..curso;
select count(1) from educa..alumno;
go

select sum( c.cur_precio) "soñando"
from educa..curso c cross join educa..alumno a;
go



/*
2.	
Desarrolle una sentencia SELECT que muestre el nombre del alumno y 
la suma de todos sus pagos. Base de datos EDUCA.

--------------------------------------------------
Nombre del Alumno                Pagos
--------------------------------------------------
Juan                             3000.00
Pedro                            2800.00
. . .
--------------------------------------------------
*/

select a.alu_nombre, sum(p.pag_importe) pagos
from educa.dbo.alumno a
join educa.dbo.pago p on a.alu_id = p.alu_id
group by a.alu_nombre;
go


/*
6.	
Desarrolle una sentencia SELECT para obtener un listado de todos los departamentos 
y la cantidad de trabajadores en cada uno de ellos. Base de datos RH.
*/

select * from rh.dbo.departamento;
go

select d.nombre departamento, count(e.idempleado) empleados
from rh.dbo.departamento d
left join rh.dbo.empleado e on d.iddepartamento = e.iddepartamento
group by d.nombre;
go

select count(*) from rh.dbo.empleado;
go


/*
7.
Desarrolle una sentencia SELECT para obtener todas las posibles combinaciones 
entre las tablas departamento y cargo. Base de datos RH.
*/

select * 
from rh.dbo.departamento
cross join rh.dbo.cargo;


select * 
from rh.dbo.departamento, rh.dbo.cargo;


/*
8.	
Desarrolle una sentencia SELECT para obtener un listado de los empleados con el 
respectivo nombre de su superior inmediato. Base de datos RH.
*/

select * from rh.dbo.empleado;
go


select e.idempleado, e.apellido, e.nombre, j.nombre
from rh.dbo.empleado E 
join rh.dbo.empleado J on e.jefe = j.idempleado;
go



















