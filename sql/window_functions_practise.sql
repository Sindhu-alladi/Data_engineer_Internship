use sakila;

-- row_number
select * from film;
select title,length,row_number() over(
order by length) as length_row
from film where rating = 'R';

-- rank
select * from film;
select title,length,row_number() over(
order by length) as length_row,
rank() over(
order by length) as length_rank
from film where rating = 'R';

-- dense_rank
select * from film;
select title,length,row_number() over(
order by length) as length_row,
rank() over(
order by length) as length_rank,
Dense_rank() over(
order by length) as length_dense
from film where rating = 'R';


-- ntile
select customer_id,
sum(amount) as total_spent,
NTILE(4) over(
order by sum(amount)) as revenue_group
from payment
group by customer_id;

-- percent_rank
select title,length,
percent_rank() over(
order by length) as length_percent
from film
where rating = 'g';

-- first_value
select title,rating,length,
FIRST_VALUE(length) over (
partition by rating
order by length) as shortest_length from film;

-- last_value
select title,rating,length,
LAST_VALUE(length) over (
partition by rating
order by length) as longest_length from film;

select title,rating,length,
LAST_VALUE(length) over (
partition by rating
order by length
rows between unbounded preceding
and unbounded following) as longest_length from film;

-- lag and lead 
with monthly_revenue as(
select 
left(payment_date,7) as payment_month,
sum(amount) as revenue 
from payment
group by payment_month)
select payment_month,revenue,
LAG(revenue) over(order by payment_month) as previous_revenue,
LEAD(revenue) over(order by payment_month) as next_revenue
from monthly_revenue;








