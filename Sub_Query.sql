-- Select films that were rented and returned within a specific date range
SELECT f.film_id, f.title
FROM film f
WHERE f.film_id IN
(SELECT i.film_id
 -- Identify film IDs from the inventory table that match rentals
 FROM rental r
 INNER JOIN inventory i ON i.inventory_id = r.inventory_id 
 -- Filter for rentals with return dates in the specified range
 WHERE r.return_date BETWEEN '2005-05-17' AND '2005-05-29')
-- Order results alphabetically by film title
ORDER BY f.title;