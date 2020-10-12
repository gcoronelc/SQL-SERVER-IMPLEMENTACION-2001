-- Subconsulta escalar
-- Retorna un solo valor

-- Los empleados que sy sueldo es menor el sueldo promedio.

select * from rh.dbo.empleado
where sueldo < (select avg(sueldo) from rh.dbo.empleado);
go

-- Como tabla derivada.
-- La subconsulta se utiliza como una tabla en el FROM

-- Los empleados que su sueldo es menor al sueldo promedio en su departamento.

print convert(varchar,getdate(),109)
select * 
from rh.dbo.empleado e
join (select iddepartamento, avg(sueldo) sueldo_prom 
	  from rh.dbo.empleado group by iddepartamento) t
on e.iddepartamento = t.iddepartamento 
and e.sueldo < t.sueldo_prom;
print convert(varchar,getdate(),109)
go

-- Subconsulta correlacionada
-- Hace uso de columnas de la consulta externa.


-- Los empleados que su sueldo es menor al sueldo promedio en su departamento.

print convert(varchar,getdate(),109)
select * 
from rh.dbo.empleado e
where sueldo < ( select avg(sueldo) sueldo_prom 
				 from rh.dbo.empleado t
				 where t.iddepartamento = e.iddepartamento );
print convert(varchar,getdate(),109)
go

-- Subconsulta con el operador IN


select * from rh.dbo.ubicacion;
go

-- Empleados que trabajan  en Lima

select * from rh.dbo.empleado
where iddepartamento not in (
	select d.iddepartamento
	from rh.dbo.ubicacion u
	join rh.dbo.departamento d on u.idubicacion = d.idubicacion
	where u.ciudad = 'Lima'
);


-- Departamentos que no tienen empleados

select * from rh.dbo.departamento d
where not exists (select 1 from rh.dbo.empleado e where d.iddepartamento = e.iddepartamento);
go









				 


