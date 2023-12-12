--Ejemplos de filtros
--Obtener los productos de orders_details cuyo precio sea mayor a 50
Select * from order_details 
where unit_price > 50;

--Obtener Productos de orders_details cuya cantidad sea mayor a 75
Select * from order_details 
where quantity > 75;

--Obtener los empleados que contengan una W en su apellido
Select * from public.employees
where last_name like '%w%';

--Obtener los productos de orders_details cuya cantidad se encuentre entre
--75 y 150
Select product_id, quantity from public.order_details
where quantity between 75 and 150;

--Obtener los productos cuya stock esté entre 100 y 200
Select * from products
where units_in_stock between 100 and 200;

--Obtener los productos cuyo nombre comience con C y termine con i
Select * from products
where product_name like 'C%i';

--Obtener los productos cuyo nombre terminen en n
Select * from products
where product_name like '%n';

--Obtener los productos cuyo proveedor sea 1,5,7,2
Select * from products
where supplier_id in (1,5,7,2);

--Obtener los productos cuyo nombre comience con A, G, R ordenar por nombre de producto
Select *  from products
where product_name like 'A%'
or product_name like 'G%' 
or product_name like 'R%'
order by product_name;

--ORDER BY <NOMBRE>
--Ordenar la tabla de productos por nombre
Select * from products
order by product_name ;
--Ordenar la tabla de productos por id descendente
Select * from products
order by product_id DESC;

--Ordenar la tabla de productos por categoria ascendentemente y proveedor descendente
Select * from products
order by category_id asc, supplier_id desc


--Funciones de agregacion: count, sum, avg, max, min
--La única que acepta el * es count
--El resto el nombre de una columna o operación artimetica

--Obtener las filas de la tabla de productos
Select count(*) as num_registros
from products;

Select count(*) num_registros
from products;

--Obtener el número de filas de la tabla de empleados
Select count(*) as num_registros
from employees;
--Evitar el *
Select count(employee_id) as num_registros
from employees;

Select count(region) as num_registros
from employees;

--Gestión de nulos
create table datos
(a numeric);

insert into datos
values
(8),
(7),
(null),
(5);

select * from datos;

select sum(a) from datos;

create table datos2
(a numeric, b numeric);

insert into datos2
values
(8,2),
(7,3),
(null,3),
(5,5);

select a-b as suma from datos2;

select avg(a) from datos;

--Obtener el precio promedio, maximo y minimo de productos
Select avg(unit_price) as promedio, max(unit_price) as maximo,
min(unit_price) as minimo
from products;
--comprobación
select unit_price from products order by unit_price;

--Obtener la cantidad promedio, maximo y mínimo de order_details
Select avg(quantity) as promedio, max(quantity) as maximo,
min(quantity) as minimo
from order_details;





