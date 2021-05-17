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
	



