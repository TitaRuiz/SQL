--OBTENER LOS DATOS DEL DETALLE DE ORDENES CON EL NOMBRE DEL PRODUCTO
--DE LAS TABLAS DE DETALLE DE ORDENES Y DE PRODUCTOS
Select order_id, od.product_id,product_name, od.unit_price,quantity, discount 
from order_details od
inner join products p
on od.product_id = p.product_id
	 
--OBTENER DE LAS ORDENES EL ID, SHIPPERID, NOMBRE DE LA COMPA��A DE ENVIO (SHIPPERS)
Select order_id, ship_via, company_name from
orders o
inner join shippers s
on o.ship_via = s.shipper_id;
--Obtener el n�mero de orden, pa�s de env�o (shipCountry)
--y el nombre del empleado
--de la tabla ordenes y empleados
--Queremos que salga el Nombre y Apellido del Empleado en una sola columna.
Select order_id, ship_country, CONCAT(first_name,' ',last_name )
from orders o
inner join employees e
on o.employee_id = e.employee_id;
