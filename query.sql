-- Using the movie database, provide a SQL query that can be used to return the requested data for each problem described below:
--
-- Aggregations
--
-- Get the average rating for a movie
SELECT
    m.movieid,
    m.title,
    AVG(r.rating) AS averageRatting
FROM
    movies m
        JOIN
    ratings r ON m.movieid = r.movieid
WHERE
    m.movieid = 1
GROUP BY m.movieid

-- Get the total ratings for a movie
SELECT
    m.movieid,
    m.title,
    COUNT(r.rating) AS ratingsCount
FROM
    movies m
        JOIN
    ratings r ON m.movieid = r.movieid
WHERE
    m.movieid = 1
GROUP BY m.movieid

-- Get the total movies for a genre
SELECT
    COUNT(mg.genre_id) as comedyCount
FROM
    movie_genre mg;
   join genre g on g.id = mg.genre_id
   where genre_id = '2'
   group by

-- Get the average rating for a user
SELECT
    AVG(rating) AS avgRating
FROM
    movies.ratings
WHERE
    userid = '1'

-- Find the user with the most ratings
SELECT
    r.userid, COUNT(r.userid) AS userCount
FROM
    movies.ratings r
GROUP BY r.userid
ORDER BY userCount DESC
LIMIT 1

-- Find the user with the highest average rating
SELECT
    r.userid, AVG(r.rating) AS userAvg
FROM
    movies.ratings r
GROUP BY r.userid
ORDER BY userAvg DESC
LIMIT 1

-- Find the user with the highest average rating with more than 50 reviews
SELECT
    r.userid,
    AVG(r.rating) AS userAvg,
    COUNT(r.rating) AS usercount
FROM
    movies.ratings r
GROUP BY r.userid
HAVING usercount > '50'
ORDER BY userAvg DESC
LIMIT 1

-- Find the movies with an average rating over 4
SELECT
    m.movieid, m.title, AVG(r.rating) AS averageRating
FROM
    movies m
        JOIN
    ratings r ON m.movieid = r.movieid
GROUP BY m.movieid
HAVING averageRating >= '4'

-- For each genre find the total number of reviews as well as the average review sort by highest average review.
SELECT
    g.genres,
    g.id,
    AVG(r.rating) AS averageRating,
    COUNT(r.rating) AS ratingCount
FROM
    genre g
        JOIN
    movie_genre mg ON g.id = mg.genre_id
        JOIN
    ratings r ON mg.movieid = r.movieid
        JOIN
    movies m ON r.movieid = m.movieid
WHERE
    mg.movieid < 1000
	-- movieid limited to prevent timeout
GROUP BY g.genres
ORDER BY averageRating DESC

-- Joins

-- Find all comedies
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
    movies m
        JOIN
    tags t ON m.movieid = t.movieid
HAVING genres LIKE '%comedy%'
    AND t.tag LIKE '%death%'

-- Find any movies from either 2001 or 2002 with a title containing super
SELECT
    *
FROM
    movies.movies
WHERE
    (title LIKE '%(2001)'
        OR title LIKE '%(2002)')
        AND title LIKE '%super%'
