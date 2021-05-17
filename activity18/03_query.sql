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
	
