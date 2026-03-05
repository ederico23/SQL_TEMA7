--ESTUDIO TEMA 7

/*1) Mostrar los nombres de todos nuestros proveedores*/
SELECT NOMBRE
FROM PROVEEDORES;

/*2) Mostrar el nombre y el precio de cada uno de nuestros productos.*/
SELECT NOMBRE, PRECIO_VENTA
FROM PRODUCTOS;

/*3) ¿De qué provincias son nuestros clientes? (Que no se repitan las provincias en el resultado
de la consulta).*/
SELECT DISTINCT  PROVINCIA
FROM CLIENTES;

/*4) Mostrar toda la información de nuestros empleados.*/
SELECT *
FROM EMPLEADOS;

/*5) Muestra las ciudades de nuestros proveedores en orden alfabético junto con los nombres
de los proveedores con los que trabajamos en cada ciudad.*/
SELECT NOMBRE, CIUDAD
FROM PROVEEDORES
ORDER BY CIUDAD ASC;

/*6) Haz un listado de la página web de cada uno de nuestros proveedores con el siguiente
formato (no hay que mostrar los datos en caso de que no tengan página web).
http://www.shinoman.com/ es la pag web de Shinoman, Incorporated*/
SELECT NOMBRE, PAG_WEB
FROM PROVEEDORES
WHERE PAG_WEB IS NOT NULL;

/*7) ¿Cuántos días cuesta el envío de cada pedido?*/
SELECT NUMERO_PEDIDO, FECHA_ENVIO - FECHA_PEDIDO || ' dias' AS "FECHA PEDIDO"
FROM PEDIDOS;

/*8) ¿Cuál es el valor de inventario de cada producto? (El valor de inventario es lo que cuesta
cada producto por el stock que hay en la tienda)*/
SELECT NOMBRE, PRECIO_VENTA * STOCK || ' € ' AS INVENTARIO
FROM PRODUCTOS;

/*9) Mostrar el precio de cada producto reducido en un 5%*/
SELECT NOMBRE, PRECIO_VENTA * (5/100) AS "PRECIO -5%"
FROM PRODUCTOS;

/*10) Mostrar la lista de los pedidos que han hecho nuestros clientes en orden descendente de
fecha. Hay que ver los pedidos de cada cliente seguidos.*/
SELECT ID_CLIENTE , FECHA_PEDIDO
FROM PEDIDOS
ORDER BY ID_CLIENTE ASC, FECHA_PEDIDO DESC;

/*11) Mostrar la lista de los nombres y direcciones de nuestros proveedores ordenados
alfabéticamente por el nombre del proveedor*/
SELECT NOMBRE, DIRECCION 
FROM PROVEEDORES
ORDER BY NOMBRE ASC;

/*12) Mostrar el nombre y apellido de los clientes cuyo apellido sea Sanz.*/
SELECT NOMBRE, APELLIDOS
FROM CLIENTES 
WHERE APELLIDOS = 'Sanz';

/*13) ¿Cuáles son los nombres de los clientes que viven en la provincia de MADRID?*/
SELECT NOMBRE
FROM CLIENTES
WHERE UPPER(PROVINCIA) = 'MADRID';

/*14) Mostrar el nombre y apellido de los clientes que (una consulta para cada punto):
• viven en la provincia de MADRID
• viven en Belmonte
• tienen como código postal 45915
• que hicieron pedidos en Mayo */

-- Mostrar el nombre y apellido de los clientes que viven en la provincia de MADRID 
SELECT NOMBRE, APELLIDOS
FROM CLIENTES
WHERE UPPER(PROVINCIA) = 'MADRID';

--Mostrar el nombre y apellido de los clientes que viven en Belmonte
SELECT NOMBRE, APELLIDOS
FROM CLIENTES 
WHERE UPPER(CIUDAD) = 'BELMONTE';

--Mostrar el nombre y apellido de los clientes que tienen como código postal 45915
SELECT NOMBRE, APELLIDOS
FROM CLIENTES 
WHERE COD_POSTAL = 45915;

--Mostrar el nombre y apellido de los clientes que que hicieron pedidos en Mayo
SELECT DISTINCT NOMBRE, APELLIDOS
FROM CLIENTES JOIN PEDIDOS  ON CLIENTES, ID_CLIENTE = PEDIDOS.CLIENTE
WHERE TO_CHAR (PEDIDOS.FECHA_PEDIDO, 'MM') = '05';
                    












