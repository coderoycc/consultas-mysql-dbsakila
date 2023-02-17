-- Sub QUERYS 
-- Instrucciones anidadas a otras
select title from film
where title like 'K%'
or title like 'Q%'
and title in (
	select title from film 	
	where language_id in 
		(
			select language_id from language
			where name = 'English'
		) 
);
 

select 
first_name, last_name
from actor
where actor_id in 
(
	select actor_id from film_actor
    where film_id in 
    (
		select film_id from film 
        where title = 'Alone Trip'
    )
);


select 
title 
from film
where film_id in 
(
	select film_id from film_category 
    where category_id in
    (
		select category_id from category 
        where name = 'Family'
    )
);


-- Seleccione el nombre completo y la dirección del correo electrónico de todos los clientes que hayan alquilado una película de acción
select * from film_category;
select * from category;
select * from rental;
select * from inventory;
select * from customer;

select concat_ws(' ',first_name, last_name) as 'Nombre Completo', email
from customer
where customer_id in 
(
	select customer_id from rental
    where inventory_id in
    (
		select inventory_id from inventory
        where film_id in
        (
			select film_id from film_category
            where category_id in
            (
				select category_id from category where name = 'Action'
            )
        )
    )
);


-- Todos los pagos que excedan el promedio para cada cliente junto con el recuento total de pagos que exceden el promedio
select * from payment;
select avg(amount) from payment as promedio;

select temp.customer_id, c.first_name, c.last_name, count(*) from
(
	select payment_id, amount, customer_id
	from payment
	where amount > (select avg(amount) from payment)
) as temp
inner join customer as c
on c.customer_id = temp.customer_id
group by temp.customer_id;



-- Creacion de VIEWS para acceder rapidamente a una consulta extensa usada con frecuencia
create view clientes_pagos_mayor_prom as
select temp.customer_id, c.first_name, c.last_name, count(*) from
(
	select payment_id, amount, customer_id
	from payment
	where amount > (select avg(amount) from payment)
) as temp
inner join customer as c
on c.customer_id = temp.customer_id
group by temp.customer_id;

select * from clientes_pagos_mayor_prom;

drop view clientes_pagos_mayor_prom; -- esto es para eliminar
