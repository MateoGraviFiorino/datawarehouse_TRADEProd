CREATE TABLE dim_geografia(
Ciudad NVARCHAR(255) NOT NULL PRIMARY KEY,
Provincia NVARCHAR(255),
Region NVARCHAR(255)
)
CREATE TABLE dim_Clientes(
ID_Cliente NVARCHAR(255) NOT NULL PRIMARY KEY,
Edad SMALLINT,
Residencia NVARCHAR(255),
Estado_Civil NVARCHAR(255),
--FOREIGN KEY (Residencia) REFERENCES dim_geografia(Ciudad)
)


CREATE TABLE dim_vendedores(
ID_Vendedor SMALLINT NOT NULL PRIMARY KEY,
Tipo_Cap NVARCHAR(255),
Horas_Cap SMALLINT
)

CREATE TABLE dim_articulos(
COD_Prod NVARCHAR(255) NOT NULL PRIMARY KEY,
Nombre_Prod NVARCHAR(255),
Fam_Prod NVARCHAR(255)
)

CREATE TABLE dim_sucursal(
ID_Sucursal SMALLINT NOT NULL PRIMARY KEY,
Nombre_Sucursal NVARCHAR(255),
Ciudad NVARCHAR(255),
FOREIGN KEY (Ciudad) REFERENCES dim_geografia(Ciudad)
)

CREATE TABLE dim_fecha(
FECHA DATETIME NOT NULL PRIMARY KEY,
DIA INT,
MES INT,
ANIO INT
)

CREATE TABLE dim_moneda(
Fecha DATETIME NOT NULL PRIMARY KEY,
Cotizacion MONEY NULL,
FOREIGN KEY (Fecha) REFERENCES Dim_Fecha(Fecha))

CREATE TABLE Ventas(
ID_Venta NVARCHAR(255) NOT NULL,
ID_Cliente NVARCHAR(255),
ID_Vendedor SMALLINT,
COD_Prod NVARCHAR(255) NOT NULL,
ID_Sucursal SMALLINT,
Precio_Unitario INT not null,
Cantidad INT not null,
Fecha DATETIME not null,
CONSTRAINT PK_Ventas PRIMARY KEY (ID_Venta, COD_Prod),
FOREIGN KEY(ID_Cliente) REFERENCES dim_Clientes(ID_Cliente),
FOREIGN KEY(ID_Vendedor) REFERENCES dim_vendedores(ID_Vendedor),
FOREIGN KEY(COD_Prod) REFERENCES dim_articulos(COD_Prod),
FOREIGN KEY(ID_Sucursal) REFERENCES dim_sucursal(ID_Sucursal),
FOREIGN KEY(FECHA) REFERENCES dim_fecha(FECHA),
)


ALTER TABLE dim_articulos NOCHECK CONSTRAINT ALL
ALTER TABLE dim_Clientes NOCHECK CONSTRAINT ALL
ALTER TABLE dim_fecha NOCHECK CONSTRAINT ALL
ALTER TABLE dim_geografia NOCHECK CONSTRAINT ALL
ALTER TABLE dim_sucursal NOCHECK CONSTRAINT ALL
ALTER TABLE dim_vendedores NOCHECK CONSTRAINT ALL
ALTER TABLE dim_moneda NOCHECK CONSTRAINT ALL
ALTER TABLE Ventas NOCHECK CONSTRAINT ALL

SELECT * FROM dim_articulos
SELECT * FROM dim_Clientes
SELECT * FROM dim_fecha
SELECT * FROM dim_geografia
SELECT * FROM dim_sucursal
SELECT * FROM dim_vendedores
SELECT * FROM dim_moneda
SELECT * FROM Ventas

