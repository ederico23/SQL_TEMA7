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
select nombre
from clientes
where upper(provincia) = 'MADRID';

/*14) Mostrar el nombre y apellido de los clientes que (una consulta para cada punto):
• viven en la provincia de MADRID
• viven en Belmonte
• tienen como código postal 45915
• que hicieron pedidos en Mayo*/

--viven en la provincia de MADRID
select nombre, apellidos
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
select nombre, apellidos
from clientes 
where id_cliente in(select id_cliente
                        from pedidos
                        where extract(month from fecha_pedido)=1);
                        
-- solucion 2
select distinct nombre, apellidos
from clientes join pedidos on clientes, id_cliente = pedidos.id_cliente
where to_char(pedidos.fecha_pedido, 'MM')='05';

/*15) ¿Hay pedidos en los que la fecha de envío fue puesta accidentalmente anterior a la fecha de
pedido?*/
--ESTO ESTÁ MAL
select numero_pedido, fecha_envio - fecha_pedido as errores
from pedidos;

--solucion1
select numero_pedido
from pedidos
where fecha_envio<fecha_pedido;

--solucion2
select count(*) as "ERROR_FECHA ENVIO"
from pedidos
where fecha_envio<fecha_pedido;

/*16) Mostrar el nombre y apellidos de los clientes cuyos apellidos empiezan por 'Pe'*/
select nombre, apellidos
from clientes
where upper(apellidos) like 'Pe%';


/*17) Mostrar el nombre y dirección de los proveedores cuya dirección incluya la cadena 'del'*/
select nombre, direccion
from proveedores
where direccion like '%del%';

/*18) Listar el nombre y apellidos de los clientes que viven en Somosierra y cuyo apellido empieza
con la letra ‘S’.*/
select nombre, apellidos
from clientes
where apellidos like 'S%' and ciudad = 'Somosierra';

/*19) Listar el nombre y apellidos de los clientes que viven en Somosierra o en la provincia de
ORENSE.*/
select nombre, apellidos
from clientes
where ciudad = 'Somosierra' or provincia = 'ORENSE';


/*20) Mostrar una lista de los nombres y número de teléfono de los proveedores de las provincias
de MADRID y CACERES.*/
select nombre, telefono
from proveedores
where upper(provincia) = 'MADRID' or upper(provincia) = 'CACERES';

/*21) Mostrar los datos de los pedidos del cliente 1001 en los que las fechas de pedido y envío
coincidan*/
select *
from pedidos
where id_cliente = 1001 and fecha_pedido = fecha_envio;


/*22) Mostrar los datos de los pedidos del cliente 1001 o que cumplan que la fecha de envío es 4
días posterior a la fecha de pedido.*/
select *
from pedidos
where id_cliente = 1001 or fecha_envio-fecha_pedido = 4;

--para contarlos
select count (*)
from pedidos
where id_cliente = 1001 or fecha_envio-fecha_pedido = 4;x

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
select nombre
from proveedores 
where pag_web is null order by nombre;

/*33) Intersección: Listar los número de pedidos en los que se han pedido tanto bicicletas
(sabiendo que sus números de producto son 1, 2, 6 y 11) como cascos (sabiendo que sus
números de producto son 10, 25 y 26)*/

select distinct d1.numero_pedido
from detalles_pedidos d1 join detalles_pedidos d2 on (d1.numero_pedido = d2.numero_pedido)
where d1.numero_producto in (1,2,6,11) and d2.numero_producto in (10,25,26);

--solucion 2
select numero_pedido
from detalles pedidos
where numero_producto in (1,2,6,11)
intersect 
select numero_pedido
from detalles pedidos
where numero_producto in (10,25,26);


/*34) Diferencia: Listar los número de pedidos que han comprado alguna bicicleta (sabiendo que
sus números de producto son 1, 2, 6 y 11) pero no cascos (sabiendo que sus números de
producto son 10, 25 y 26)*/

select numero_pedido
from detalles_pedidos
where numero_producto in (1,2,6,11)
minus
select numero_pedido
from detalles_pedidos
where numero_producto(10,25,26);

--NO FUNCIONA!!!!--


/*35) Unión: Listar los número de pedidos que han comprado alguna bicicleta (sabiendo que sus
números de producto son 1, 2, 6 y 11) o algún casco (sabiendo que sus números de producto
son 10, 25 y 26). */
select distinct numero_pedido 
from detalles_pedidos 
where numero_producto IN (1, 2, 6, 11, 10, 25, 26);


/*36) Clientes y empleados que tienen el mismo nombre.*/

select nombre 
from clientes
intersect
select nombre
from empleados;

--solucion2
select distinct nombre
from clientes
where nombre in (select nombre
                from empleados);

/*37) Clientes cuyos nombres no coinciden con los de ningún empleado.*/
select nombre 
from clientes
minus
select nombre 
from empleados;

--solucion con el exist--
select distinct nombre
from clientes c
where not exists (select nombre
                  from empleados
                  where nombre = c.nombre);

/*38) Ciudades en las que viven clientes pero ningún empleado.*/
select distinct ciudad 
from clientes
minus
select distinct ciudad 
from empleados;


