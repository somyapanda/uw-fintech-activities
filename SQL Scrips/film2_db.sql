---- Mine the Subqueries
--In this activity, you will continue to practice subqueries. Work individually or in pairs.
--Using subqueries, find the titles of films that the employee `Jon Stephens` rented to customers.
SELECT * FROM film LIMIT 100;
SELECT * FROM rental LIMIT 100;
SELECT * FROM staff LIMIT 100;
SELECT * FROM inventory LIMIT 100;
SELECT * FROM store LIMIT 100;
SELECT * FROM payment LIMIT 100;
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
				WHERE staff_id IN
					(
					SELECT staff_id
					FROM staff
					WHERE first_name = 'Jon'
					AND last_name = 'Stephens'
				)
			)
		)
			
	);
	
--Using subqueries, find the total rental amount paid for the film `ACE GOLDFINGER`
SELECT * FROM rental LIMIT 100;
SELECT * FROM payment LIMIT 100;
SELECT * FROM film LIMIT 100;
SELECT * FROM inventory LIMIT 100;
SELECT SUM(amount) AS total_amount
FROM payment
WHERE rental_id IN
	(
	SELECT rental_id 
	FROM rental
	WHERE inventory_id IN
		(
		SELECT inventory_id
		FROM inventory
		WHERE film_id IN
			(
			SELECT film_id 
			FROM film
			WHERE title = 'ACE GOLDFINGER'
			)
		)
	);





	