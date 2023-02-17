-- FUNCION Especial CHAR_LENGTH() devuelve la longitud de cadena
select name, char_length(name) from category;
select city, char_length(city) as longitud from city;

-- FUNCION Especial CONCAT() concatena dos cadenas (columnas)
select concat(first_name,' ', last_name) as "Nombre Completo" from customer;
select concat_ws('-',first_name, last_name) as "Nombre" from customer;

-- Funcion especial ROUND(columna, decimales) redonde a los decimales indicados 
select *, round(amount,1) from payment;

-- Funcion especial UCASE() LCASE() convierte a mayúsculas o minúsculas
select first_name, lcase(last_name) from customer;

-- FUNCION CASE nos permite crear condiciones para mostrar una nueva columna
select address, address2, 
case when address2 is null
	then "Sin Dirección"
    else "Con direccion"
    end as Comentario
from address;

select payment_id, amount,
case 
	when amount < 1 
		then "Precio Minimo" 
	when amount between 1 and 3
		then "Precio intermedio"
	else "Precio maximo"
end as Comentario
from payment;
