SELECT * FROM actor LIMIT 100;
SELECT * FROM address LIMIT 100;
SELECT * FROM city LIMIT 100;
SELECT * FROM country LIMIT 100;
SELECT * FROM customer LIMIT 100;
SELECT * FROM customer_list LIMIT 100;
SELECT * FROM film LIMIT 100;
SELECT * FROM film_actor LIMIT 100;
SELECT * FROM inventory LIMIT 100;
SELECT * FROM payment LIMIT 100;
SELECT * FROM rental LIMIT 100;
SELECT * FROM staff LIMIT 100;
SELECT * FROM store LIMIT 100;

--In this activity, you will practice writing queries with aggregate functions, grouping, and using aliases.
--1. What is the average payment amount?
SELECT * FROM payment;
SELECT AVG(amount) AS avg_payment_amt
	FROM payment;

--2. What is the total payment amount?
SELECT SUM(amount) AS total_payment_amt
	FROM payment;

--3. What is the minimum payment amount?
SELECT MIN(amount) AS min_payment_amt
	FROM payment;

--4. What is the maximum payment amount?
SELECT MAX(amount) AS max_payment_amt
	FROM payment;

--5. How many customers has each staff serviced?
SELECT * FROM payment;
SELECT staff_id, COUNT(customer_id) AS num_of_customer
	FROM payment
	GROUP BY staff_id;

--6. What is the count of payments for each customer?
SELECT customer_id, COUNT(payment_id) AS payment_count
	FROM payment 
	GROUP BY customer_id;
	

--7. Which customers have made over 40 payments?
SELECT customer_id, COUNT(payment_id) AS payment_count
	FROM payment
	GROUP BY customer_id
	HAVING COUNT(payment_id) > 40; 

----In this activity, you will use `ORDER BY` in combination with other SQL methods to query and order the `payment` table.
-- Find the count of payments per customer in descending order
SELECT * FROM payment LIMIT 100;	
SELECT customer_id, COUNT(payment_id) AS payment_count 
	FROM payment
	GROUP BY customer_id
	ORDER BY COUNT(payment_id) DESC;

-- Find the top 5 customers who have spend the most money
SELECT customer_id, SUM(amount) AS total_amount
	FROM payment
	GROUP BY customer_id
	ORDER BY total_amount DESC
	LIMIT 5;

-- Find the bottom 5 customers who have spend the least money
SELECT customer_id, SUM(amount) AS total_amount
	FROM payment
	GROUP BY customer_id
	ORDER BY total_amount ASC
	LIMIT 5;

-- Find the top 10 customers with the highest average payment
-- rounded to two decimal places
SELECT * FROM payment LIMIT 100;
SELECT customer_id, ROUND(AVG(amount), 2) AS avg_payment_amount
	FROM payment
	GROUP BY customer_id
	ORDER BY avg_payment_amount DESC
	LIMIT 10

-- BONUS 1
SELECT * FROM staff LIMIT 100;
SELECT * FROM payment LIMIT 100;

SELECT first_name, last_name, COUNT(p.customer_id) AS customer_count
	FROM payment AS p
	INNER JOIN staff AS s
	ON s.staff_id = p.staff_id
	GROUP BY first_name, last_name
	ORDER BY customer_count DESC;

-- BONUS 2
SELECT CAST(payment_date AS DATE) AS payment_date, COUNT(payment_id) AS payment_count
	FROM payment
	GROUP BY payment_date
	ORDER BY payment_count DESC;


----In this activity, you will practice creating subqueries.

-- 1. Find the customer first and last names of those who have made payments.
SELECT first_name, last_name
	FROM customer
	WHERE customer_id IN(
		SELECT customer_id
			FROM payment
);

-- 2. Find the staff email addresses of those who have helped customers make payments.
SELECT * FROM staff LIMIT 100;
SELECT email
	FROM staff
	WHERE staff_id IN(
		SELECT staff_id 
			FROM payment
);
		
-- 3. Find the rental records of all films that have been rented out and paid for.
SELECT * FROM rental LIMIT 100;
SELECT * FROM payment LIMIT 100;
SELECT * FROM rental
	WHERE rental_id IN(
		SELECT rental_id
			FROM payment
);

-- BONUS
--Find the titles of all films that have been rented out and paid for.
SELECT * FROM payment LIMIT 100;
SELECT * FROM rental LIMIT 100;
SELECT * FROM inventory LIMIT 100;
SELECT * FROM film LIMIT 100;

SELECT title
	FROM film 
	WHERE film_id IN 
		(
		SELECT film_id 
		FROM inventory
		WHERE inventory_id IN
		(
		SELECT inventory_id
		FROM rental
		WHERE rental_id IN
		(
		SELECT rental_id
		FROM payment 
		)
	)
);
