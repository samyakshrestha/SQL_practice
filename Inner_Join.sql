-- Query to retrieve the first name, last name, and film title
-- of films featuring the actor 'Nick Wahlberg'
-- This task requires joing three tables
SELECT 
    actor.first_name, 
    actor.last_name, 
    film.title
FROM 
    film_actor
INNER JOIN 
    actor
    ON film_actor.actor_id = actor.actor_id
INNER JOIN 
    film
    ON film.film_id = film_actor.film_id
WHERE 
    actor.first_name = 'Nick' 
    AND actor.last_name = 'Wahlberg';