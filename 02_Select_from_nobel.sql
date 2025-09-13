José Sebastian Carvajal Aguilera
fecha: 11/09/2025
Descripcion: consultas basicas en la base de datos Nobel


/*
Pregunta 1 Winners from 1950 
*/
    select yr, subject, winner
    from nobel
    where yr = 1950


/*
Pregunta 2 1962 Literature
*/
    select winner
    from nobel
    where yr = 1962
    and subject = 'Literature'


/*
Pregunta 3 Albert Einstein
*/
    select yr, subject
    from nobel
    where winner = "Albert Einstein"


/*
pregunta 4 Recent Peace Prizes
*/
    select winner
    from nobel
    where yr >= 2000
    and
    subject = "peace"


/*
pregunta 5 Literature in the 1980's
*/
    select yr, subject, winner
    from nobel
    where subject = 'literature'
    and yr between 1980 and 1989;


/*
pregunta 6 Only Presidents
*/
    select yr, subject, winner
    from nobel
    where winner in ('Theodore Roosevelt','Thomas Woodrow Wilson','Jimmy Carter','Barack Obama');


/*
pregunta 7 John
*/
    select winner
    from nobel
    where winner like 'John%'


/*
pregunta 8 Chemistry and Physics from different years
*/
    select yr, subject, winner
    from nobel
    where (subject = 'physics' and yr = 1980)
    or (subject = 'chemistry' and yr = 1984);


/*
pregunta 9 Exclude Chemists and Medics
*/
    select yr, subject, winner
    from nobel
    where yr = 1980
    and subject not in ('Chemistry' , 'Medicine')


/*
pregunta 10 Early Medicine, Late Literature
*/
    select yr, subject, winner
    from nobel
    where (subject = 'medicine' and yr < 1910)
    or (subject = 'literature' and yr >= 2004);


/*
pregunta 11 Harder Questions
*/
    select yr, subject, winner
    from nobel
    where winner = 'Peter Grünberg';


/*
pregunta 12 Apostrophe
*/
    select yr, subject, winner
    from nobel
    where winner = 'Eugene O''Neill'


/*
pregunta 13 Knights of the realm
*/
    select winner, yr, subject
    from nobel
    where winner like 'Sir%'
    order by yr desc, winner asc;


/*
pregunta 14 Chemistry and Physics last
*/
    select winner, subject FROM nobel
    where yr=1984
    order by
    case when subject in ('physics', 'chemistry') then 1 else 0 end, subject, winner