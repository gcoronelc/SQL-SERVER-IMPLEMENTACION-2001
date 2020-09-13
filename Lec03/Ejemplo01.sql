CREATE DATABASE TIENDA;
GO


USE tienda
GO


CREATE SCHEMA [MAESTROS]
GO


CREATE TABLE maestros.articulo (
	art_id INT NOT NULL IDENTITY(1,1),
	art_nombre VARCHAR(100) NOT NULL,
	art_pre_costo MONEY NOT NULL,
	art_pre_venta MONEY NOT NULL,
	art_stock INT NOT NULL
)
GO


ALTER TABLE MAESTROS.ARTICULO 
ADD CONSTRAINT PK_ARTICULO 
PRIMARY KEY( art_id );
GO


INSERT INTO MAESTROS.ARTICULO (art_nombre, art_pre_costo, art_pre_venta, art_stock)
VALUES( 'TELEVISOR DE 50 PULG', 790.0, 1799.0, 600 );
GO

SELECT * FROM MAESTROS.ARTICULO;
GO


INSERT INTO MAESTROS.ARTICULO (ART_ID, art_nombre, art_pre_costo, art_pre_venta, art_stock)
VALUES( 1, 'TELEVISOR DE 50 PULG', 790.0, 1799.0, 600 );
GO

/*
Msg 544, Level 16, State 1, Line 37
No se puede insertar un valor explícito en la columna de identidad 
de la tabla 'articulo' cuando IDENTITY_INSERT es OFF.
*/



SET IDENTITY_INSERT MAESTROS.ARTICULO ON
GO

INSERT INTO MAESTROS.ARTICULO (ART_ID, art_nombre, art_pre_costo, art_pre_venta, art_stock)
VALUES( 1, 'TELEVISOR DE 50 PULG', 790.0, 1799.0, 600 );
GO

/*
Msg 2627, Level 14, State 1, Line 39
Infracción de la restricción PRIMARY KEY 'PK_ARTICULO'. 
No se puede insertar una clave duplicada en el objeto 'MAESTROS.articulo'. 
El valor de la clave duplicada es (1).
Se terminó la instrucción.
*/


INSERT INTO MAESTROS.ARTICULO (ART_ID, art_nombre, art_pre_costo, art_pre_venta, art_stock)
VALUES( 2, 'TELEVISOR DE 50 PULG', 790.0, 1799.0, 600 );
GO

SELECT * FROM MAESTROS.ARTICULO;
GO

DELETE FROM MAESTROS.ARTICULO WHERE ART_ID = 2;
GO


SET IDENTITY_INSERT MAESTROS.ARTICULO OFF
GO





