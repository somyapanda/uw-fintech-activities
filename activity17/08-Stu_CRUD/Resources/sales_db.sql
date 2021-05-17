--Create a table `sales` and define the correct column names and data types according to the `sales.csv`. Import the data from `sales.csv` using 
--the pgAdmin Import/Export tool.
CREATE TABLE sales(
	sales_id SERIAL PRIMARY KEY,
	payment_id INT,
	mortgage_id INT,
	loan_amount INT,
	loan_date DATE
);
DELETE FROM sales;
SELECT * FROM sales;
--Create a query to return the sales records with loan amounts less than $300,000.
SELECT * FROM sales
	WHERE loan_amount < 300000;
	
--Create a query to find the [average](https://www.w3schools.com/sql/sql_count_avg_sum.asp) loan amount of all the sales records.
SELECT AVG(loan_amount) 
	FROM sales
	
--Update the loan amount for sales_id 33 to $423,212.
UPDATE sales
	SET loan_amount = 423212
		WHERE sales_id = 33;

SELECT * FROM sales
	ORDER BY sales_id;

--Add a new boolean column `loan_distributed` that defaults to True.
ALTER TABLE sales
	ADD COLUMN loan_distributed BOOLEAN DEFAULT True;
	
SELECT * FROM sales

--Insert a new record into the sales table where the sales_id is 101, the payment_id is 101, the mortgage_id is 2, the loan_amount is $734544, 
--and the loan_date is `1995-10-05`.
INSERT INTO sales
	(sales_id, payment_id, mortgage_id, loan_amount, loan_date)
VALUES 
	(101, 101, 2, 734544, '1995-10-05');
	
SELECT * FROM sales
	ORDER BY sales_id;
	
--Delete the sales record where sales_id is 72.
DELETE FROM sales
	WHERE sales_id = 72;

















