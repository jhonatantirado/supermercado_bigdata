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
		
		INSERT INTO venta ( cliente, producto, tienda, precio, fecha, cantidad, moneda ) 
		SELECT vCliente, vProducto, vTienda, precio, 
				vFechaIni + ABS ( MOD ( DBMS_RANDOM.random, vFechaFin - vFechaIni ) ), 
				vCantidad, vMonedaDesc
		FROM producto 
		WHERE producto = vProducto; 
	END LOOP; 
COMMIT;
END;