/*39. Listar todos los números de pedidos en los que se ha vendido algún producto cuyo número
de producto es mayor que el número del producto con nombre 'Shinoman 105 SC Frenos'. No
deben repetirse números de pedido*/
select numero_pedido
from detalles_pedidos
where numero_producto > (select numero_producto
                       from productos
                       where nombre = 'Shinoman 105 SC Frenos');
                       
/*40. Selecciona todos los nombres de proveedores que llevan productos que empiezan por la
letra C y se enviaron en pedidos antes del 1 de Marzo del 2008.*/      

--los que empiezan por C
select nombre
from productos
where upper(nombre) like 'C%';

--los que se enviaron antes de la fecha
select numero_pedido
from pedidos
where fecha_pedido < '01/03/2008';

--productos que empiezan por c y se enviaron antes de la fecha
select distinct numero_producto
from detalles_pedidos
where numero_producto in (select nombre
                            from productos
                            where upper(nombre) like 'C%')
                        and 
                            numero_pedido in (select numero_pedido
                            from pedidos
                            where fecha_pedido < '01-03-2008');
                            
--solucion final
select distinct nombre
from proveedores
where id_prov in (select distinct id_prov
                    from productos_proveedores
                    where numero_producto in (select distinct numero_producto
                                                from detalles_pedidos
                                                where numero_producto in (select nombre
                                                                            from productos
                                                                            where upper(nombre) like 'C%')
                                                                        and 
                                                                            numero_pedido in (select numero_pedido
                                                                            from pedidos
                                                                            where fecha_envio < '01/03/2008')));

/*41. Selecciona todos los nombres de proveedores que llevan productos que empiezan por la
letra V y no se han vendido.*/
select nombre 
from proveedores 
where id_prov in (select id_prov
                from productos 
                where upper(nombre) like 'V%' 
                and numero_producto not in (select distinct numero_producto 
                                            from detalles_pedidos));
--solucion 2--
select distinct p.nombre
from proveedores p join productos_proveedores pp on (p.id_prov=pp.id_prov)
    join productos pr on (pr.numero_producto=pp.numero_producto)
    left join detalles_pedidos dp on (pr.numero_producto=dp.numero_producto)
where upper(pr.nombre) like 'V%' 
    and pr.numero_producto is null;


/*42. Intersección: Listar los clientes que han comprado tanto productos que contengan la cadena
'Bike' en el nombre como productos que contengan la cadena 'Casco' en el nombre.*/
select distinct  id_cliente 
from pedidos 
where numero_pedido in (select numero_pedido 
                        from detalles_pedidos 
                        where numero_producto in (select numero_producto
                                                  from productos
                                                  where upper(nombre) like '%BIKE%'))
                                            intersect
                                                  select distinct id_cliente 
                                                  from pedidos 
                                                  where numero_pedido in (select numero_pedido
                                                                          from detalles_pedidos 
                                                                          where numero_producto in (select numero_producto 
                                                                                                    from productos 
                                                                                                    where upper(nombre) like '%CASCO%'));

--solucion 2--


/*43. Diferencia: Listar los clientes que han comprado algún producto que contenga la cadena
'Bike' en el nombre pero ningún producto que contenga la cadena 'Casco' en el nombre*/
select id_cliente 
from pedidos 
where numero_pedido in (select numero_pedido 
                        from detalles_pedidos
                        where numero_producto in (select numero_producto 
                                                  from productos
                                                  where upper(nombre) like '%BIKE%'))
minus
select id_cliente 
from pedidos 
where numero_pedido in (select numero_pedido
                        from detalles_pedidos
                        where numero_producto in (select numero_producto
                                                  from productos
                                                  where upper(nombre) like '%CASCO%'));
                            
/*44. Unión: Listar los clientes que han comprado algún producto que contenga la cadena 'Bike' o
la cadena 'Casco' en el nombre.*/
select distinct id_cliente 
from pedidos 
where numero_pedido in (select numero_pedido 
                        from detalles_pedidos 
                        where numero_producto in (select numero_producto
                                                  from productos 
                                                  where upper(nombre) like '%BIKE%' 
                                                        or upper(nombre) like '%CASCO%'));          
                                                        
/*45. Clientes que viven en una ciudad que no coincide con ninguna de los empleados*/                                                        
select nombre, ciudad 
from clientes 
where ciudad not in (select distinct ciudad
                     from empleados 
                     where ciudad is not null);
                     
/*46. Lista de los clientes que han comprado algún producto que contenga la cadena 'Bike' en el
nombre seguida de la lista de los que han comprado algún producto que contenga la cadena
'Casco' en el nombre (cruce de tablas).*/          
select c.nombre, 'Compró Bike' as motivo
from clientes c join pedidos p on c.id_cliente = p.id_cliente
where p.numero_pedido in (select numero_pedido 
                          from detalles_pedidos d join productos pr on d.numero_producto = pr.numero_producto 
                          where pr.nombre like '%Bike%')
union all
select c.nombre, 'Compró Casco'
from clientes c JOIN pedidos p ON c.id_cliente = p.id_cliente
where p.numero_pedido in (select numero_pedido 
                          from detalles_pedidos d join productos pr on d.numero_producto = pr.numero_producto 
                          where pr.nombre like '%Casco%');
        
/*47. Seleccionar los nombres de los productos que pertenecen a la categoría 'Componentes'.*/
select nombre 
from productos 
where id_categoria = (select id_categoria 
                      from categorias
                      where upper(nombre) = 'Componentes');




















