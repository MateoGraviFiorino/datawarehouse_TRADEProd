
SELECT 
    VENTAS.DOCUMENTO,
    FECHA,
    ID_CLIENTE,
    ID_VENDEDOR,
    SUCURSAL_ID,
    DETALLE_VENTA.CODIGO_PRODUCTO,
    DETALLE_VENTA.PRECIO_UNITARIO,
    (DETALLE_VENTA.PRECIO_UNITARIO / 795.23) AS Precio_dolar,
    DETALLE_VENTA.CANTIDAD
FROM 
    VENTAS
INNER JOIN 
    DETALLE_VENTA ON VENTAS.DOCUMENTO = DETALLE_VENTA.DOCUMENTO;



--agg cotizcacion
UPDATE dim_moneda
SET cotizacion_dolar = 795.23
WHERE cotizacion_dolar IS NULL;

SELECT * FROM dim_articulos --ANDA
SELECT * FROM dim_Clientes --ANDA
SELECT * FROM dim_fecha --ANDA
SELECT * FROM dim_geografia --ANDA
SELECT * FROM dim_sucursal --ANDA
SELECT * FROM dim_vendedores --ANDA

SELECT * FROM Ventas

SELECT * FROM CLIENTES
SELECT * FROM ClientesSauco
SELECT * FROM ProspectosClientesSauco

