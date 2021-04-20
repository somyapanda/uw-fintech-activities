----A View with a Roomful of Queries
--In this activity, you will work with a partner to practice your join and subquery skills, as well as build out a view.
--Write a query to get the number of payments and total payment amount for each customer in the `payment` table. 
--Make sure to pull the customer `first_name` and `last_name` from the `customer` table via a `JOIN`.
SELECT * FROM customer LIMIT 100;
SELECT * FROM payment LIMIT 100;
--Then, create a view named `customer_revenues` from the above query.
CREATE VIEW customer_revenues AS
SELECT first_name, last_name, COUNT(payment_id) AS payment_count, SUM(amount) AS payment_amount
FROM payment AS p
JOIN customer AS c ON 
p.customer_id = c.customer_id
GROUP BY first_name, last_name
ORDER BY SUM(amount) DESC;

-- Query the newly created `customer_revenues` view to find the revenues associated with customer 'THERESA WATSON'.
SELECT * FROM customer_revenues
	WHERE first_name = 'THERESA'
		AND last_name = 'WATSON';
		
-- Write a query to get the number of payments and total payment amount that the staff member 'Mike Hillyer' 
--has facilitated for each day in the `payment` table. Make sure to use a subquery instead of a join to do so.
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

--Query the newly created `staff_sales` view to find the sales for `staff_id` = 1 on the date `2005-07-31`.
SELECT * FROM staff_sales
	WHERE payment_date='2005-07-31';
	
