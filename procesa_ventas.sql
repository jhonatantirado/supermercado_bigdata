create or replace PROCEDURE procesa_ventas 
IS 
vTotal total_venta.total%TYPE; 
vAño total_venta.año%TYPE; 
vMes total_venta.mes%TYPE; 
vDia total_venta.dia%TYPE; 
vNombreTienda tienda.nombre%TYPE; 
vNombreCliente cliente.nombre%TYPE; 
vNombreProducto producto.nombre%TYPE; 
CURSOR tot 
	IS SELECT DISTINCT tienda, cliente, producto FROM venta WHERE procesado = 'N'; 
CURSOR ven ( pTienda tienda.tienda%TYPE, pCliente cliente.cliente%TYPE, pProducto producto.producto%TYPE ) 
	IS SELECT * FROM venta WHERE procesado = 'N' AND tienda = pTienda; 

BEGIN 
	FOR t IN tot LOOP 
		BEGIN 
			-- Retiene la filas para evitar que otro proceso --------------------- 
			-- actualice las tablas durante la transacción en curso -------------- 
			SELECT nombre INTO vNombreTienda FROM tienda WHERE tienda = t.tienda FOR UPDATE NOWAIT; 
			SELECT nombre INTO vNombreCliente FROM cliente WHERE cliente = t.cliente FOR UPDATE NOWAIT; 
			SELECT nombre INTO vNombreProducto FROM producto WHERE producto = t.producto FOR UPDATE NOWAIT; 
			---------------------------------------------------------------------- 
			
			FOR v IN ven ( t.tienda, t.cliente, t.producto ) LOOP 
				vTotal := v.precio * v.cantidad; 
				vAño := TO_NUMBER ( TO_CHAR ( v.fecha, 'YYYY' ) ); 
				vMes := TO_NUMBER ( TO_CHAR ( v.fecha, 'MM' ) ); 
				vDia := TO_NUMBER ( TO_CHAR ( v.fecha, 'DD' ) ); -- Actualiza total tienda 
				----------------------------------------- 
				UPDATE total_tienda SET total = total + vTotal WHERE tienda = v.tienda; 
				IF SQL%NOTFOUND THEN 
					INSERT INTO total_tienda ( tienda, nombre, total ) VALUES ( v.tienda, vNombreTienda, vTotal ); 
				END IF; 
				------------------------------------------------------------------- 
				-- Actualiza total cliente ---------------------------------------- 
				UPDATE total_cliente SET total = total + vTotal WHERE cliente = v.cliente; 
				IF SQL%NOTFOUND THEN 
					INSERT INTO total_cliente ( cliente, nombre, total ) VALUES ( v.cliente, vNombreCliente, vTotal ); 
				END IF; 
				------------------------------------------------------------------- 
				-- Actualiza total producto --------------------------------------- 
				UPDATE total_producto SET total = total + vTotal , cantidad = cantidad + v.cantidad WHERE producto = v.producto; 
				IF SQL%NOTFOUND THEN 
					INSERT INTO total_producto ( producto, nombre, total, cantidad ) VALUES ( v.producto, vNombreProducto, vTotal, v.cantidad ); 
				END IF; 
				------------------------------------------------------------------- 
				-- Actualiza total venta --------------------------------------- 
				UPDATE total_venta SET total = total + vTotal , cantidad = cantidad + v.cantidad 
				WHERE tienda = v.tienda AND cliente = v.cliente AND producto = v.producto AND año = vAño AND mes = vMes AND dia = vDia; 
				IF SQL%NOTFOUND THEN 
					INSERT INTO total_venta ( tienda, cliente, producto, año, mes, dia, nombre_tienda, nombre_cliente, nombre_producto, total, cantidad ) 
					VALUES ( v.tienda, v.cliente, v.producto, vAño, vMes, vDia, vNombreTienda, vNombreCliente, vNombreProducto, vTotal, v.cantidad ); 
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