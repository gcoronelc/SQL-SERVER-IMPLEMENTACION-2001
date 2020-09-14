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

/*
* CLAVE PRIMARIA
*/

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

/*
* RESTRICCIÓN TIPO: UNIQUE
*/


ALTER TABLE MAESTROS.ARTICULO
ADD CONSTRAINT U_ARTICULO_NOMBRE
UNIQUE ( ART_NOMBRE );
GO

INSERT INTO MAESTROS.ARTICULO (art_nombre, art_pre_costo, art_pre_venta, art_stock)
VALUES( 'TELEVISOR DE 50 PULG', 790.0, 1799.0, 600 );
GO

/*
Msg 2627, Level 14, State 1, Line 92
Infracción de la restricción UNIQUE KEY 'U_ARTICULO_NOMBRE'. 
No se puede insertar una clave duplicada en el objeto 'MAESTROS.articulo'. 
El valor de la clave duplicada es (TELEVISOR DE 50 PULG).
Se terminó la instrucción.
*/

INSERT INTO MAESTROS.ARTICULO (art_nombre, art_pre_costo, art_pre_venta, art_stock)
VALUES( 'LAPTOP', 570.0, 1300.0, 200 );
GO

SELECT * FROM MAESTROS.ARTICULO;
GO


/*
* Restricción tipo CHECK
*/

ALTER TABLE MAESTROS.ARTICULO 
ADD CONSTRAINT CHK_ARTICULO_PRE_COSTO
CHECK ( ART_PRE_COSTO > 0.0 );
GO

ALTER TABLE MAESTROS.ARTICULO 
ADD CONSTRAINT CHK_ARTICULO_STOCK
CHECK ( ART_STOCK >= 0 );
GO


INSERT INTO MAESTROS.ARTICULO (art_nombre, art_pre_costo, art_pre_venta, art_stock)
VALUES( 'IMPRESORA', 0, 350.0,	-300 );
GO

/*
Msg 547, Level 16, State 0, Line 127
Instrucción INSERT en conflicto con la restricción CHECK 'CHK_ARTICULO_PRE_COSTO'. 
El conflicto ha aparecido en la base de datos 'TIENDA', 
tabla 'MAESTROS.articulo', column 'art_pre_costo'.
Se terminó la instrucción.
*/


INSERT INTO MAESTROS.ARTICULO (art_nombre, art_pre_costo, art_pre_venta, art_stock)
VALUES( 'IMPRESORA', 175.0, 350.0,	-300 );
GO

/*
Msg 547, Level 16, State 0, Line 140
Instrucción INSERT en conflicto con la restricción CHECK 'CHK_ARTICULO_STOCK'. 
El conflicto ha aparecido en la base de datos 'TIENDA', tabla 'MAESTROS.articulo', column 'art_stock'.
Se terminó la instrucción.
*/

INSERT INTO MAESTROS.ARTICULO (art_nombre, art_pre_costo, art_pre_venta, art_stock)
VALUES( 'IMPRESORA', 175.0, 350.0,	300 );
GO

SELECT * FROM MAESTROS.ARTICULO;
GO





