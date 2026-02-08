select distinct provincia, id_cliente
from clientes;

select nombre, precio_venta, precio_venta*0.85 as precio_descuento
from productos;

select nombre,apellidos, apellidos||', '|| nombre as "nombre completo"
from clientes;

select nombre, apellidos, concat(concat(apellidos, ', '),nombre) as "nombre completo"
from clientes;

select nombre, precio_venta
from productos
where precio_venta<100;

select *
from clientes
where upper(nombre) like 'A%';


select * 
from clientes
order by apellidos ;

-- TAREAS HOJA 1 --
/*1) Mostrar los nombres de todos nuestros proveedores*/
select nombre
from proveedores;


/*2) Mostrar el nombre y el precio de cada uno de nuestros productos.*/
select nombre, precio_venta
from productos;

/*3) ¿De qué provincias son nuestros clientes? (Que no se repitan las provincias en el resultado
de la consulta).*/
select distinct provincia
from clientes;

/*4) Mostrar toda la información de nuestros empleados.*/
select * 
from empleados;

/*5) Muestra las ciudades de nuestros proveedores en orden alfabético junto con los nombres
de los proveedores con los que trabajamos en cada ciudad.*/
select ciudad, nombre
from proveedores
order by ciudad asc; --si no se pone nada, se ordena de manera asc.


/*6) Haz un listado de la página web de cada uno de nuestros proveedores con el siguiente
formato (no hay que mostrar los datos en caso de que no tengan página web).
http://www.shinoman.com/ es la pag web de Shinoman, Incorporated*/
select pag_web ||'es la pagina web de '|| nombre as "pagina de proveedores"
from proveedores
where pag_web is not null;

