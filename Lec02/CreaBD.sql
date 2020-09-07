

select * from edutec.dbo.Alumno;
select * from edutec.dbo.Curso;
go


-- crear una bd

CREATE DATABASE bodega
GO


sp_helpdb bodega;
go

USE BODEGA 
GO

CREATE SCHEMA ventas
GO

CREATE SCHEMA compras
GO

CREATE SCHEMA maestros
GO


CREATE TABLE maestros.articulo(
	art_id INT NOT NULL IDENTITY(1,1),
	art_nombre VARCHAR(100) NOT NULL,
	art_precio MONEY NOT NULL,
	CONSTRAINT pk_articulo PRIMARY KEY( art_id)
)
GO


CREATE TABLE compras.articulo(
	art_id INT NOT NULL IDENTITY(1,1),
	art_nombre VARCHAR(100) NOT NULL,
	art_precio MONEY NOT NULL,
	CONSTRAINT pk_articulo PRIMARY KEY( art_id)
)
GO


insert into compras.articulo(art_nombre, art_precio) 
values( 'Carro del Año', 20000 );
go

insert into compras.articulo(art_nombre, art_precio) 
values( 'Auto del Año', 25000 );
go

select * from compras.articulo;
go


