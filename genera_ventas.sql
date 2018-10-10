create or replace PROCEDURE genera_ventas 
IS 
vTienda tienda.tienda%TYPE; 
vCliente cliente.cliente%TYPE; 
vProducto producto.producto%TYPE; 
vTiendaMax tienda.tienda%TYPE; 
vClienteMax cliente.cliente%TYPE; 
vProductoMax producto.producto%TYPE; 
vMonedaNum NUMBER(2);
vMonedaDesc venta.moneda%TYPE;
vCantidad venta.cantidad%TYPE;
vPrecio venta.precio%TYPE;
vFechaIni DATE := TO_DATE ( '01012017', 'DDMMYYYY' ); 
vFechaFin DATE := TRUNC ( SYSDATE ); 
vFecha DATE;
vHora NUMBER(2);
BEGIN 
	DBMS_RANDOM.initialize ( TO_NUMBER ( TO_CHAR ( SYSDATE, 'HH24MMSS' ) ) ); 
	SELECT MAX ( tienda ) INTO vTiendaMax FROM tienda; 
	SELECT MAX ( cliente ) INTO vClienteMax FROM cliente; 
	SELECT MAX ( producto ) INTO vProductoMax FROM producto; 
	
	FOR i IN 1..200000 LOOP 
		
		vTienda := 1 + ABS ( MOD ( DBMS_RANDOM.random, vTiendaMax ) ); 
		vCliente := 1 + ABS ( MOD ( DBMS_RANDOM.random, vClienteMax ) ); 
		vProducto := 1 + ABS ( MOD ( DBMS_RANDOM.random, vProductoMax ) );
		vMonedaNum := 1 + ABS ( MOD ( DBMS_RANDOM.random, 2 ));
		IF vMonedaNum = 1 THEN
			vMonedaDesc := 'PEN';
		ELSE
			vMonedaDesc := 'USD';
		END IF;
		vCantidad := 1 + ABS ( MOD ( DBMS_RANDOM.random, 10 ));
		vFecha := vFechaIni + ABS ( MOD ( DBMS_RANDOM.random, vFechaFin - vFechaIni ));
		vHora := 8 + ABS ( MOD ( DBMS_RANDOM.random, 13 )); -- de 8 a 20 hrs...
		
		SELECT TO_DATE( TO_CHAR(vFecha,'DD/MM/YYYY')||' '|| vHora||':00:00' ,'DD/MM/YYYY HH24:MI:SS') INTO vFecha FROM DUAL;
		
		INSERT INTO venta ( cliente, producto, tienda, precio, fecha, cantidad, moneda ) 
		SELECT vCliente, vProducto, vTienda, precio, vFecha, vCantidad, vMonedaDesc
		FROM producto 
		WHERE producto = vProducto; 
	END LOOP; 
COMMIT;
END;