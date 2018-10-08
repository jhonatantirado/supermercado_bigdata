DECLARE
	vFechaIni DATE := TO_DATE ( '01012017', 'DDMMYYYY' ); 
	vFechaFin DATE := TRUNC ( SYSDATE ); 
	vTotalDias NUMBER(18);
	vFecha DATE;
	vAnho NUMBER(4); 
	vMes NUMBER(2); 
	vDia NUMBER(2); 
BEGIN

INSERT INTO DISTRITO(DISTRITO ,NOMBRE) VALUES(SEQ_DISTRITO.NEXTVAL,'SAN MIGUEL');
INSERT INTO DISTRITO(DISTRITO ,NOMBRE) VALUES(SEQ_DISTRITO.NEXTVAL,'MIRAFLORES');
INSERT INTO DISTRITO(DISTRITO ,NOMBRE) VALUES(SEQ_DISTRITO.NEXTVAL,'SAN ISIDRO');
INSERT INTO DISTRITO(DISTRITO ,NOMBRE) VALUES(SEQ_DISTRITO.NEXTVAL,'LA MOLINA');


INSERT INTO TIPO_PRODUCTO (TIPO_PRODUCTO,NOMBRE) VALUES(SEQ_TIPO_PRODUCTO.NEXTVAL,'ABARROTES');
INSERT INTO TIPO_PRODUCTO (TIPO_PRODUCTO,NOMBRE) VALUES(SEQ_TIPO_PRODUCTO.NEXTVAL,'LIMPIEZA');
INSERT INTO TIPO_PRODUCTO (TIPO_PRODUCTO,NOMBRE) VALUES(SEQ_TIPO_PRODUCTO.NEXTVAL,'ROPA');
INSERT INTO TIPO_PRODUCTO (TIPO_PRODUCTO,NOMBRE) VALUES(SEQ_TIPO_PRODUCTO.NEXTVAL,'VERDURAS');
INSERT INTO TIPO_PRODUCTO (TIPO_PRODUCTO,NOMBRE) VALUES(SEQ_TIPO_PRODUCTO.NEXTVAL,'CARNES');
INSERT INTO TIPO_PRODUCTO (TIPO_PRODUCTO,NOMBRE) VALUES(SEQ_TIPO_PRODUCTO.NEXTVAL,'LACTEOS');
INSERT INTO TIPO_PRODUCTO (TIPO_PRODUCTO,NOMBRE) VALUES(SEQ_TIPO_PRODUCTO.NEXTVAL,'GASEOSAS');
INSERT INTO TIPO_PRODUCTO (TIPO_PRODUCTO,NOMBRE) VALUES(SEQ_TIPO_PRODUCTO.NEXTVAL,'CERVEZAS');
INSERT INTO TIPO_PRODUCTO (TIPO_PRODUCTO,NOMBRE) VALUES(SEQ_TIPO_PRODUCTO.NEXTVAL,'EMBUTIDOS');
INSERT INTO TIPO_PRODUCTO (TIPO_PRODUCTO,NOMBRE) VALUES(SEQ_TIPO_PRODUCTO.NEXTVAL,'BEBIDAS');
INSERT INTO TIPO_PRODUCTO (TIPO_PRODUCTO,NOMBRE) VALUES(SEQ_TIPO_PRODUCTO.NEXTVAL,'ELECTRODOMESTICOS');

INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'MARVIN FERNANDEZ','12345678','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'JHONATAN TIRADO','12345679','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'OMAR FERNANDEZ','12345680','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'GUSTAVO OSORIO','12345681','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'CARLOS LOPEZ','12345682','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'MARIO AGREDA','12345683','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'PEDRO SUAREZ','12345684','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'IVAN MADRID','12345685','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'VICTOR MAMANI','12345686','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'BRUNO APAZA','12345687','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'MARCO ALVAREZ','12345688','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'JOSEFINA FERNANDEZ','22345678','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'HAYDEE TIRADO','22345679','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'LUISA FERNANDEZ','22345680','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'MARIA OSORIO','22345681','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'ZOILA LOPEZ','22345682','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'SANDRA AGREDA','22345683','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'FRANCISCA SUAREZ','22345684','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'JOSEFA MADRID','22345685','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'LUISA MAMANI','22345686','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'JUANA APAZA','22345687','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'AMALIA ALVAREZ','22345688','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'MARIA SAAVEDRA','32345678','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'LUPE ZAPATA','32345679','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'LIONEL MESSI','32345680','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'CRISTIANO RONALDO','32345681','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'CESAR VALLEJO','32345682','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'MIGUEL GRAU','32345683','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'FRANCISCO BOLOGNESI','32345684','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'JOSE DE SAN MARTIN','32345685','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'TUPAC AMARU','32345686','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'ALFONSO UGARTE','32345687','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'ANDRES AVELINO CACERES','32345688','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'JAVIER PRADO','42345678','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'JEFFERSON FARFAN','42345679','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'PAOLO GUERRERO','42345680','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'CLAUDIO PIZARRO','42345681','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'EDSON FLORES','42345682','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'CRISTIAN CUEVA','42345683','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'CRISTIAN BENAVENTE','42345684','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'CRISTIAN RAMOS','42345685','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'PEDRO GALLESE','42345686','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'TEOFILO CUBILLAS','42345687','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'CESAR CUETO','42345688','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'JAVIER ARIAS','52345678','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'JULIA FARFAN','52345679','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'MALENA GUERRERO','52345680','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'FRANCISCO PIZARRO','52345681','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'PEDRO FLORES','52345682','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'LOURDES CUEVA','52345683','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'AMAYA BENAVENTE','52345684','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'NADIA RAMOS','52345685','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'TITO GALLESE','52345686','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'OLENKA CUBILLAS','52345687','DNI');
INSERT INTO CLIENTE(CLIENTE ,NOMBRE,NUMERO_DOCUMENTO,TIPO_DOCUMENTO) VALUES(SEQ_CLIENTE.NEXTVAL,'OBED CUETO','52345688','DNI');



INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'ARROZ', 5.8, 1);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'ATUN', 3.5, 1);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'AZUCAR', 6.2, 1);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'FIDEOS', 2.8, 1);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'ACEITE', 7.0, 1);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'JABON', 4.5, 2);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'LEJIA', 2.9, 2);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'DETERGENTE', 22.0, 2);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'ESCOBILLA', 1.5, 2);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'LAVAVAJILLAS', 5.5, 2);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'POLO', 45.9, 3);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'CASACA', 190.0, 3);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'CHOMPA', 140.5, 3);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'PANTALON', 90.2, 3);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'CAMISA', 110.3, 3);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'ZAPALLO', 2.3, 4);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'LIMON', 4.5, 4);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'PAPA', 3.4, 4);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'TOMATE', 2.7, 4);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'CEBOLLA', 1.6, 4);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'CARNE DE RES', 21.9, 5);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'CARNE DE CERDO', 35.9, 5);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'POLLO', 20.8, 5);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'PESCADO', 19.2, 5);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'PAVO', 40.1, 5);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'YOGURT MEDIANO', 40.1, 6);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'LECHE DESLACTOSADA', 40.1, 6);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'QUESO', 40.1, 6);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'MANTEQUILLA', 40.1, 6);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'LECHE DESCREMADA', 40.1, 6);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'INKA COLA', 2.2, 7);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'COCA COLA', 2.2, 7);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'PEPSI', 2.4, 7);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'FANTA', 1.9, 7);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'SPRITE', 2.0, 7);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'CRISTAL', 3.5, 8);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'PILSEN', 3.6, 8);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'CUSQUEÑA', 4.0, 8);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'CORONA', 2.9, 8);
INSERT INTO PRODUCTO(PRODUCTO ,NOMBRE, PRECIO, TIPO_PRODUCTO) VALUES(SEQ_PRODUCTO.NEXTVAL,'BUDWEISER', 3.2, 8);


INSERT INTO TIENDA(TIENDA ,NOMBRE, DISTRITO) VALUES(SEQ_TIENDA.NEXTVAL,'TIENDA SAN MIGUEL MARINA', 1);
INSERT INTO TIENDA(TIENDA ,NOMBRE, DISTRITO) VALUES(SEQ_TIENDA.NEXTVAL,'TIENDA SAN MIGUEL UNIVERSITARIA', 1);
INSERT INTO TIENDA(TIENDA ,NOMBRE, DISTRITO) VALUES(SEQ_TIENDA.NEXTVAL,'TIENDA MIRAFLORES KENNEDY', 2);
INSERT INTO TIENDA(TIENDA ,NOMBRE, DISTRITO) VALUES(SEQ_TIENDA.NEXTVAL,'TIENDA MIRAFLORES LARCO', 2);
INSERT INTO TIENDA(TIENDA ,NOMBRE, DISTRITO) VALUES(SEQ_TIENDA.NEXTVAL,'TIENDA MIRAFLORES BENAVIDES', 2);
INSERT INTO TIENDA(TIENDA ,NOMBRE, DISTRITO) VALUES(SEQ_TIENDA.NEXTVAL,'TIENDA SAN ISIDRO JAVIER PRADO', 3);
INSERT INTO TIENDA(TIENDA ,NOMBRE, DISTRITO) VALUES(SEQ_TIENDA.NEXTVAL,'TIENDA SAN ISIDRO AREQUIPA', 3);
INSERT INTO TIENDA(TIENDA ,NOMBRE, DISTRITO) VALUES(SEQ_TIENDA.NEXTVAL,'TIENDA SAN ISIDRO SALAVERRY', 3);
INSERT INTO TIENDA(TIENDA ,NOMBRE, DISTRITO) VALUES(SEQ_TIENDA.NEXTVAL,'TIENDA LA MOLINA FLORA TRISTAN', 4);
INSERT INTO TIENDA(TIENDA ,NOMBRE, DISTRITO) VALUES(SEQ_TIENDA.NEXTVAL,'TIENDA LA MOLINA FONTANA', 4);




vTotalDias := vFechaFin - vFechaIni;
FOR item IN 1..vTotalDias LOOP
	vFecha := vFechaIni + item;     
	vAnho := TO_NUMBER ( TO_CHAR ( vFecha, 'YYYY' ) ); 
	vMes := TO_NUMBER ( TO_CHAR ( vFecha, 'MM' ) ); 
	vDia := TO_NUMBER ( TO_CHAR ( vFecha, 'DD' ) );
	
	FOR hora IN 8..20 LOOP
		INSERT INTO FECHA VALUES(SEQ_FECHA.NEXTVAL,vAnho,vMes,vDia,hora);
	END LOOP;
END LOOP;

COMMIT;
END;
/

--@E:\JT-Documentos\Maestria\BigData\Supermercado\script_carga_datos_supermercado.sql
--@C:\Users\RicharFV\script_carga_datos_supermercado.sql