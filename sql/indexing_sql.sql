use sakila;

show INDEX from customer;

select * from customer;

DESCRIBE table customer;

select * from information_schema.columns
where table_schema = 'sakila'
and table_name = 'customer';


explain select * from customer
where lower(email) = lower('ANGELA.HERNANDEZ@sakilacustomer.org');

-- index 
create INDEX idx_email on customer(email);

drop INDEX idx_email on customer;

explain select * from customer
where email = 'ANGELA.HERNANDEZ@sakilacustomer.org';

-- index on fk
show index from rental;
explain select * from rental where customer_id = 3;

create INDEX idx_rental on rental(customer_id);

-- joins 
explain select c.first_name,r.rental_date 
from customer c 
join rental r 
on c.customer_id = r.customer_id;

-- composite index 
create index idx_name on customer(last_name,first_name);

explain select * 
from customer 
where last_name = 'smith'
and first_name = 'mary';

explain select * 
from customer 
where first_name = 'mary';

-- full text index
show INDEX from film;

create FULLTEXT INDEX idx_description on film(description);

select * from film
where description like '%story%';

select title,description
from film
where match(description)
AGAINST('story');
