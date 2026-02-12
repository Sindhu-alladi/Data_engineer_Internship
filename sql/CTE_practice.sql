use sakila;

DESCRIBE customer;
select * from customer;

-- result of active customers 
with active_customers As(
select customer_id,first_name,last_name,active
from customer 
where active = 1)
select * from active_customers;

-- payments greater than avg_amount 
select * from payment;

with avg_payment as (
select avg(amount) as avg_amount from payment)
select payment_id,customer_id,amount from payment 
where amount > (select avg_amount from avg_payment);


with customer_payment as(
select customer_id,sum(amount) as total_amount
from payment
group by customer_id)
select customer_id,total_amount from customer_payment;

-- fim-actor 
with actor_film as (
select actor_id, film_id
from film_actor
)
select a.actor_id,CONCAT(a.first_name, ' ', a.last_name) AS actor_name,af.film_id
FROM actor_film af
JOIN actor a ON af.actor_id = a.actor_id;

-- information Schema
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'sakila';

SELECT column_name
FROM information_schema.columns
WHERE table_schema = 'sakila'
AND table_name = 'payment'
AND column_name = 'amount';








