--SLICE
SELECT t.nombre TIENDA,SUM(tv.TOTAL_SOLES) TOTAL_SOLES,SUM(tv.TOTAL_DOLARES)  TOTAL_DOLARES FROM TOTAL_VENTA tv inner join TIENDA T ON T.tienda=TV.tienda
where t.NOMBRE='TIENDA SAN MIGUEL MARINA'
GROUP BY t.nombre;

--VENTAS ANUALES POR TIENDA
SELECT t.nombre TIENDA,F.AÑO,SUM(tv.TOTAL_SOLES) TOTAL_SOLES,
SUM(tv.TOTAL_DOLARES)  TOTAL_DOLARES FROM TOTAL_VENTA tv 
inner join TIENDA T ON T.tienda=TV.tienda
inner join FECHA F ON F.FECHA=TV.FECHA
GROUP BY t.nombre,F.AÑO;

--DICE
SELECT t.nombre TIENDA,p.nombre PRODUCTO,SUM(tv.TOTAL_SOLES) TOTAL_SOLES,SUM(tv.TOTAL_DOLARES)  TOTAL_DOLARES 
FROM TOTAL_VENTA tv inner join TIENDA T ON T.tienda=TV.tienda
inner join PRODUCTO P ON P.producto=TV.producto
where t.NOMBRE IN ('TIENDA SAN MIGUEL MARINA','TIENDA MIRAFLORES LARCO') AND p.nombre IN ('ARROZ','ATUN')
GROUP BY t.nombre,p.nombre
ORDER BY t.nombre,p.nombre;

SELECT t.nombre TIENDA,p.nombre PRODUCTO,SUM(tv.TOTAL_SOLES) TOTAL_SOLES,SUM(tv.TOTAL_DOLARES)  TOTAL_DOLARES 
FROM TOTAL_VENTA tv inner join TIENDA T ON T.tienda=TV.tienda
inner join PRODUCTO P ON P.producto=TV.producto
inner join CLIENTE C ON C.cliente=TV.cliente
where t.NOMBRE IN ('TIENDA SAN MIGUEL MARINA') AND p.nombre IN ('ARROZ')
AND c.nombre='JHONATAN TIRADO'
GROUP BY t.nombre,p.nombre
ORDER BY t.nombre,p.nombre;

--ROLL UP
SELECT t.nombre TIENDA,tp.nombre TIPO_PRODUCTO,SUM(tv.TOTAL_SOLES) TOTAL_SOLES,SUM(tv.TOTAL_DOLARES)  TOTAL_DOLARES 
FROM TOTAL_VENTA tv inner join TIENDA T ON T.tienda=TV.tienda
inner join TIPO_PRODUCTO TP ON TP.TIPO_PRODUCTO=TV.TIPO_PRODUCTO
where t.NOMBRE IN ('TIENDA SAN MIGUEL MARINA','TIENDA MIRAFLORES LARCO') AND TP.nombre IN ('LACTEOS','CARNES')
GROUP BY t.nombre,tp.nombre
ORDER BY t.nombre,tp.nombre;

--DRILL DOWN
SELECT t.nombre TIENDA,p.nombre PRODUCTO,SUM(tv.TOTAL_SOLES) TOTAL_SOLES,SUM(tv.TOTAL_DOLARES)  TOTAL_DOLARES 
FROM TOTAL_VENTA tv inner join TIENDA T ON T.tienda=TV.tienda
inner join PRODUCTO P ON P.producto=TV.producto
where t.NOMBRE IN ('TIENDA SAN MIGUEL MARINA','TIENDA MIRAFLORES LARCO')
GROUP BY t.nombre,p.nombre
ORDER BY t.nombre,p.nombre;