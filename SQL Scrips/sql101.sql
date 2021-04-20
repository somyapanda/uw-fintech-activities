SELECT version();

SELECT current_date;

SELECT 2 + 2 AS plus, 2 *2 AS product;

CREATE TABLE weather(
	city	varchar(80),
	temp_lo	int,
	temp_hi int,
	prcp	real,
	date	date
);

CREATE TABLE cities(
	name		varchar(80),
	location	point
);

INSERT INTO weather
	VALUES 
		('San Francisco', 46, 50, 0.25, '1994-11-27');
		
INSERT INTO cities 
	VALUES ('Seattle', '(-184.0, 63.0)'),		 
		('San Francisco', '(-194.0, 53.0)');
		
INSERT INTO weather (city, temp_lo, temp_hi, prcp, date)    
	VALUES ('San Francisco', 43, 57, 0.0, '1994-11-29');
		
INSERT INTO weather (date, city, temp_hi, temp_lo)    
	VALUES ('1994-11-29', 'Hayward', 54, 37);
	
--Querying a Table

SELECT * FROM weather;

SELECT city, temp_lo, temp_hi, prcp, date FROM weather;

SELECT city, (temp_hi + temp_lo)/2 AS temp_avg, date FROM weather;

SELECT * FROM weather 
	WHERE city = 'San Francisco' AND prcp > 0.0;

SELECT * FROM weather
	ORDER BY city;

SELECT * FROM weather
	ORDER BY city, temp_lo;
	
SELECT city FROM weather;

SELECT DISTINCT city FROM weather;

--Join between Tables

SELECT * FROM weather, cities
	WHERE city = name;
	
SELECT city, temp_lo, temp_hi, prcp, date, location
	FROM weather, cities
		WHERE city = name;
		
SELECT w.city, w.temp_lo, w.temp_hi, w.prcp, w.date, c.location
	FROM weather w, cities c
		WHERE w.city = c.name;

SELECT * 
	FROM weather w INNER JOIN cities c ON (w.city = c.name);
	
SELECT * 
	FROM weather w LEFT OUTER JOIN cities c ON (w.city = c.name);
	
SELECT * 
	FROM weather w RIGHT OUTER JOIN cities c ON (w.city = c.name);

SELECT * 
	FROM weather w FULL OUTER JOIN cities c ON (w.city = c.name);
			
SELECT W1.city, W1.temp_lo AS low, W1.temp_hi AS high,
		W2.city, W2.temp_lo AS low, W2.temp_hi AS high
		FROM weather W1, weather W2
		WHERE W1.temp_lo < W2.temp_lo
		AND W1.temp_hi > W2.temp_hi;
		
--Aggregate Functions

SELECT max(temp_lo) FROM weather;

SELECT city FROM weather 
	WHERE temp_lo = (SELECT max(temp_lo) FROM weather);
	
SELECT city, max(temp_lo)
	FROM weather
	GROUP BY city;
	
SELECT city, max(temp_lo)
	FROM weather
	GROUP BY city
	HAVING max(temp_lo) < 40;

SELECT city, max(temp_lo)
	FROM weather
	WHERE city LIKE 'S%'
	GROUP BY city
	HAVING max(temp_lo) < 50;
	
--Updates

UPDATE weather
	SET temp_lo = temp_lo - 2, 
		temp_hi = temp_hi - 2
	WHERE date > '1994-11-28';
	
SELECT * FROM weather;

--Deletions

DELETE FROM weather WHERE city = 'Hayward';

SELECT * FROM weather;
