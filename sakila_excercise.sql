USE sakila;
-- 1
SELECT first_name, last_name FROM actor;
-- 2
SELECT * FROM actor WHERE first_name LIKE '%John';
-- 3
SELECT * FROM actor WHERE last_name LIKE '%Neeson';
-- 4
SELECT * FROM actor WHERE actor_id % 10 = 0;
-- 5
SELECT * FROM film WHERE film_id = 100;
-- 6
SELECT * FROM film WHERE rating = 'R';
-- 7
SELECT * FROM film WHERE rating != 'R';
-- 8
SELECT * FROM film ORDER BY length ASC LIMIT 10;
-- 9
SELECT title FROM film;
-- 10
SELECT title FROM film WHERE special_features LIKE '%Deleted Scenes';
-- 11
SELECT l.* FROM actor l GROUP BY last_name HAVING COUNT(*) = 1;
-- 12
SELECT last_name, COUNT(*) FROM actor GROUP BY last_name HAVING COUNT(*) > 1;
-- 13
SELECT actor_id, COUNT(*) AS most_common FROM film_actor GROUP BY actor_id ORDER BY most_common DESC LIMIT 1;
SELECT * FROM film;

-- Ryan's Answer
-- SELECT first_name, last_name, COUNT(f.actor_id)
-- FROM actor a JOIN film_actor f ON a.actor_id=f.actor_id
-- GROUP BY a.actor_id
-- ORDER BY COUNT(f.actor_id) DESC LIMIT 1;

-- 14
SELECT * FROM inventory; -- Yes
-- 15 2006
SELECT title, release_year FROM film;
-- 16
SELECT AVG(length) FROM film;
-- 17
CREATE VIEW q17 AS
SELECT f.film_id, f.length, c.category_id FROM film f JOIN film_category c ON f.film_id = c.category_id;
SELECT * FROM q17;
-- 18
SELECT * FROM film_text;
SELECT * FROM film_text WHERE description LIKE '%robots'; -- none
-- 19
SELECT * FROM film ORDER BY length DESC LIMIT 5;
-- 20
SELECT * FROM film WHERE release_year = 2010;
-- 21, category id for horror is 11
SELECT * FROM category;
SELECT film_id FROM film_category WHERE category_id = 11;

-- 22
CREATE VIEW full_name 
AS 
	SELECT first_name, last_name, satff_id FROM staff WHERE staff_id = 1;
SELECT * FROM full_name;

-- 23
CREATE VIEW film_and_actors AS
SELECT a.actor_id, a.first_name, a.last_name, f.film_id, f.title
FROM actor a JOIN film f on a.actor_id = f.film_id;
SELECT * FROM film_and_actors;
SELECT title FROM film_and_actors WHERE first_name LIKE '%Fred' AND last_name LIKE '%Costner';
-- 24 solution from Ryan
SELECT COUNT(film_id), store_id FROM inventory
WHERE film_id = (SELECT film_id FROM film WHERE title = 'Bucket Brotherhood')
GROUP BY store_id;
-- 25
SELECT c.* FROM country c GROUP BY country HAVING COUNT(*) = 1;
-- 25.1
SELECT * FROM language ORDER BY name ASC;
-- 26
SELECT first_name, last_name FROM actor WHERE last_name LIKE '%son' ORDER BY first_name ASC;
-- 27 ??

-- 28 ??

-- 29 Sandra Kilmer
CREATE VIEW most_popular_actor2 AS
SELECT f.title, a.first_name, a.last_name FROM film f JOIN actor a ON f.film_id = a.actor_id;
SELECT first_name, last_name, COUNT(*) AS no_of_movies FROM most_popular_actor2 GROUP BY no_of_movies ORDER BY best_actor DESC LIMIT 1;