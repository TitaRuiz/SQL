Select * from categories;
--Todas las columnas y las filas de la tabla de productos
Select * from products;
--Todas las columnas y las filas de la tabla de clientes
Select * from customers;
--Todas las columnas y las filas de la tabla de ordenes
Select * from orders;

--Obtener las columnas category_id, category_name de la tabla de categories
Select category_id, category_name from categories;
--Obtener las columnas de id, nombre, precio de la tabla de productos
Select product_id, product_name,unit_price from products;

--Obtener las columnas de id, producto, cantidad de la tabla detalle de ordenes
Select order_id, product_id, quantity from order_details;

--Obtener las columnas de id, nombre, apellido, jefe de la tabla de empleados
Select employee_id, first_name, last_name, reports_to from employees;

--filtros
-- No se muestran todas las filas
-- unicamente las que cumplen con la condicion
-- Operadores de comparacion -> > < <> <= >= =
-- and / or / not
-- between - rangos between 1 and 20 
-- in - definir si un valor está en un conjunto sexo in ('M', 'H')
-- like - es como el operador igual para usar con patron -> p%, %n, %l%

--Obtener los productos cuyo precio sea mayor a 50
SELECT * FROM PRODUCTS 
WHERE unit_price > 50;

--Obtener los productos cuyo precio sea menor a 100
SELECT * FROM PRODUCTS 
WHERE unit_price < 100;

--Obtener los productos que tengan categoria 1,6,7
SELECT * FROM PRODUCTS 
WHERE category_id in (1,6,7);

--Obtener los productos que tengan el precio entre 35 y 75
SELECT * FROM PRODUCTS 
where unit_price between 35 and 75;
--Obtener los productos que comiencen con p su nombre
SELECT * FROM PRODUCTS 
where product_name like 'P%';


