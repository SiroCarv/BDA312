/* 
Pregunta 1 Modify it to show the matchid and player name for all goals scored by Germany. `
To identify German players, check for: teamid = 'GER'
*/
SELECT goal.matchid, goal.player
FROM eteam INNER JOIN goal
ON eteam.id = goal.teamid
WHERE id = 'GER'


/* 
Pregunta 2 Show id, stadium, team1, team2 for just game 1012
*/
SELECT id,stadium,team1,team2
FROM game WHERE id = 1012


/* 
Pregunta 3 Modify it to show the player, teamid, stadium and mdate for every German goal.
*/
SELECT goal.player, goal.teamid, game.stadium, game.mdate
  FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER'


/* 
Pregunta 4 Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
*/
SELECT game.team1, game.team2, goal.player
  FROM game JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%'


/* 
Pregunta 5 Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
*/
SELECT goal.player, goal.teamid,eteam.coach, goal.gtime
  FROM goal JOIN eteam on teamid=id
 WHERE gtime<=10


/* 
Pregunta 6 List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
*/
SELECT game.mdate, eteam.teamname
FROM game JOIN eteam ON (team1=eteam.id)
where coach = 'Fernando Santos' 


/* 
Pregunta 7 List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
*/
SELECT GOAL.PLAYER
FROM GOAL JOIN GAME ON(MATCHID = ID)
WHERE STADIUM = 'National Stadium, Warsaw'

/* 
Pregunta 8 Instead show the name of all players who scored a goal against Germany.
*/
SELECT DISTINCT goal.player
FROM goal
    JOIN game ON goal.matchid = game.id
WHERE goal.teamid != 'GER'
    AND (game.team1 = 'GER' OR game.team2 = 'GER')

/* 
Pregunta 9 Show teamname and the total number of goals scored.
*/
SELECT eteam.teamname, COUNT(*) as total_goals
FROM eteam
    JOIN goal ON eteam.id = goal.teamid
GROUP BY eteam.teamname

/* 
Pregunta 10 Show the stadium and the number of goals scored in each stadium.
*/
SELECT game.stadium, COUNT(goal.matchid) as numero_goles
FROM game
    JOIN goal ON game.id = goal.matchid
GROUP BY game.stadium

/* 
Pregunta 11 For every match involving 'POL', show the matchid, date and the number of goals scored.
*/
SELECT game.id as matchid, game.mdate, COUNT(goal.matchid) as goals_scored
FROM game
    JOIN goal ON game.id = goal.matchid
WHERE game.team1 = 'POL' OR game.team2 = 'POL'
GROUP BY game.id, game.mdate


/* 
Pregunta 12 For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
*/
SELECT game.id as matchid, game.mdate, COUNT(goal.matchid) as GER_goals
FROM game
    JOIN goal ON game.id = goal.matchid
WHERE goal.teamid = 'GER'
GROUP BY game.id, game.mdate

/* 
Pregunta 13 List every match with the goals scored by each team as shown. 
This will use "CASE WHEN" which has not been explained in any previous exercises.
*/
SELECT
    g.mdate,
    g.team1,
    SUM(CASE WHEN gl.teamid = g.team1 THEN 1 ELSE 0 END) as score1,
    g.team2,
    SUM(CASE WHEN gl.teamid = g.team2 THEN 1 ELSE 0 END) as score2
FROM game g
    LEFT JOIN goal gl ON g.id = gl.matchid
GROUP BY g.id, g.mdate, g.team1, g.team2
ORDER BY g.mdate, g.id, g.team1, g.team2