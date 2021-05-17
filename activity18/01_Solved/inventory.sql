SELECT * FROM film LIMIT 10;
SELECT * FROM inventory LIMIT 10;

SELECT title, film_id FROM film WHERE title = 'EARLY HOME';
SELECT * FROM inventory WHERE film_id = 268;

-- Retrieve Early Home 2

SELECT i.inventory_id, i.film_id, i.store_id
FROM inventory i
JOIN film f
ON (i.film_id = f.film_id)
WHERE f.title = 'EARLY HOME';

--Retrieve Early Home 1 as subquery
SELECT * FROM inventory i WHERE film_id = ( 
	SELECT film_id FROM film WHERE title = 'EARLY HOME'
);