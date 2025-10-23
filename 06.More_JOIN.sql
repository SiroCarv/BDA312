/* 
Pregunta 1 List the films where the yr is 1962 and the budget is over 2000000 [Show id, title]
*/
SELECT id, title
 FROM movie
 WHERE yr=1962
AND budget > 2000000


/* 
Pregunta 2 Give year of 'Citizen Kane'
*/
SELECT yr
FROM movie
WHERE title = 'Citizen Kane'


/* 
Pregunta 3 List all of the Star Trek movies, include the id, title and yr (all of these movies start with the words Star Trek in the title). 
Order results by year.
*/
SELECT id, title, yr
FROM movie
WHERE title LIKE 'Star Trek%'
ORDER BY yr


/* 
Pregunta 4 What id number does the actor 'Glenn Close' have?
*/
SELECT id
FROM actor
WHERE name = 'Glenn Close'


/* 
Pregunta 5 What is the id of the 1942 film 'Casablanca'
*/
SELECT id
FROM movie
WHERE title = 'Casablanca'
AND yr = 1942


/* 
Pregunta 6 Obtain the cast list for 1942's 'Casablanca'.
what is a cast list?
The cast list is the names of the actors who were in the movie.
Use movieid=11768, (or whatever value you got from the previous question)
*/
SELECT actor.name
FROM casting
JOIN actor ON casting.actorid = actor.id
WHERE casting.movieid = 132689


/* 
Pregunta 7 Obtain the cast list for the film 'Alien'
*/
SELECT name
FROM actor
JOIN casting ON actor.id = casting.actorid
JOIN movie ON casting.movieid = movie.id
WHERE movie.title = 'Alien'


/* 
Pregunta 8 List the films in which 'Harrison Ford' has appeared
*/
SELECT title
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE actor.name = 'Harrison Ford'


/* 
Pregunta 9 List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. 
If ord=1 then this actor is in the starring role]
*/
SELECT title
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE actor.name = 'Harrison Ford'
  AND casting.ord != 1


/* 
Pregunta 10 List the films together with the leading star for all 1962 films.
*/
SELECT movie.title, actor.name
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE movie.yr = 1962
  AND casting.ord = 1


/* 
Pregunta 11 Which were the busiest years for 'Rock Hudson', show the year and the number of movies 
he made each year for any year in which he made more than 2 movies.
*/
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2


/* 
Pregunta 12 List the film title and the leading actor for all of the films 'Julie Andrews' played in.
Did you get "Little Miss Marker twice"?
Julie Andrews starred in the 1980 remake of Little Miss Marker and not the original(1934).
Title is not a unique field, create a table of IDs in your subquery
*/
SELECT title, name
FROM movie JOIN casting ON (movieid=movie.id
AND ord=1)
JOIN actor ON (actorid=actor.id)
WHERE movie.id IN (
SELECT movieid FROM casting
WHERE actorid IN (
SELECT id FROM actor
WHERE name='Julie Andrews'))


/* 
Pregunta 13 Obtain a list, in alphabetical order, 
of actors who've had at least 15 starring roles.
*/
SELECT name
FROM actor
JOIN casting ON id = actorid
WHERE ord = 1
GROUP BY id, name
HAVING COUNT(*) >= 15
ORDER BY name ASC;


/* 
Pregunta 14 List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
*/
SELECT movie.title, COUNT(casting.actorid)
FROM movie
LEFT JOIN casting ON movie.id = casting.movieid
WHERE movie.yr = 1978
GROUP BY movie.id, movie.title
ORDER BY COUNT(casting.actorid) DESC, movie.title;


/* 
Pregunta 15 List all the people who have worked with 'Art Garfunkel'.
*/
SELECT DISTINCT name
FROM actor
JOIN casting ON actor.id = casting.actorid
WHERE casting.movieid IN (
  SELECT movieid
  FROM casting
  JOIN actor ON casting.actorid = actor.id
  WHERE actor.name = 'Art Garfunkel'
)
AND actor.name != 'Art Garfunkel'