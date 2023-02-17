-- ¿Quién ha vendido más del STAFF en agosto de 2005?
select s.first_name, s.last_name, sum(p.amount) as total
from staff s
inner join payment p 
on s.staff_id = p.staff_id
and p.payment_date like '2005-08%'
group by s.first_name, s.last_name;

-- Que apellidos en tabla ACTOR no se repiten
select last_name, count(*) 
from actor
group by last_name
having count(*) = 1;

-- Que actor ha apárecido en la mayoria de peliculas
select a.last_name, a.first_name, tmp.peliculas as cantidad from 
(
	select actor_id, count(*) as peliculas from film_actor
	group by actor_id
	order by count(*) desc
    limit 1
) as tmp
inner join actor a
on a.actor_id = tmp.actor_id;
-- Solucion opcional
-- select actor.actor_id, actor.first_name, actor.last_name,
--       count(actor_id) as film_count
-- from actor join film_actor using (actor_id)
-- group by actor_id
-- order by film_count desc;


-- INSERT insertar nuevos valores a una tabla
insert into city(city, country_id) values('Un nuevo valor',100);

-- UPDATE Actualizar un registro
update city set city = 'Nuevo Valor'
where country_id = 87;

-- ALTER TABLE para agregar una nueva columna a una tabla
alter table actor
add column genero_actor character(1);
	-- Eliminar la misma columna
alter table actor
drop column genero_actor;

