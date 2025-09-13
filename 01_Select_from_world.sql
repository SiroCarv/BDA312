/*
    Pregunta 1: Introduccion
*/
SELECT name, continent, population
FROM world;


/*
    Pregunta 2: Large Countries
*/
SELECT name
FROM world
WHERE population >=  200000000;


/*
    Pregunta 3: El GDP de los paises
*/
SELECT name, GDP/population as pc_gdp
FROM world
WHERE population >=  200000000;


/*
    Pregunta 4: South America Countries
*/
select name, population/1000000 as sudamerica
from world
where continent = 'South America';


/*
    Pregunta 5: Paises  Francia, Alemania, Italia
*/
select name, population
from world
where name in ( 'France', 'Germany', 'Italy');


/*
    Pregunta 6: Nombres relacionados con 'United'
*/
select name
from world
where name like 'United%';


/*
    Pregunta 7: Los Paies mas grandes 
*/
select name, population , area
from world
where area >= 3000000 or population >= 250000000;


/*
    Pregunta 8: Los paises incluidos
*/
select name, population , area
from world
where area >= 3000000
xor population >= 250000000;


/*
    Pregunta 9: Dos decimales en la Cantidad de Poblacion y GDP en Sudamerica
*/
select name, ROUND(population/1000000.0,2), ROUND(gdp/1000000000.0,2)
from world
where continent ='South America';


/*
    Pregunta 10: El PIB per cápita de los países con un billón de dólares, redondeado al millar de dólares más cercano
*/
SELECT
    name,
    ROUND(gdp / population, -3) AS per_capita_gdp
FROM
    world
WHERE 
    gdp >= 1000000000000;


/*
    Pregunta 11: Mostrar el nombre y la mayúscula donde el nombre y la mayúscula tienen el mismo número de caracteres
*/
SELECT name, capital
from world
where length(name) = length(capital);


/*
    Pregunta 12: Muestra el nombre y la capital donde las primeras letras de cada palabra coinciden. No incluyas países donde el nombre y la capital son la misma palabra.
*/
SELECT name, capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1)
    AND name <> capital;


/*
    Pregunta 13: Encuentra el país que tiene todas las vocales y ningún espacio en su nombre
*/
SELECT name
FROM world
WHERE name LIKE '%a%'
    AND name LIKE '%e%'
    AND name LIKE '%i%'
    AND name LIKE '%o%'
    AND name LIKE '%u%'
    AND name NOT LIKE '% %';