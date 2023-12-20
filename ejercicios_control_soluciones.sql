--Nombres de clases de barco y países de las clases de barco que llevaban armas con un
--calibre mayor o igual a 16 pulgadas.
select clase, pais from clases
where calibre >=16;
--resultado 4 registros

--Nombre, desplazamiento y número de armas de todos los barcos que participaron en la
--batalla de Guadalcanal.
Select nombre, desplazamiento, numarmas from barcos b
inner join clases c
on b.clase = c.clase
inner join resultados r
on b.nombre = r.barco
where batalla = 'Guadalcanal';
--resultado 2

--Clases de barco para los que existe un barco miembro de esa clase.
Select clase from clases c
where exists (select * from barcos b where c.clase = b.clase);
--resultado 9

--Barcos que resultaron dañados en una batalla, pero sobrevivieron y pelearon en otra
--batalla posterior.
select nombre, fecha, barco, resultado  from batallas b
inner join resultados r
on b.nombre = r.batalla 
where resultado='danado' and
exists ( select nombre, fecha, barco, resultado  from batallas sb
inner join resultados sr
on b.nombre = r.batalla where b.fecha<sb.fecha and r.barco = sr.barco  );
--resultado 1

--Barcos con desplazamiento superior a 35.000 toneladas.
Select b.nombre, desplazamiento  from barcos b
inner join clases c
on b.clase = c.clase
where desplazamiento > 35000;
--resultado 8

--Batallas en las que participaron al menos tres barcos del mismo país.
select r.batalla, pais, count(pais) from barcos b
inner join resultados r 
on b.nombre = r.barco
inner join clases c 
on b.clase = c.clase
group by r.batalla, pais
having count (pais)>=3;
--resultado 1

--Batallas en las que participaron barcos de la clase Congo.

Select r.batalla from resultados R
inner join barcos B 
on r.barco= b.nombre
where b.clase='Congo';

--resultado 2

--Nombre de las clases de barcos tales que al menos un barco de la clase se hundió en una
--batalla.

select c.clase from resultados r
inner join barcos b
on b.nombre = r.barco
inner join clases c
on c.clase = b.clase
where resultado = 'hundido'
group by c.clase 
having count(b.nombre)>=1
--resultado 1
--Número de clases distintas de barcos.
select count(distinct clase) from barcos
--9
--comprobacion
select * from barcos order by clase

--Para cada clase, encontrar el año en el que fue botado el barco más antiguo de la clase.
Select clase, min(botado) from barcos
group by clase 
order by clase
