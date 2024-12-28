-- Calculate the total number of films for each rating category (R, PG, PG-13).
SELECT 
    -- Count the number of films with an 'R' rating
    SUM(CASE rating
            WHEN 'R' THEN 1   -- Add 1 to the sum if the film's rating is 'R'
            ELSE 0            -- Otherwise, add 0
        END) AS r,            -- Alias for the total number of 'R' rated films

    -- Count the number of films with a 'PG' rating
    SUM(CASE rating
            WHEN 'PG' THEN 1  -- Add 1 to the sum if the film's rating is 'PG'
            ELSE 0            -- Otherwise, add 0
        END) AS pg,           -- Alias for the total number of 'PG' rated films

    -- Count the number of films with a 'PG-13' rating
    SUM(CASE rating
            WHEN 'PG-13' THEN 1 -- Add 1 to the sum if the film's rating is 'PG-13'
            ELSE 0              -- Otherwise, add 0
        END) AS pg13           -- Alias for the total number of 'PG-13' rated films
FROM film                      -- Source table containing film information
