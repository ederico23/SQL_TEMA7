select * 
from clientes;

select nombre, apellidos, provincia
from clientes;

select distinct nombre, provincia
from clientes;


select * 
from productos;

select nombre, precio_venta, precio_venta*0.85 as con_descuento
from productos;