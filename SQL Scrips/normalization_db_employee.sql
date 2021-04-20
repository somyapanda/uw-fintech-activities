----# Employee Normalizer
--In this activity, you will be organizing improperly stored employee data into the three normal forms.
--In pgAdmin, create a new database called `normalization_db`.
CREATE DATABASE normalization_db;

--Create a new table `employee_normalization` according to the provided [employee_normalization.csv]
--(Resources/employee_normalization.csv), then import the csv into the `employee_normalization` table. 
DROP TABLE employee_normalization;
CREATE TABLE employee_normalization(
	employee_id INT,
	name VARCHAR(255),
	age INT,
	address VARCHAR(255),
	city VARCHAR(255),
	state CHAR(2),
	zip_code INT,
	email VARCHAR(255)
);

INSERT INTO employee_normalization
(employee_id, name, age, address, city, state, zip_code, email)
VALUES
(123, 'Robert Bale', 32, '31 Pelham Drive', 'Houston', 'TX', 77002, 'robert.bale51231@gmail.com, robbieman512@gmail.com'),
(456, 'Anya Strensa', 25, '142 Sunshine Road', 'Miami', 'FL', 33101, 'anya.strensa1412@gmail.com, soccergirl4251@gmail.com'),
(789, 'Arnold Tolenski', 43, '15 Silicon Avenue', 'San Francisco', 'CA', 94016, 'arnold.tolenski5121@gmail.com');

SELECT * FROM employee_normalization;

--Create a new table `first_nf_employee` and that organizes the data in `employee_normalization` 
--according to first normal form standards.
CREATE TABLE first_nf_employee(
	employee_id INT,
	name VARCHAR(255),
	age INT,
	address VARCHAR(255),
	city VARCHAR(255),
	state CHAR(2),
	zip_code INT,
	email VARCHAR(255)
);

INSERT INTO first_nf_employee(employee_id, name, age, address, city, state, zip_code, email)
VALUES 
(123, 'Robert Bale', 32, '31 Pelham Drive', 'Houston', 'TX', 77002, 'robert.bale51231@gmail.com'),
(123, 'Robert Bale', 32, '31 Pelham Drive', 'Houston', 'TX', 77002, 'robbieman512@gmail.com'),
(456, 'Anya Strensa', 25, '142 Sunshine Road', 'Miami', 'FL', 33101, 'anya.strensa1412@gmail.com'),
(456, 'Anya Strensa', 25, '142 Sunshine Road', 'Miami', 'FL', 33101, 'soccergirl4251@gmail.com'),
(789, 'Arnold Tolenski', 43, '15 Silicon Avenue', 'San Francisco', 'CA', 94016, 'arnold.tolenski5121@gmail.com');
SELECT * FROM first_nf_employee;

--Then, create two new tables `second_nf_employee` and `second_nf_employee_email` that organizes the data in 
--`first_nf_employee` according to second normal form standards.
DROP TABLE second_nf_employee;

CREATE TABLE second_nf_employee(
	employee_id INT PRIMARY KEY,
	name VARCHAR(255),
	age INT,
	address VARCHAR(255),
	city VARCHAR(255),
	state CHAR(2),
	zip_code INT
);
DELETE FROM second_nf_employee;
INSERT INTO second_nf_employee(employee_id, name, age, address, city, state, zip_code)
VALUES 
(123, 'Robert Bale', 32, '31 Pelham Drive', 'Houston', 'TX', 77002),
(456, 'Anya Strensa', 25, '142 Sunshine Road', 'Miami', 'FL', 33101),
(789, 'Arnold Tolenski', 43, '15 Silicon Avenue', 'San Francisco', 'CA', 94016);

SELECT * FROM second_nf_employee;

CREATE TABLE second_nf_employee_email(
	email_id INT PRIMARY KEY,
	employee_id INT,
	email VARCHAR(255)
);

INSERT INTO second_nf_employee_email
(email_id, employee_id, email)
VALUES
(1, 123, 'robert.bale51231@gmail.com'),
(2, 123, 'robbieman512@gmail.com'),
(3, 456, 'anya.strensa1412@gmail.com'),
(4, 456, 'soccergirl4251@gmail.com'),
(5, 789, 'arnold.tolenski5121@gmail.com');

--Lastly, create two new tables `third_nf_employee` and `third_nf_zipcode` that organizes the data in 
--`second_nf_employee` according to third normal form standards.
CREATE TABLE third_nf_employee(
	employee_id INT PRIMARY KEY,
	name VARCHAR(255),
	age INT,
	address VARCHAR(255),
	zip_code INT
);
INSERT INTO third_nf_employee(employee_id, name, age, address, zip_code)
VALUES 
(123, 'Robert Bale', 32, '31 Pelham Drive', 77002),
(456, 'Anya Strensa', 25, '142 Sunshine Road', 33101),
(789, 'Arnold Tolenski', 43, '15 Silicon Avenue', 94016);

SELECT * FROM third_nf_employee;

CREATE TABLE third_nf_zipcode(
	zip_code INT PRIMARY KEY,
	city VARCHAR(255),
	state CHAR(2)
);

INSERT INTO third_nf_zipcode( zip_code, city, state)
VALUES 
(77002, 'Houston', 'TX'),
(33101,'Miami', 'FL'),
(94016, 'San Francisco', 'CA');

SELECT * FROM third_nf_zipcode;


