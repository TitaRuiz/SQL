use Northwind;

--Cuantos productos hay en tabla de productos


--Sumar las cantidades en existencia 
--de la tabla de productos



--Promedio de los precios 
-- de la tabla de productos


--Numero de productos por categoria


--Obtener el precio promedio por proveedor de la tabla de productos


--Obtener la suma de inventario (UnitsInStock) por SupplierID
--De la tabla de productos (Products)


--comprobaci�n
SELECT SupplierID, 
       UnitsInStock
FROM products
ORDER BY SupplierID;

--Contar las ordenes por cliente de la tabla de orders


--Contar las ordenes por empleado
--De la tabla de ordenes
--Pero unicamente del empleado 1,3,5,6


--Obtener la suma del env�o (freight) por cliente
--De la tabla de ordenes
--Pero �nicamente de los registros cuya ShipCity sea 
--Madrid, Sevilla, Barcelona, Lisboa, London
--Ordenado por el campo de suma del env�o



--Obtener los datos de productos ordenados descendentemente por precio unitario
--de la categor�a 1



--Obtener los datos de los clientes(Customers) ordenados descendentemente por nombre(CompanyName) que se 
--encuentren en la ciudad(city) de barcelona, Lisboa


--Obtener los datos de las ordenes, ordenados descendentemente por la fecha de la orden
--cuyo cliente(CustomerId) sea ALFKI



--Obtener los datos del detalle de ordenes, ordenados ascendentemente por precio
--cuyo producto sea 1, 5 o 20



--Obtener los datos de las ordenes ordenados ascendentemente por la fecha de la orden
--cuyo empleado sea 2 o 4


--Obtener los productos cuyo precio est�n entre 30 y 60
--ordenado por nombre

--OBTENER EL MAXIMO, MINIMO Y PROMEDIO DE PRECIO UNITARIO DE LA TABLA DE PRODUCTOS
--UTILIZANDO ALIAS


--obtener el precio promedio de los productos por categoria
--sin contar con los productos descontinuados (Discontinued)


--Obtener la cantidad de productos por categoria,  aquellos cuyo precio se
--encuentre entre 10 y 60 que tengan m�s de 12 productos



--OBTENER LA SUMA DE LAS UNIDADES EN EXISTENCIA (UnitsInStock)
--POR CATEGORIA, Y TOMANDO EN CUENTA UNICAMENTE LOS PRODUCTOS CUYO
--PROVEEDOR (SupplierID) SEA IGUAL A 17, 19, 16.
--cuya categoria tenga menos de 100 unidades
--ordenado por unidades




