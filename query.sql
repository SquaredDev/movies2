-- This assignment is intended to get you more familiar with reading from a sql database. You will take the included sql and load the database. Then complete the normal mode objectives.
--
-- To import data into mysql:
--
-- Clone this repository: git clone git@github.com:overthemike/movies.git
-- cd into the movies folder
-- run this command: mysql -u root < movies.sql
-- Normal Mode
--
-- Complete the following query objectives:
--
-- Select all columns and rows from the movies table
SELECT
    *
FROM
    movies.movies

-- Select only the title and id of the first 10 rows
SELECT
    *
FROM
    movies.movies

-- Find the movie with the id of 485
SELECT
    *
FROM
    movies.movies
WHERE
    movieid = '485'

-- Find the id (only that column) of the movie Made in America (1993)
SELECT
    movieid
FROM
    movies.movies
WHERE
    title = 'Made in America (1993)'

-- Find the first 10 sorted alphabetically
SELECT
    *
FROM
    movies.movies
ORDER BY title DESC
LIMIT 10

-- Find all movies from 2002
SELECT
    *
FROM
    movies.movies
WHERE
    title LIKE '%(2002)'

-- Find out what year the Godfather came out
SELECT
    *
FROM
    movies.movies
   WHERE title LIKE 'godfather%'

-- Without using joins find all the comedies
SELECT
    *
FROM
    movies.movies
WHERE
    genres LIKE '%comedy%'

-- Find all comedies in the year 2000
SELECT
    *
FROM
    movies.movies
WHERE
    genres LIKE '%comedy%'
        AND title LIKE '%(2000)'

-- Find any movies that are about death and are a comedy
SELECT
    *
FROM
    movies.movies
WHERE
    genres LIKE '%comedy%'
        AND title LIKE '%death%'

-- Find any movies from either 2001 or 2002 with a title containing super
SELECT 
    *
FROM
    movies.movies
WHERE
    (title LIKE '%(2001)'
        OR title LIKE '%(2002)')
        AND title LIKE '%super%'

-- Hard Mode

-- Use concat and research about internet movie database to produce a valid url from the imdbid


-- Use concat and research about the movie database to produce a valid url from tmdbid


-- Using SQL, normalize the tags in the tags table. Make them lowercased and replace the spaces with '-'s
