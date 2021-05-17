CREATE TABLE actor(
	actor_id integer NOT NULL,
	first_name character varying(45) NOT NULL,
	last_name VARCHAR(45) NOT NULL,
	last_update timestamp without time zone DEFAULT now() NOT NULL
);

SELECT * FROM actor LIMIT 100;

DELETE * FROM actor;

