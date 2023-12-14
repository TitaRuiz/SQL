--Consultas de más de una tabla
--Mostrar el id producto, su nombre, el importe (cantidad * precio)
--de la tabla de detalle de ordenes y la tabla de productos

Select od.product_id, product_name, quantity * od.unit_price as importe
from products p
inner join order_details od
on p.product_id = od.product_id;

--De la consulta anterior obtener por producto la suma del importe
Select od.product_id, product_name, sum(quantity * od.unit_price) as importe
from products p
inner join order_details od
on p.product_id = od.product_id
group by od.product_id, product_name
order by od.product_id

--Contar las ordenes por cliente y empleado, obteniendo 
--Nombre completo del empleado y nombre de la empresa
Select first_name, company_name, count (order_id) as contador
from orders o
inner join employees e
on o.employee_id = e.employee_id
inner join customers c
on o.customer_id= c.customer_id
group by first_name, company_name
order by first_name;

--Obtener el importe vendido de la tabla de ordenes de detalle
--por categoria (nombre de la categoria) y proveedor (nombre de la empresa)
--(productos, detalle de ordenes, proveedores)

Select category_name, company_name, sum(od.unit_price*quantity) as importe
from order_details od
inner join products p
on od.product_id = p.product_id
inner join categories c
on c.category_id = p.category_id
inner join suppliers s
on p.supplier_id = s.supplier_id
group by category_name, company_name
order by category_name, company_name

create table TablaA
(
valor varchar(50));

create table TablaB
(
valor varchar(50));

insert into tablaA
values
('a'),
('b'),
('c'),
('d');

insert into tablaB
values
('a'),
('b'),
('e'),
('f');

select * from TablaA
select * from TAblaB;

select a.valor from tablaA A
inner join tablaB B
on a.valor = b.valor

select a.valor, b.valor from tablaA A
left outer join tablaB B
on a.valor = b.valor

select a.valor, b.valor from tablaA A
right outer join tablaB B
on a.valor = b.valor

select a.valor, b.valor from tablaA A
full outer join tablaB B
on a.valor = b.valor
-- FORMAS DE HACER EL INSERT
--1 MENCIONAR LAS COLUMNAS
--2 NO MENCIONAR LAS COLUMNAS
--3 AGREGAR VARIAS FILAS AL MISMO TIEMPO
INSERT INTO CATEGORIES
(category_id,category_name, description)
VALUES
(100,'PAPELERIA', 'ARTICULOS PARA PAPELERIA');

SELECT * FROM CATEGORIES
ORDER BY category_id DESC;
--2 NO MENCIONAR LAS COLUMNAS
INSERT INTO TABLAA
VALUES
('Z');
--3 VARIOS REGISTROS 
INSERT INTO TABLAA
VALUES
('X'),
('Y');
SELECT * FROM TABLAA

UPDATE CATEGORIES
SET CATEGORY_NAME = 'P. ECOLOGICOS'
WHERE category_id = 100;

--Consulta para obtener los productos que no tengan la categoria 
--100
Select * from products
where category_id<>100;

--Borrar la categoria 100 de categorias
DELETE FROM CATEGORIES
WHERE category_id=100;

--Actualizar el precio de los productos
--para incrementarlos al 10%
Select * from products

update products 
set unit_price = unit_price*1.1;











