-- GROUP BY para agrupar las selecciones de acuerdo a un campo
select last_name from actor;
select last_name, count(*) from actor group by last_name;

select 
c.customer_id, c.first_name, c.last_name, sum(p.amount) as Total
from payment as p
inner join customer as c
on c.customer_id = p.customer_id
group by 1,2,3; 
-- Obtenemos la suma de cada cliente agrupando por los datos del cliente (columnas 1,2 y 3) 

select customer_id, max(rental_date) from rental group by customer_id;  

-- HAVING siempre acompañan a GROUP BY para poner alguna condición
select customer_id, count(*) 
from rental
group by customer_id
having count(*) < 15; 

select 
c.customer_id, c.first_name, c.last_name, sum(p.amount) as total
from payment as p 
inner join customer as c
on c.customer_id = p.customer_id
group by 1,2,3
having total < 100
order by total;

