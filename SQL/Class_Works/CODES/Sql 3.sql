SELECT COUNT(amount) AS num_transaction
FROM payment;
/*
AS DIYE NAME CHANGE KORLEO orginal name 
diye cl dite hobe
*/

SELECT customer_id, SUM (amount) AS total_spent
FROM payment
Group BY customer_id
HAVING SUM(amount)>100; 

SELECT customer_id, amount AS rental_amount
FROM payment
WHERE amount >2;

SELECT city_id , address AS from_Captial_city  from address 
WHERE city_id >300;


SELECT * FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id;

SELECT payment_id, payment.customer_id,
first_name FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id;


SELECT * from customer
FULL OUTER JOIN payment
ON customer.customer_id  = payment.customer_id
WHERE customer.customer_id is null
OR payment.payment_id is null;



SELECT * FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id;



SELECT film.film_id, title,inventory_id, store_id
FROM film 
LEFT JOIN inventory
ON film.film_id = inventory.film_id;



SELECT rental.staff_id, rental_id, rental_date
FROM rental
LEFT JOIN staff
ON rental.staff_id= staff.staff_id
WHERE rental.last_update ='2006-02-16 02:30:53' ;

SELECT store.store_id, last_name,store.address_id
FROM store
RIGHT JOIN customer
ON store.store_id= customer.store_id;

SELECT district, email FROM customer
INNER JOIN address
ON customer.address_id= address.address_id
WHERE district ILIKE '%CaliFornia';

SELECT title, film from film
FULL OUTER JOIN film_actor
ON film.film_id = film_actor.film_id
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id
WHERE actor.first_name ILIKE '%NICK' 
AND last_name ILIKE '%Wahlberg' ;
 
SELECT title,first_name, last_name, film FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id 
WHERE first_name ='Nick' 
AND last_name ='Wahlberg' ;
 





 
 