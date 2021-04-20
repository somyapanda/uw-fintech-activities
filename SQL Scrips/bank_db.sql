DROP TABLE banks;
--1. Create a new database named `bank_db`.
CREATE TABLE banks(
	bank_id SERIAL PRIMARY KEY,
	bank_name VARCHAR(50),
	bank_routing_number BIGINT
);

--2. Recreate the `banks` table using the following image.
INSERT INTO banks
	(bank_id, bank_name, bank_routing_number)
VALUES
	(1, 'Bank of America', 198491827),
	(2, 'Wells Fargo', 629873495),
	(3, 'JPMorgan Chase', 2340903984),
	(4, 'Citigroup', 890123900),
	(5, 'TD Bank', 905192010),
	(6, 'Capital One', 18469239),
	(7, 'Capital One', 18469239);

SELECT * FROM banks;

--3. Query the table to return the rows containing "Capital One", and then delete one of the duplicates.
SELECT * FROM banks 
	WHERE bank_name = 'Capital One';
	
DELETE FROM banks
	WHERE bank_id = 7;
	
--4. Insert a few more rows of data representing additional banks by adding the `bank_name` and `bank_routing_number` of your choice to the `banks` table.
INSERT INTO banks
	(bank_id, bank_name, bank_routing_number)
VALUES 
	(8, 'FirstTech', 234566234),
	(9, 'Union Bank', 294765238);
	
--5. Change the name of Citigroup to PNC Bank.
UPDATE banks 
	SET bank_name = 'PNC Bank'
	WHERE bank_id = 4;

SELECT * FROM banks 
	ORDER BY bank_id;
	
--6. Change the bank_routing_number for Wells Fargo to 1995826182.	
UPDATE banks
	SET bank_routing_number = 1995826182
		WHERE bank_name = 'Wells Fargo';
		
--* Research how to add columns to a table. Then create a Boolean column named `mortgage_lending` that has a default value of `true`.
ALTER TABLE banks
	ADD COLUMN mortgage_lending BOOLEAN default true;
	
	
