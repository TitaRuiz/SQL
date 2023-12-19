DO $$
declare 
nombre varchar(20):='Juan López';
begin
	raise notice 'Bienvenido %',nombre;
end
$$ language 'plpgsql'

do $$
declare
edad int :=18;
begin
	raise notice 'Su edad es %',edad;
end
$$ language 'plpgsql'

--declarar una variable de tipo genero char con valor 'M'
do $$
declare
genero char := 'M';
begin
	raise notice 'Su genero es %',genero;
end
$$ language 'plpgsql'

--estructuras de control
--condicionales
--if

do $$
declare 
usuario varchar(20):='admin1';
begin
   if(usuario = 'admin') then
     raise notice 'Bienvenido %',usuario;
   else
   	raise notice 'No se puede logear, no tiene permiso';
   end if;
end
$$ language 'plpgsql'

--definir una variable de edad, decir si es mayor de edad o menor de edad
do $$
declare
edad int :=17;
begin
    if (edad >=18) then
		raise notice 'Su edad es % por lo tanto es mayor de edad',edad;
	else
		raise notice 'Su edad es % por lo tanto es menor de edad',edad;
	end if;
end
$$ language 'plpgsql'

--definir una variable numerica y decir si es positivo o negativo
do $$
declare
numero int :=5;
begin
    if (numero >=0) then
		raise notice 'El numero es positivo';
	else
		raise notice 'El número es negativo';
	end if;
end
$$ language 'plpgsql'

--case - estructura condicional evaluar el valor de una variable
DO $$
declare 
estado_civil char:='v';
begin
	case
		when (estado_civil = 's')then raise notice 'Es soltero';
		when (estado_civil = 'c') then raise notice 'Es casado';
		when (estado_civil = 'v') then  raise notice 'Es viudo';
		when (estado_civil = 'd') then raise notice 'Es divorciado';
		else
			raise notice 'valor invalido';
	end case;
end
$$ language 'plpgsql'

--definir una variable de tipo numerico y decir el nombre del día de la semana
DO
$$
DECLARE dia int := 5;
BEGIN
    CASE
        when (dia = 1) then raise notice 'Lunes';
        when (dia = 2) then raise notice 'Martes';
        when (dia = 3) then raise notice 'Miercoles';
        when (dia = 4) then raise notice 'jueves';
        when (dia = 5) then raise notice 'viernes';
        when (dia = 6) then raise notice 'sabado';
        when (dia = 7) then raise notice 'Domingo';
    else
        raise notice 'dia no valido';
    end case;
END
$$ 
LANGUAGE 'plpgsql';

--Estructuras de bucle

DO $$
declare 
contador integer := 1;
begin
    LOOP
		raise notice 'iteracion %',contador;
		contador := contador + 1;				
		exit when contador =11;
	end loop;
end
$$ language 'plpgsql'

DO $$
declare 
contador integer := 0;
begin
    while(contador <10) LOOP
		contador := contador + 1;
		raise notice 'iteracion %',contador;
	end loop;
end
$$ language 'plpgsql'

--mostrar por la consola la tabla de multiplicar de 3
DO $$
declare 
contador integer := 1;
begin
    while(contador <=10) LOOP
		raise notice '3 x % = %',contador,contador*3;
		contador := contador + 1;		
	end loop;
end
$$ language 'plpgsql'

--funciones
create or replace function sin_param()
returns TEXT
as $$
begin
	return 'Funciona';
end 
$$
language 'plpgsql';

select sin_param();


select sin_param()

create or replace function cantidades_existencia()
returns integer
as $$
declare
	cantidad_existencia integer;
begin
    select sum(units_in_stock) into cantidad_existencia
	from products;
	return cantidad_existencia;
end
$$ language 'plpgsql'

select cantidades_existencia();

--en base al id de producto se devuelve el nombre
create or replace function nombre_producto(id integer)
returns varchar(40)
as $$
declare
	nombre varchar(40);
begin
	select product_name into nombre from products
	where product_id = id;
	return nombre;
end
$$ language 'plpgsql'

select nombre_producto(10)

--Obtener el número de ordenes por empleado
--parametro de entrada -> id de empleado
--parametro de salida -> numero de ordenes de ordenes - count

create or replace function get_order_count(emp_id integer)
returns int
as $$
declare 
	quantity int ;
begin
	select count(order_id)
	into quantity
	from orders
	where employee_id = emp_id;
	return quantity;
end
$$ language 'plpgsql'

select get_order_count(2)
--obtener en base de un id de producto obtener la suma de las
--cantidades vendidas de la tabla de order_details
create or replace function obtener_cantidad_vendida(id integer)
returns integer
as $$
declare 
	cantidad int ;
begin
	select sum(quantity)
	into cantidad
	from order_details
	where product_id = id;
	return cantidad;
end
$$ language 'plpgsql'

select obtener_cantidad_vendida(1)




