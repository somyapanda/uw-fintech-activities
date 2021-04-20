DROP TABLE customer;

--2. Create a new table in the `customer_db` database called `customer`.
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	gender VARCHAR(10),
	age INT,
	address VARCHAR(100),
	city VARCHAR(50),
	state CHAR(2),
	zip_code INT
);

3. Import the data from the `customer.csv` file in the Resources folder.
SELECT * FROM customer;

SELECT COUNT(*) FROM customer;

--4. Create a query to return all female customers.
SELECT * FROM customer
	WHERE gender = 'Female';
	
--5. Create a query to return all male customers from New Jersey.
SELECT * FROM customer
	WHERE gender = 'Male' AND state = 'NJ';
	
--6. Create a query to return all male customers from New Jersey or Ohio.
SELECT * FROM customer
	WHERE gender = 'Male' AND (state = 'NJ' OR state = 'OH');
	
--Create a query to return all female customers from Maryland who are less than 30 years old.	
SELECT * FROM customer
	WHERE gender = 'Female' AND state = 'MD' AND age < 30;

