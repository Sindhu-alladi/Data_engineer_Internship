use sakila;
-- DDL Commands.....
CREATE TABLE film_review (
  review_id INT PRIMARY KEY,
  film_id INT,
  review_text VARCHAR(255)
);

ALTER TABLE film_review ADD rating INT;

INSERT INTO film_review
VALUES (1, 1, 'Good movie',9);

select * from film_review;

TRUNCATE TABLE film_review;

DROP TABLE film_review;

-- DML Commands....

SELECT actor_id, first_name, last_name FROM actor
LIMIT 5;

INSERT INTO actor (first_name, last_name)
VALUES ('Sindhu', 'Alladi');

SELECT actor_id, first_name, last_name FROM actor
ORDER BY actor_id DESC
LIMIT 5;

UPDATE actor SET last_name = 'SQL'
WHERE actor_id = 201;

/*DELETE FROM actor
WHERE first_name = 'Sindhu';*/

DELETE FROM actor
WHERE actor_id = 201;

-- TCL Commands...
DESCRIBE rental;

SET autocommit=0;
START TRANSACTION;

INSERT INTO rental (rental_date, inventory_id, customer_id, staff_id)
VALUES ('2026-01-29', 1, 1, 1);

SAVEPOINT sp1;

INSERT INTO rental (rental_date, inventory_id, customer_id, staff_id)
VALUES ('2026-01-29', 2, 1, 1);

SELECT rental_id, inventory_id,customer_id
FROM rental
ORDER BY rental_id DESC
LIMIT 3;

ROLLBACK TO sp1;

SELECT rental_id, inventory_id,customer_id
FROM rental
ORDER BY rental_id DESC
LIMIT 2;

COMMIT;

-- DCL Commands..
CREATE USER 'user1' IDENTIFIED BY 'password123';

GRANT SELECT ON sakila.actor TO 'user1';

REVOKE SELECT ON sakila.actor FROM 'user1';


