-- de manera concat: 
--select concat(

/*7) ¿Cuántos días cuesta el envío de cada pedido?*/
select numero_pedido, fecha_envio, fecha_pedido, fecha_envio-fecha_pedido||' dias' as "dias de envio"
from pedidos;

/*8) ¿Cuál es el valor de inventario de cada producto? (El valor de inventario es lo que cuesta
cada producto por el stock que hay en la tienda).*/
select nombre, precio_venta, stock, precio_venta * stock||'€' as "inventario"
from productos;

/*9) Mostrar el precio de cada producto reducido en un 5%.*/
select nombre, precio_venta, precio_venta*0.05 as "precio con descuento"
from productos;

/*10) Mostrar la lista de los pedidos que han hecho nuestros clientes en orden descendente de
fecha. Hay que ver los pedidos de cada cliente seguidos.*/
select id_cliente, fecha_pedido, numero_pedido
from pedidos
order by id_cliente, fecha_pedido desc;

/*11) Mostrar la lista de los nombres y direcciones de nuestros proveedores ordenados
alfabéticamente por el nombre del proveedor.*/
select nombre, direccion
from proveedores
order by nombre;

/*12) Mostrar el nombre y apellido de los clientes cuyo apellido sea Sanz*/
select nombre, apellidos
from clientes
where apellidos = 'Sanz';

--solucion 2: 
select nombre, apellidos
from clientes
where upper(apellidos) = 'Sanz';

/*13) ¿Cuáles son los nombres de los clientes que viven en la provincia de MADRID?*/
select nombre, provincia
from clientes
where upper(provincia) = 'MADRID';

/*14) Mostrar el nombre y apellido de los clientes que (una consulta para cada punto):
• viven en la provincia de MADRID
• viven en Belmonte
• tienen como código postal 45915
• que hicieron pedidos en Mayo*/

--viven en la provincia de MADRID
select nombre, apellidos, provincia
from clientes
where upper(provincia) = 'MADRID';

--viven el Belmonte
select nombre, apellidos, ciudad
from clientes
where ciudad = 'Belmonte';

--tienen codigo postal 45915
select nombre, apellidos, cod_postal
from clientes
where cod_postal = '45915';

--hicieron pedidos en mayo


/*15) ¿Hay pedidos en los que la fecha de envío fue puesta accidentalmente anterior a la fecha de
pedido?*/
select numero_pedido, fecha_pedido - fecha_envio as "errores"
from pedidos;

/*16) Mostrar el nombre y apellidos de los clientes cuyos apellidos empiezan por 'Pe'*/
select nombre, apellidos
from clientes
where apellidos like 'Pe%';


/*17) Mostrar el nombre y dirección de los proveedores cuya dirección incluya la cadena 'del'*/
select nombre, direccion
from proveedores
where direccion like '%del%';

/*18) Listar el nombre y apellidos de los clientes que viven en Somosierra y cuyo apellido empieza
con la letra ‘S’.*/
select nombre, apellidos, ciudad
from clientes
where apellidos like 'S%' and ciudad = 'Somosierra';

/*19) Listar el nombre y apellidos de los clientes que viven en Somosierra o en la provincia de
ORENSE.*/
select nombre, apellidos, ciudad, provincia
from clientes
where apellidos like 'S%' and ciudad = 'Somosierra' or provincia = 'ORENSE';


/*20) Mostrar una lista de los nombres y número de teléfono de los proveedores de las provincias
de MADRID y CACERES.*/
select nombre, telefono, provincia
from proveedores
where provincia = 'MADRID' or provincia = 'CACERES';

/*21) Mostrar los datos de los pedidos del cliente 1001 en los que las fechas de pedido y envío
coincidan*/
select *
from pedidos
where id_cliente = 1001 and fecha_pedido = fecha_envio;


/*22) Mostrar los datos de los pedidos del cliente 1001 o que cumplan que la fecha de envío es 4
días posterior a la fecha de pedido.*/
select *
from pedidos
where id_cliente = 1001 and fecha_envio-fecha_pedido >= 4;

/*23) Mostrar nombre, apellidos, provincia y código postal de los clientes que se apelliden Pelayo
en la provincia de CACERES o de los clientes cuyo código postal termine en 9.*/
select nombre, apellidos, provincia, cod_postal
from clientes
where apellidos = 'Pelayo' and provincia = 'CACERES' or cod_postal like '%9';

/*24) Mostrar nombre, apellidos, provincia y código postal de los clientes que se apelliden Pelayo
y de cualquier otro cliente que viva en la provincia de CACERES o tenga un código postal que
termine en 9.*/
select nombre, apellidos, provincia, cod_postal
from clientes
where apellidos = 'Pelayo' or provincia = 'CACERES' or cod_postal like '%9';

/*25) Mostrar los datos de los proveedores que tienen su sede en CACERES, ORENSE o MADRID*/
select *
from proveedores
where provincia = 'CACERES' or provincia = 'ORENSE' or provincia = 'MADRID';

/*26) Listar los clientes cuyo apellido empieza por H.*/
select *
from clientes
where apellidos like 'H%';

/*27) Listar los clientes que no viven en Robledo ni en Somosierra*/
select *
from clientes
where ciudad != 'Robledo' and ciudad != 'Somosierra';

/*28) Mostrar el número de pedido, el id_cliente y la fecha de pedido de todos los pedidos que ha
realizado el cliente 1001 ordenado por fecha de pedido.*/
select numero_pedido, id_cliente, fecha_pedido
from pedidos
where id_cliente = 1001 order by fecha_pedido;

/*29) Mostrar un listado en orden alfabético de los nombres de productos que empiezan por
'Dog'*/
select nombre 
from productos
where nombre like 'Dog%' order by nombre;

/*30) Listar los nombres de todos los proveedores con sede en Batres, Belmonte o Robledo*/
select *
from proveedores
where ciudad = 'Batres' or ciudad = 'Belmonte' or ciudad = 'Robledo';

/*31) Mostrar en orden alfabético la lista de los nombres de productos cuyo precio de venta sea
igual o superior a 125.00 euros.*/
select *
from productos
where precio_venta >= 125 order by nombre;

/*32) Listar en orden alfabético los nombres de los proveedores que no tienen página web.*/
select *
from proveedores 
where pag_web is null;










