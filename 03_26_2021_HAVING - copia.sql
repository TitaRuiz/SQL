-- 1 Se quiere saber a qué paises se les vende, usar la tabla de clientes
Select Country from Customers
group by country;
--22 filas
-- 2 Se quiere saber a qué ciudades se les vende, usar la tabla de clientes
Select  city from Customers
group by city;
--70
-- 3 Se quiere saber a qué ciudades se les ha enviado una orden
select ship_city from orders
group by ship_city;

-- 4 Se quiere saber a qué ciudades se les vende en el pais USA usar la tabla de clientes
Select  city from Customers
where Country='USA'
group by city;
--12
-- 5 Se quiere saber a qué paises se les vende usar la tabla de clientes
-- nota hacerla usando distinct
Select distinct Country from Customers;


-- 6 Cuantos clientes hay por pais
Select Country, count(customer_id) as NumClientes from Customers
group by Country;

--7 Cuantos clientes hay por ciudad en el pais USA
Select city, count(Customer_id) as Num_Clientes from Customers
where country='USA'
group by city;

--8 Cuantos productos hay por proveedor de la categoria 1
Select Supplier_id, count(product_id) as Cantidad_Productos from products
where category_id = 1
group by Supplier_ID;

-- 9 Cuales son los proveedores que nos surten más de 3 producto, mostrar el proveedor
-- mostrar la cantidad de productos

Select supplier_id, count(product_id) as Cantidad from Products
group by Supplier_ID
having count(Product_ID) > 3;

-- 10 Cuales son los proveedores que nos surten más de 1 producto, mostrar el proveedor
-- mostrar la cantidad de productos, pero únicamente de la categoria 1
Select supplier_id, count(product_id) as Cantidad from Products
where category_id = 1
group by Supplier_ID
having count(Product_ID) > 1;

--11 CONTAR LAS ORDENES POR EMPLEADO DE LOS PAISES USA, CANADA, SPAIN (ShipCountry)
--MOSTRAR UNICAMENTE LOS EMPLEADOS CUYO CONTADOR DE ORDENES SEA MAYOR A 20

SELECT Employee_ID, 
       COUNT(Order_ID) AS contador
FROM Orders
WHERE Ship_Country IN('USA', 'Canada', 'Spain')
GROUP BY Employee_ID
HAVING COUNT(Order_id) > 20;
--cuatro

Select ROW_NUMBER() over(order by product_name asc) as noFila,
product_id, product_name
from products 
where category_id = 1;

--12 OBTENER EL PRECIO PROMEDIO DE LOS PRODUCTOS POR PROVEEDOR
--UNICAMENTE DE AQUELLOS CUYO PROMEDIO SEA MAYOR A 20

SELECT Supplier_ID, 
AVG(UNIT_PRICE) AS PRECIO_PROMEDIO
FROM PRODUCTS
GROUP BY Supplier_ID
HAVING AVG(UNIT_PRICE)> 20;

--13 OBTENER LA SUMA DE LAS UNIDADES EN EXISTENCIA (UnitsInStock)
--POR CATEGORIA, Y TOMANDO EN CUENTA UNICAMENTE LOS PRODUCTOS CUYO
--PROVEEDOR (SupplierID) SEA IGUAL A 17, 19, 16
--ADICIONALMENTE CUYA SUMA POR CATEGORIA SEA MAYOR A 300--

SELECT Category_ID, 
       SUM(units_in_stock) AS suma
FROM Products
WHERE Supplier_ID IN(17, 19, 16)
GROUP BY Category_ID
HAVING SUM(units_in_stock) > 300;

--14 CONTAR LAS ORDENES POR EMPLEADO DE LOS PAISES (ShipCountry)
--USA, CANADA, SPAIN
--CUYO CONTADOR SEA MAYOR A 25

SELECT employee_id, 
       COUNT(order_id) AS contador
FROM orders
WHERE ship_country IN('USA', 'Canada', 'Spain')
GROUP BY employee_id
HAVING COUNT(Order_Id) > 25;

--15 OBTENER LAS VENTAS (Quantity * UnitPrice) AGRUPADAS POR PRODUCTO 
--(Orders details) Y CUYA SUMA DE VENTAS SEA MAYOR A 50.000

SELECT Product_ID, 
       SUM(Quantity * Unit_Price) AS ventas
FROM public.order_details
GROUP BY product_id
HAVING SUM(Quantity * Unit_Price) > 50000;
