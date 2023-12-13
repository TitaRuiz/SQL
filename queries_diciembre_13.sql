--Group by
--having
--Obtener por producto las cantidades que se han vendido

Select product_id, sum(quantity) as cantidad_vendida
from order_details
group by product_id
having sum(quantity) >850
order by product_id;

--Obtener los empleados que han vendido más de 100 de la tabla de Ordenes
Select employee_id, count(order_id)
from orders
group by employee_id
having count(order_id)>100
order by employee_id;

--Obtener el numero de ordenes por país, únicamente los paises USA, Spain
Select ship_country, count(order_id) as ordenes
from orders
where ship_country in ('USA','Spain')
group by ship_country

-- Cuales son los proveedores que nos surten más de 1 producto, mostrar el proveedor
-- mostrar la cantidad de productos, pero únicamente de la categoria 1 de la tabla 
-- De productos
Select supplier_id, count(product_id) as cantidad
from products
where category_id=1
Group by supplier_id
having count(product_id)>1

--CONTAR LAS ORDENES POR EMPLEADO DE LOS PAISES USA, CANADA, SPAIN (ShipCountry)
--MOSTRAR UNICAMENTE LOS EMPLEADOS CUYO CONTADOR DE ORDENES SEA MAYOR A 20
order by supplier_id;
select * from products

--CONTAR LAS ORDENES POR EMPLEADO DE LOS PAISES USA, CANADA, SPAIN (ShipCountry)
--MOSTRAR UNICAMENTE LOS EMPLEADOS CUYO CONTADOR DE ORDENES SEA MAYOR A 20
SELECT employee_id, 
       COUNT(order_id) AS contador
FROM public.orders
WHERE ship_country IN('USA', 'Canada', 'Spain')
GROUP BY employee_id
HAVING COUNT(order_id) > 20;

--OBTENER EL PRECIO PROMEDIO DE LOS PRODUCTOS POR PROVEEDOR
--UNICAMENTE DE AQUELLOS CUYO PROMEDIO SEA MAYOR A 20
SELECT supplier_id, 
AVG(unit_price) AS PRECIO_PROMEDIO
FROM PRODUCTS
GROUP BY supplier_id
HAVING AVG(unit_price)> 20
order by supplier_id
--OBTENER LA SUMA DE LAS UNIDADES EN EXISTENCIA (UnitsInStock)
--POR CATEGORIA, Y TOMANDO EN CUENTA UNICAMENTE LOS PRODUCTOS CUYO
--PROVEEDOR (SupplierID) SEA IGUAL A 17, 19, 16
--ADICIONALMENTE CUYA SUMA POR CATEGORIA SEA MAYOR A 300--
SELECT category_id, 
       SUM(units_in_stock) AS suma
FROM products
WHERE supplier_id IN(17, 19, 16)
GROUP BY category_id
HAVING SUM(units_in_stock) > 300;
--CONTAR LAS ORDENES POR EMPLEADO DE LOS PAISES (ShipCountry)
--USA, CANADA, SPAIN
--CUYO CONTADOR SEA MAYOR A 25
SELECT employee_id, 
       COUNT(order_id) AS contador
FROM orders
WHERE ship_country IN('USA', 'Canada', 'Spain')
GROUP BY employee_id
HAVING COUNT(order_id) > 25;
--OBTENER LAS VENTAS (Quantity * UnitPrice) AGRUPADAS POR PRODUCTO 
--(Orders details) Y CUYA SUMA DE VENTAS SEA MAYOR A 50.000
SELECT product_id, 
       SUM(quantity * unit_price) AS ventas
FROM order_details
GROUP BY product_id
HAVING SUM(quantity * unit_price) > 50000;


