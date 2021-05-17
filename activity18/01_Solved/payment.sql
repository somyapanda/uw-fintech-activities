SELECT * FROM payment;

--1. What is the average payment amount?
SELECT AVG(amount) FROM payment;

--2. What is the total payment amount?
SELECT SUM(amount) FROM payment;

--3. What is the minimum payment amount?
SELECT MIN(amount) FROM payment;

--4. What is the maximum payment amount?
SELECT MAX(amount) FROM payment;

--5. How many customers has each staff serviced?
SELECT staff_id, COUNT(customer_id) FROM payment
	GROUP BY staff_id;

--6. What is the count of payments for each customer?
SELECT customer_id, COUNT(payment_id) FROM payment
	GROUP BY customer_id;
	
--7. Which customers have made over 40 payments?
SELECT customer_id, COUNT(payment_id) FROM payment
	GROUP BY customer_id 
	HAVING COUNT(payment_id) > 40; 

--1. Find the count of payments per customer in descending order.
SELECT COUNT(payment_id), customer_id FROM payment
	GROUP BY 

