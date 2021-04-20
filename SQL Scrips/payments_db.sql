--Use the the pgAdmin Import/Export tool to create the `payments` and `banks` tables:
CREATE TABLE payments(
	payment_id SERIAL PRIMARY KEY,
	bank_number BIGINT,
	bank_routing_number BIGINT,
	customer_id INT
);

CREATE TABLE banks(
	bank_id  SERIAL PRIMARY KEY,
	bank_name VARCHAR(50),
	bank_routing_number BIGINT
);

SELECT * FROM payments;
SELECT * FROM banks;
----Perform the correct join for each of the following use cases using the common `bank_routing_number` from the `payments` and `banks` tables:
--**Note:** Assume the `payments` table is the designated "left" table and the `banks` table is the designated "right" table.
--* Return all payment records with matching bank routing numbers in the banks table.
SELECT * FROM payments AS p
	INNER JOIN banks AS b 
		ON p.bank_routing_number = b.bank_routing_number;
		
--Return all payment records regardless if there is a matching bank routing number in the banks table.
SELECT * FROM payments AS p
	LEFT JOIN banks AS b 
		ON p.bank_routing_number = b.bank_routing_number;
		
--Return all bank records regardless if there is a matching bank routing number in the payments table.
SELECT * FROM payments AS p
	RIGHT JOIN banks AS b 
		ON p.bank_routing_number = b.bank_routing_number;	
		
--Return all records from both tables regardless if there is a matching bank routing number in either table.
SELECT * FROM payments AS p
	FULL OUTER JOIN banks AS b
		ON p.bank_routing_number = b.bank_routing_number;
		
--Return paired records from both tables where each row of the first table is paired with each row of the second table.
SELECT * FROM payments AS p
	CROSS JOIN banks AS b;

--Create a `customer` table and import the [customer.csv](Resources/customer.csv) dataset. Then, join the customer table with the payments and banks tables t0
--find the customers who have Wells Fargo bank accounts. Return the following columns:
DROP TABLE customer;
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	gender VARCHAR(30),
	age INT,
	address VARCHAR(50),
	city VARCHAR(50),
	state CHAR(2),
	zip_code CHAR(5)
);
SELECT * FROM customer;	
SELECT 
	p.payment_id,
	p.bank_number,
	p.bank_routing_number,
	b.bank_name,
	c.first_name,
	c.last_name
FROM payments AS p
	INNER JOIN banks AS b
		ON p.bank_routing_number = b.bank_routing_number
	INNER JOIN customer AS c
		ON p.customer_id = c.customer_id;



	
	
	
	



				