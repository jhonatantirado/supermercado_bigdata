create or replace PROCEDURE procesa_ventas 
IS 
vTotal total_venta.total_soles%TYPE; 
vAño fecha.año%TYPE; 
vMes fecha.mes%TYPE; 
vDia fecha.dia%TYPE; 
vHora fecha.hora%TYPE; 
vTipoProducto producto.tipo_producto%TYPE;
vTotalSoles total_venta.total_soles%TYPE;
vTotalDolares total_venta.total_dolares%TYPE;
vNombreTienda tienda.nombre%TYPE; 
vNombreCliente cliente.nombre%TYPE; 
vNombreProducto producto.nombre%TYPE;
vFecha fecha.fecha%TYPE;
vDistrito distrito.distrito%TYPE;
vNombreDistrito distrito.nombre%TYPE;
vTipoCambio NUMBER(5,2) := 3.32;
CURSOR tot 
	IS SELECT DISTINCT tienda, cliente, producto FROM venta WHERE procesado = 'N'; 
CURSOR ven ( pTienda tienda.tienda%TYPE, pCliente cliente.cliente%TYPE, pProducto producto.producto%TYPE ) 
	IS SELECT * FROM venta WHERE procesado = 'N' AND tienda = pTienda; 

BEGIN 
	
	FOR t IN tot LOOP 
		BEGIN 
			-- Retiene la filas para evitar que otro proceso --------------------- 
			-- actualice las tablas durante la transacción en curso -------------- 
			SELECT nombre, distrito INTO vNombreTienda, vDistrito FROM tienda WHERE tienda = t.tienda FOR UPDATE NOWAIT; 
			SELECT nombre INTO vNombreCliente FROM cliente WHERE cliente = t.cliente FOR UPDATE NOWAIT; 
			SELECT nombre, tipo_producto INTO vNombreProducto, vTipoProducto FROM producto WHERE producto = t.producto FOR UPDATE NOWAIT;			
			SELECT nombre INTO vNombreDistrito FROM distrito WHERE distrito = vDistrito FOR UPDATE NOWAIT;
			---------------------------------------------------------------------- 
			
			FOR v IN ven ( t.tienda, t.cliente, t.producto ) LOOP 
				vTotal := v.precio * v.cantidad; 
				vAño := TO_NUMBER ( TO_CHAR ( v.fecha, 'YYYY' ) ); 
				vMes := TO_NUMBER ( TO_CHAR ( v.fecha, 'MM' ) ); 
				vDia := TO_NUMBER ( TO_CHAR ( v.fecha, 'DD' ) ); -- Actualiza total tienda 
				vHora := TO_NUMBER ( TO_CHAR ( v.fecha, 'HH24' ) ); -- Actualiza total tienda 
				
				SELECT fecha INTO vFecha FROM fecha WHERE año = vAño AND mes = vMes AND dia = vDia AND hora = vHora;	-- busca la fecha 
				
				-- Actualiza total venta --------------------------------------- 
				IF v.moneda = 'PEN' THEN
					vTotalSoles := vTotal;
					vTotalDolares := vTotal/vTipoCambio;
				ELSE
					vTotalSoles := vTotal * vTipoCambio;
					vTotalDolares := vTotal;
				END IF;
				
				UPDATE total_venta SET total_soles = total_soles + vTotalSoles, total_dolares = total_dolares + vTotalSoles , cantidad = cantidad + v.cantidad 
				WHERE tienda = v.tienda AND cliente = v.cliente AND producto = v.producto AND tipo_producto = vTipoProducto AND distrito = vDistrito  AND fecha = vFecha;				
				IF SQL%NOTFOUND THEN 
					INSERT INTO total_venta ( tienda, cliente, producto, fecha, tipo_producto, distrito, nombre_tienda, nombre_cliente, nombre_producto, total_soles, total_dolares, cantidad ) 
					VALUES ( v.tienda, v.cliente, v.producto, vFecha, vTipoProducto, vDistrito, vNombreTienda, vNombreCliente, vNombreProducto, vTotalSoles, vTotalDolares, v.cantidad ); 
				END IF; 
				------------------------------------------------------------------- 
				UPDATE venta SET procesado = 'S' WHERE venta = v.venta; 
			END LOOP; 
			COMMIT; 
		EXCEPTION 
			WHEN TIMEOUT_ON_RESOURCE OR NO_DATA_FOUND THEN 
				NULL; 
		END; 
	END LOOP; 
END;