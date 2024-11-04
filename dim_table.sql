-- Creating a new table for dim_author with an author column
CREATE TABLE dim_author (
    author varchar(256) NOT NULL
);

-- Inserting authors
INSERT INTO dim_author
SELECT DISTINCT author FROM dim_book_star;

-- Adding a primary key
ALTER TABLE dim_author ADD COLUMN author_id SERIAL PRIMARY KEY;

-- Output the new table
SELECT * FROM dim_author;
