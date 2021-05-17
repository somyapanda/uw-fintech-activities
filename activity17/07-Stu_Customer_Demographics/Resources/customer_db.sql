DROP TABLE customer;
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

SELECT * FROM customer;

SELECT COUNT(*) FROM customer;

SELECT * FROM customer
	WHERE gender = 'Female';

SELECT * FROM customer
	WHERE gender = 'Male' AND state = 'NJ';

SELECT * FROM customer
	WHERE gender = 'Male' AND (state = 'NJ' OR state = 'OH');
	
SELECT * FROM customer
	WHERE gender = 'Female' AND state = 'MD' AND age < 30;

