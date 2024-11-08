SELECT
    UPPER(c.name) || ': ' || f.title AS film_category,
    -- Truncate the description without cutting off a word
	-- Subtract the position of the first whitespace character
    LEFT(description, 50 - POSITION(' ' IN REVERSE(LEFT(description, 50))))
FROM
    film AS f
INNER JOIN film_category AS fc
    ON f.film_id = fc.film_id
INNER JOIN category AS c
    ON fc.category_id = c.category_id;
