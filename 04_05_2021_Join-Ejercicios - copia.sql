use Northwind;
--Ejercicios con el joint
--OBTENER EL NUMERO DE ORDEN, EL ID EMPLEADO, NOMBRE Y APELLIDO
--DE LAS TABLAS DE ORDENES Y EMPLEADOS
SELECT ORDERID, 
       E.EMPLOYEEID, 
       FIRSTNAME, 
       LASTNAME
FROM Employees AS E
     INNER JOIN ORDERS AS O 
	 ON E.EmployeeID = O.EmployeeID;

--OBTENER EL PRODUCTID, PRODUCTNAME, SUPPLIERID, COMPANYNAME
--DE LAS TABLAS DE PRODUCTOS Y PROVEEDORES (SUPPLIERS)

SELECT productid, 
       productname, 
       p.supplierid, 
       companyname
FROM products AS P
     INNER JOIN Suppliers AS S 
	 ON p.SupplierID = s.SupplierID;

--OBTENER LOS DATOS DEL DETALLE DE ORDENES CON EL NOMBRE DEL PRODUCTO
--DE LAS TABLAS DE DETALLE DE ORDENES Y DE PRODUCTOS
SELECT ORDERID, 
       OD.PRODUCTID, 
       PRODUCTNAME, 
       OD.UNITPRICE, 
       QUANTITY, 
       DISCOUNT
FROM PRODUCTS AS P
     INNER JOIN [Order Details] AS OD 
	 ON P.ProductID = OD.ProductID;
	 
--OBTENER DE LAS ORDENES EL ID, SHIPPERID, NOMBRE DE LA COMPAÑÍA DE ENVIO (SHIPPERS)
SELECT OrderID, 
       ShipperID, 
       CompanyName
FROM Shippers S
     INNER JOIN Orders O ON S.ShipperID = O.ShipVia;

--Obtener el número de orden, país de envío (shipCountry)
--y el nombre del empleado
--de la tabla ordenes y empleados
--Queremos que salga el Nombre y Apellido del Empleado en una sola columna.
SELECT o.OrderID, 
       o.ShipCountry, 
       (FirstName + ' ' + LastName) AS nombreCompleto
FROM [dbo].[Employees] AS e
     INNER JOIN [dbo].[Orders] AS o ON e.EmployeeID = o.EmployeeID;