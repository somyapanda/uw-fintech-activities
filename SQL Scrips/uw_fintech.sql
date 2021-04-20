CREATE TABLE customer(
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30),
	gender VARCHAR(30),
	age INT,
	address VARCHAR(30),
	city VARCHAR(30),
	state CHAR(2),
	zip_code CHAR(5)
);

INSERT INTO customer
	(first_name, last_name, gender, age, address, city, state, zip_code)
VALUES 
	('Michael', 'Meyer', 'Male', 24, '1021 Eddie Knolls Apt. 087', 'South Geraldton', 'RI', 43709),
	('Cindy', 'Stephens', 'Female', 23, '838 Brown Street', 'East Christina', 'MT', 07829),
	('John', 'Jackson', 'Male', 34, '5318 Candice Motorway', 'Adkinstown', 'AZ', 89721),
	('Faith', 'Warari', 'Female', 21, 'Somewhere Near Seattle', 'Seattle', 'WA', 98055);

SELECT * FROM customer;
SELECT first_name FROM customer;
SELECT first_name, last_name FROM customer;

SELECT first_name, last_name 
	FROM customer
		WHERE (gender = 'Male' AND last_name = 'Meyer')
				OR age < 34;
		
	