SELECT * FROM customer LIMIT 100;
SELECT * FROM payment LIMIT 100;

-- Create customer revenue view
CREATE VIEW customer_revenues AS
SELECT first_name, last_name, COUNT(payment_id) AS payment_count, SUM(amount) AS payment_amount
FROM payment AS p
JOIN customer AS c ON 
p.customer_id = c.customer_id
GROUP BY first_name, last_name
ORDER BY SUM(amount) DESC;

-- Query customer revenue view
SELECT * FROM customer_revenues
	WHERE first_name = 'THERESA'
		AND last_name = 'WATSON';
		

-- BONUS
-- Create staff sales view
SELECT * FROM payment LIMIT 100;
SELECT * FROM staff LIMIT 100;
CREATE VIEW staff_sales AS 
SELECT staff_id, CAST(payment_date AS DATE), COUNT(payment_id) AS payment_count, SUM(amount) AS payment_amount
FROM payment
WHERE staff_id IN(
	SELECT staff_id 
		FROM staff
		WHERE first_name = 'Mike'
			AND last_name = 'Hillyer'
		)
	GROUP BY staff_id, CAST(payment_date AS DATE)
	ORDER BY payment_count DESC;


-- Query staff sales view
SELECT * FROM staff_sales
	WHERE payment_date='2005-07-31';
	