-- 1. My partner and I want to come by each of the stores in person and meet the managers.
-- Please send over the managers’ names at each store, with the full address of each property 
--(street address, district, city, and country please).
--Ans:
SELECT staff.first_name AS managers_first_name, staff.last_name AS managers_last_name, 
address.address, address.district,city.city,country.country 
FROM store 
LEFT JOIN staff  on  store.manager_staff_id = staff.staff_id
LEFT JOIN address on address.address_id =  store.address_id 
LEFT JOIN city on city.city_id  =  address.city_id
Left JOIN country on country.country_id = city.country_id;

-- 2.  I would like to get a better understanding of all of the inventory that would come along with the business.
-- Please pull together a list of each inventory item you have stocked, including the store_id number,
--the inventory_id , the name of the film, the film’s rating, its rental rate and replacement cost. 
--Ans:

SELECT inventory.store_id, inventory.inventory_id, film.title, film.rating, film.rental_rate,
film.replacement_cost From inventory
	INNER JOIN film
    ON inventory.film_id = film.film_id;

	
-- 3. From the same list of films you just pulled, please roll that data up and provide a summary level 
--overview of your inventory. We would like to know how many inventory items you have with
--each rating at each store.
--Ans:
SELECT  COUNT(inventory.inventory_id) AS inventory_items,inventory.store_id,
 film.rating From inventory
	INNER JOIN film
    ON inventory.film_id = film.film_id
	GROUP BY inventory.store_id, film.rating;
	
-- 4. Similarly, we want to understand how diversified the inventory is in terms of replacement cost.
-- We want to see how big of a hit it would be if a certain category of film became unpopular at a certain store. 
-- We would like to see the number of films, as well as the average replacement cost, and total replacement cost,
--sliced by store and film category.	 
--Ans:
SELECT inventory.store_id, category.name AS category, 
COUNT(film.film_id) AS films, AVG(film.replacement_cost),SUM(film.replacement_cost) 
FROM film
INNER JOIN film_category on film_category.film_id = film.film_id
INNER JOIN category on category.category_id = film_category.category_id
INNER JOIN inventory on film.film_id = inventory.film_id
GROUP BY inventory.store_id, category.name;

-- 5. We want to make sure you folks have a good handle on who your customers are.
-- Please provide a list of all customer names, which store they go to,
-- whether or not they are currently active, and their full addresses street address, city, and country.

--Ans:
SELECT customer.first_name || ''||customer.last_name AS name, customer.store_id,
customer.active, address.address, city.city, country.country
FROM customer
LEFT JOIN address ON customer.address_id = address.address_id
LEFT JOIN city ON address.city_id = city.city_id
LEFT JOIN country ON city.country_id = country.country_id;


-- 6. We would like to understand how much your customers are spending with you,
-- and also to know who your most valuable customers are. Please pull together a list of customer names,
-- their total lifetime rentals, and the sum of all payments you have collected from them.
-- It would be great to see this ordered on total lifetime value, with the most valuable customers 
--at the top of the list.
--Ans:
SELECT customer.first_name || ''||customer.last_name AS customer_names,COUNT(rental.rental_id) AS total_rentals,
SUM(payment.amount) AS total_payment
FROM customer
LEFT JOIN rental ON customer.customer_id = rental.customer_id
LEFT JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY customer_names
ORDER BY SUM(payment.amount) DESC;
 