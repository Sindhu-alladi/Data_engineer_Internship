use sakila;

with customer_total as(
select customer_id,sum(amount) as total_amount
from payment group by customer_id)
select customer_id,total_amount,
RANK() over(order by total_amount ) as rank_value from customer_total;

with customer_total as(
select customer_id,sum(amount) as total_amount
from payment group by customer_id)
select customer_id,total_amount,
DENSE_RANK() over(order by total_amount ) as rank_value from customer_total;

-- cte with joins 
with customer_spending as(
select c.customer_id,c.first_name,
sum(p.amount) as total_spent,
RANK() over (order by sum(p.amount)) as spend_rank
from customer c 
join payment p on c.customer_id = p.customer_id
group by c.customer_id,c.first_name)
select *from customer_spending;

select *from rental;
-- rank on staff_rentals
with staff_rentals as(
select staff_id,count(rental_id) as total_rentals,
RANK() over (order by count(rental_id) ) as staff_rank
from rental group by staff_id )
select *from staff_rentals;

-- rank films 
with film_rank as(
select film_id,title,rental_rate,
RANK() over (order by rental_rate ) as price_rank
from film)
select * from film_rank;

with film_rank as(
select film_id,title,rental_rate,
DENSE_RANK() over (order by rental_rate ) as price_rank
from film)
select * from film_rank;

-- rank films length
with film_length as(
select film_id,title,length,
RANK() over (order by length) as length_rank
from film)
select * from film_length;

with film_length as(
select film_id,title,length,
DENSE_RANK() over (order by length) as length_rank
from film)
select * from film_length;

with film_length_rank as(
select film_id,title,length,
ROW_NUMBER() over (order by length) as row_number_value,
RANK() over (order by length) as rank_value,
DENSE_RANK() over (order by length) as dense_rank_value
from film)
select *from film_length_rank;









