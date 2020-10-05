
/*
1.	Desarrolle una sentencia SELECT para obtener un listado que incluya 
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










