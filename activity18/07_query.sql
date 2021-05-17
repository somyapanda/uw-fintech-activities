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

