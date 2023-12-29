--funciones de agregacion
--Cuantos productos hay en tabla de productos
select count(product_id) as contadorFilas
from Products;

--Sumar las cantidades en existencia 
--de la tabla de productos
select sum(units_in_stock) as Unidades_inventario
from products;

--Promedio de los precios 
-- de la tabla de productos
select AVG(unit_price) as precio_promedio
from products;

--Columna calculada
Select unit_price*1.1 as precio_incrementado
from products;

--Numero de productos por categoria
Select category_id, count(product_id) as cantidad
from products
group by category_id;

--Obtener el precio promedio por proveedor de la tabla de productos
Select supplier_id, avg(unit_price) as precioPromedio
from products
group by supplier_id;

--Obtener la suma de inventario (UnitsInStock) por SupplierID
--De la tabla de productos (Products)
select supplier_id, sum(units_in_stock) as Stock
from products
group by supplier_id;

--comprobación
SELECT supplier_id, 
       units_in_stock
FROM products
ORDER BY supplier_id;

--Contar las ordenes por cliente de la tabla de orders
SELECT customer_id, COUNT(order_id) as NumOrdenes 
FROM Orders
GROUP BY customer_id;

--Contar las ordenes por empleado
--De la tabla de ordenes
--Pero unicamente del empleado 1,3,5,6
SELECT employee_id, COUNT(order_id) as NumOrdenes
FROM Orders
WHERE employee_id IN(1,3,5,6)
GROUP BY employee_id;

--Obtener la suma del envío (freight) por cliente
--De la tabla de ordenes
--Pero únicamente de los registros cuya ShipCity sea 
--Madrid, Sevilla, Barcelona, Lisboa, London
--Ordenado por el campo de suma del envío

SELECT customer_id, SUM(Freight) as SumaEnvio
FROM Orders
WHERE  ship_city IN('Madrid', 'Sevilla', 'Barcelona', 'Lisboa', 'London')
GROUP BY customer_id
order by SUM(Freight);

--Obtener los datos de productos ordenados descendentemente por precio unitario
--de la categoría 1

select *
from products
where  category_id= 1
order by unit_price desc;

--Obtener los datos de los clientes(Customers) ordenados descendentemente por nombre(CompanyName) que se 
--encuentren en la ciudad(city) de Barcelona, Lisboa
SELECT *
FROM Customers 
WHERE City IN ('Barcelona', 'Lisboa')
ORDER BY  company_name DESC;

--Obtener los datos de las ordenes, ordenados descendentemente por la fecha de la orden
--cuyo cliente(CustomerId) sea ALFKI

SELECT *
FROM Orders
WHERE  customer_id= 'ALFKI'
ORDER BY order_date DESC;

--Obtener los datos del detalle de ordenes, ordenados ascendentemente por precio
--cuyo producto sea 1, 5 o 20

SELECT *
FROM public.order_details
WHERE product_id IN (1,5,20)
order by unit_price ASC;

--Obtener los datos de las ordenes ordenados ascendentemente por la fecha de la orden
--cuyo empleado sea 2 o 4

Select * 
from orders
where employee_id in(2, 4)
order by order_date;

--Obtener los productos cuyo precio están entre 30 y 60
--ordenado por nombre
SELECT *
FROM Products
WHERE unit_price BETWEEN 30 AND 60
ORDER BY product_name;

--OBTENER EL MAXIMO, MINIMO Y PROMEDIO DE PRECIO UNITARIO DE LA TABLA DE PRODUCTOS
--UTILIZANDO ALIAS

SELECT MAX(unit_price) AS Maxprecio, MIN(unit_price) AS Minprecio, AVG(unit_price) AS Promedioprecio
FROM Products;

--obtener el precio promedio de los productos por categoria
--sin contar con los productos descontinuados (Discontinued)
select category_id, AVG(unit_price) as Promedio
from Products
where discontinued =0
group by category_id;

--Obtener la cantidad de productos por categoria,  aquellos cuyo precio se
--encuentre entre 10 y 60 que tengan más de 9 productos
SELECT category_id, 
       COUNT(product_id) AS cantidad
FROM products
WHERE unit_price BETWEEN 10 AND 60
GROUP BY category_id
having count(product_id) > 9;

--OBTENER LA SUMA DE LAS UNIDADES EN EXISTENCIA (UnitsInStock)
--POR CATEGORIA, Y TOMANDO EN CUENTA UNICAMENTE LOS PRODUCTOS CUYO
--PROVEEDOR (SupplierID) SEA IGUAL A 17, 19, 16.
--cuya categoria tenga menos de 200 unidades
--ordenado por unidades

SELECT category_id, 
       SUM(units_in_stock) AS suma
FROM products
WHERE supplier_id IN(17, 19, 16)
GROUP BY category_id
having sum(units_in_stock) < 200
order by suma;


