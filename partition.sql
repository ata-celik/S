-- Creating a new table called film_partitioned
CREATE TABLE film_partitioned (
    film_id INT,
    title TEXT NOT NULL,
    release_year TEXT
) 
PARTITION BY LIST (release_year);

-- Creating the partitions for 2019, 2018, and 2017
CREATE TABLE film_2019
    PARTITION OF film_partitioned FOR VALUES IN ('2019');

CREATE TABLE film_2018
    PARTITION OF film_partitioned FOR VALUES IN ('2018');

CREATE TABLE film_2017
    PARTITION OF film_partitioned FOR VALUES IN ('2017');

-- Inserting the data into film_partitioned
INSERT INTO film_partitioned
SELECT film_id, title, release_year FROM film;

-- Output film_partitioned
SELECT * 
FROM film_partitioned;
