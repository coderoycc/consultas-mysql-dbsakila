-- Operador IN sirve para seleccionar diferentes valores en un campo sin hacer uso de OR 
select * from customer where first_name in ('MARY','LISA','SUSAN');
select * from film where special_features in ('Trailers', 'Trailers,Deleted Scenes') and rating in ('G','NC-17');
select * from category where name not in ('Action', 'Animation', 'Children'); 
select * from film_text where title in ('ZORRO ARK', 'VIRGIN DAISY', 'UNITED PILOT');

-- Operador Between para seleccionar datos en rangos
select * from rental where customer_id between 300 and 500;
select * from payment where amount not between 3 and 5;

-- Operador LIKE sirve para seleccionar con comodines de una paabra '%palabra%'
select * from actor where first_name like '%a' and last_name like '%n';
select * from actor where first_name like 'N%E';

-- Operadores con JOIN
-- INNER JOIN une dos tablas por un campo en común
select f.title, f.rental_duration, l.name as Idioma 
from film as f 
inner join language as l 
on f.language_id = l.language_id;

select a.address, c.city from 
address as a
inner join city as c
on a.city_id = c.city_id; 

select r.rental_id, s.first_name
from rental as r
inner join staff as s
on r.staff_id = s.staff_id;


-- RIGTH JOIN Mantiene todos los valores de la segunda tabla y hace match por un campo con la primera tabla
-- Los valores que hagan match tendrán ambos campos llenos y los demás seran campos nulos
select 
c.customer_id, c.first_name, c.last_name,
a.actor_id, a.first_name, a.last_name
from customer as c
right join actor as a
on c.last_name = a.last_name;
-- Mantiene todos los valores de actor y los une si el apellido es igual con el de customer


-- LEFT JOIN Mantiene todos los valores de la primera tabla y hace match por un campo con la segunda tabla
select
c.customer_id, c.first_name, c.last_name,
a.actor_id, a.first_name, a.last_name
from customer as c
left join actor as a
on c.last_name = a.last_name;

select a.address, s.store_id
from store as s
left join address a
on a.address_id = s.address_id;



-- Funciones SUM() devuelve el resultado de la suma de un solo campo
select sum(amount) from payment;

-- Funcion COUNT() devuelve la cantidad de un campo o de toda la tabla
select count(*) from payment;
select customer_id, count(customer_id) from payment group by customer_id;

-- Funcion AVG() promedio
select avg(amount) from payment;
select avg(rental_duration) from film;

-- Function MAX() y MIN()
select max(rental_duration) from film;
select min(rental_duration) from film;

