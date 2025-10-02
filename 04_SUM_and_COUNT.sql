/* 
Pregunta 1 Total world population
*/
SELECT SUM(population) FROM world


/* 
Pregunta 2 List of continents
*/
SELECT distinct continent FROM world


/* 
Pregunta 3 GDP of Africa
*/
SELECT SUM(gdp) as "GPD" FROM world
WHERE continent = 'Africa'


/* 
Pregunta 4 Count the big countries
*/
SELECT COUNT(*) FROM world 
WHERE area >= 1000000


/* 
Pregunta 5 Baltic states population
*/
SELECT SUM(population) FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania')


/* 
Pregunta 6 Using GROUP BY and HAVING
*/
SELECT continent, COUNT(name) FROM world
GROUP BY continent


/* 
Pregunta 7 Counting big countries in each continent
*/
SELECT continent, COUNT(name) FROM world
WHERE population >= 10000000
GROUP BY continent


/* 
Pregunta 8 Counting big continents
*/
SELECT continent FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000