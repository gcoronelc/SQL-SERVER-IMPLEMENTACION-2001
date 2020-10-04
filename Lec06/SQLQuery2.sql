

create table demo(
	id int identity primary key,
	dato varchar(10) 
);
go

select * from demo;
go

insert into demo(dato) values( 'Gustavo' );
go


insert into demo(dato, nota) values( 'Gustavo', 20 );
go

alter table demo
add nota int not null default 0;
go

insert into demo(dato, nota) values( 'Gustavo', 20 );
go

insert into demo(dato) values( 'JOSE MANUEL' );
go

insert into demo(dato) values( 'JOSE' );
go
  

set identity_insert demo on
go

insert into demo(id,dato) values(3, 'JUANA' );
go

insert into demo(id,dato) values(4, 'ZULLY' );
go

set identity_insert demo off
go

select * from demo;
go

insert into demo(id,dato) values(6, 'MARTHA' );
go

insert into demo(dato) values( 'MARTHA' );
go


SELECT * FROM EUREKABANK.DBO.CONTADOR;
GO

SELECT * FROM EUREKABANK.DBO.CLIENTE;
GO

SELECT * FROM EUREKABANK.DBO.EMPLEADO;
GO



