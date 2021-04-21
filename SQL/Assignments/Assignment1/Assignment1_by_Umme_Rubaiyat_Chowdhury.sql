--COMPLETE THE FOLLOWING TASKS!
--1.Do we have actors in the actor table that share the full name and if yes display those shared names.
SELECT * FROM actor;
--Yes.
SELECT first_name, last_name  FROM actor;


--2. Return the customer IDs of customers who have spent at least $110 with the staff member who has 
--an ID of 2.
SELECT * FROM payment;
SELECT customer_id, SUM(amount) FROM payment 
	WHERE staff_id =2 
	GROUP BY customer_id 
	HAVING SUM (amount)>= 110;
	
	
--3. How many films begin with the letter J?
SELECT COUNT(title) FROM film
	WHERE (title) LIKE 'J'; 
	
--4. What customer has the highest customer ID number whose name 
--starts with an 'E' and has an address ID lower than 500?
SELECT * FROM customer;
SELECT customer_id, first_name, last_name, address_id FROM customer
	WHERE customer_id = (SELECT MAX (customer_id)FROM customer
	WHERE first_name LIKE 'E%' AND address_id<500 );	
	
--5. How many films have the word Truman somewhere in the title?
SELECT COUNT(title) FROM film
	WHERE title LIKE '%Truman%';
	
--6. Display the total amount payed by all customers in the payment table.
SELECT SUM(amount) FROM payment;

--7. Display the total amount payed by each customer in the payment table.
SELECT customer_id, SUM(amount) FROM payment
	GROUP BY customer_id;
	
	
-- 8. What is the highest total_payment done?
SELECT customer_id, SUM(amount) AS total_amount FROM payment
	GROUP BY customer_id
	ORDER BY SUM(amount) DESC LIMIT 1;

--9. Which customers have not rented any movies so far?
SELECT DISTINCT(customer_id) FROM customer
	WHERE customer_id NOT IN
	(SELECT DISTINCT(customer_id) FROM rental);
	
--10. How many payment transactions were greater than $5.00?
SELECT COUNT(amount) FROM payment
	WHERE amount > 5;