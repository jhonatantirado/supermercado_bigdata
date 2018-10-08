DECLARE
	vTipoProductoAbarrotes tipo_producto.tipo_producto%TYPE; 
	vTiendaLaMarina tienda.tienda%TYPE; 
	vTiendaLarco tienda.tienda%TYPE; 
	vProductoArroz producto.producto%TYPE; 
	vProductoAtun producto.producto%TYPE; 
	vTotalSoles total_venta.total_soles%TYPE;
	--vTotalDolares total_venta.total_dolares%TYPE;
BEGIN

SELECT tienda INTO vTiendaLaMarina FROM tienda WHERE NOMBRE='TIENDA SAN MIGUEL MARINA';
SELECT tienda INTO vTiendaLarco FROM tienda WHERE NOMBRE='TIENDA MIRAFLORES LARCO';

SELECT producto INTO vProductoArroz FROM producto WHERE NOMBRE='ARROZ';
SELECT producto INTO vProductoAtun FROM producto WHERE NOMBRE='ATUN';

SELECT tipo_producto INTO vTipoProductoAbarrotes FROM tipo_producto WHERE NOMBRE='ABARROTES';

--SLICE
SELECT SUM(TOTAL_SOLES) INTO vTotalSoles FROM TOTAL_VENTA WHERE tienda = vTiendaLaMarina GROUP BY tienda;
--SELECT SUM(TOTAL_DOLARES) INTO vTotalDolares FROM TOTAL_VENTA WHERE tienda = vTiendaLaMarina GROUP BY tienda;

--DICE
SELECT SUM(TOTAL_SOLES) INTO vTotalSoles FROM TOTAL_VENTA 
WHERE tienda in (vTiendaLaMarina,vTiendaLarco) AND producto in (vProductoArroz,vProductoAtun)
GROUP BY tienda,producto;
--SELECT SUM(TOTAL_DOLARES) INTO vTotalSoles FROM TOTAL_VENTA 
--WHERE tienda in (vTiendaLaMarina,vTiendaLarco) AND producto in (vProductoArroz,vProductoAtun)
--GROUP BY tienda,producto;

--ROLL UP
SELECT SUM(TOTAL_SOLES) INTO vTotalSoles FROM TOTAL_VENTA 
WHERE tienda in (vTiendaLaMarina,vTiendaLarco) AND tipo_producto in (vTipoProductoAbarrotes)
GROUP BY tienda,tipo_producto;

END;