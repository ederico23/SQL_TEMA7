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
from clientes
where id_cliente = '1001' and fecha_pedido = fecha_envio;

