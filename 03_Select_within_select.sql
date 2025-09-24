/* 
Pregunta 1 Bigger than 
*/
SELECT name FROM world
WHERE population > (SELECT population FROM world WHERE name='Russia')


/* 
Pregunta 2 Richer than UK
*/
SELECT name FROM world
WHERE continent = 'Europe'
AND gdp/population > 
(SELECT gdp/population FROM world
WHERE name = 'United Kingdom')


/* 
Pregunta 3 Neighbours of Argentina and Australia
*/
SELECT name, continent FROM world
WHERE continent IN 
(SELECT continent FROM world
WHERE name IN ('Argentina', 'Australia'))
ORDER BY name


/* 
Pregunta 4 Canada and Poland
*/
SELECT name, population FROM world 
WHERE population >
(SELECT population FROM world
WHERE name = 'United Kingdom')
AND population <
(SELECT population FROM world
WHERE name = 'Germany')


/* 
Pregunta 5 Percentages of Germany
*/
SELECT name, CONCAT(ROUND((population / (SELECT population FROM world WHERE name = 'Germany') * 100), 0), '%') AS prc_population FROM world
WHERE continent = 'Europe'


/* 
Pregunta 6 Bigger than every country in Europe
*/
SELECT name FROM world
WHERE gdp >
ALL(SELECT gdp FROM world
WHERE continent = 'Europe' AND gdp is NOT NULL)


/* 
Pregunta 7 Largest in each continent
*/
SELECT continent, name, area FROM world x
WHERE area >= ALL
(SELECT area FROM world y
WHERE y.continent=x.continent
AND area>0)


/* 
Pregunta 8 First country of each continent (alphabetically)
*/
SELECT continent, name FROM world x
WHERE name = 
(SELECT MIN(y.name) FROM world y
WHERE y.continent = x.continent)


/* 
Pregunta 9 Difficult Questions That Utilize Techniques Not Covered In Prior Sections
*/
SELECT name, continent, population FROM world
WHERE continent IN
(SELECT continent FROM world
GROUP BY continent
HAVING MAX(population) <= 25000000)


/* 
Pregunta 10 Three time bigger
*/
SELECT name, continent FROM world x
WHERE population > 3 * 
(SELECT MAX(y.population) FROM world y
WHERE y.continent = x.continent
AND y.name != x.name)