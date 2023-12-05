SELECT players.first_name, players.last_name, (salaries.salary/ performances.H) AS "dollars per hit"
FROM players
JOIN salaries ON salaries.player_id = players.id
JOIN performances ON performances.player_id = salaries.player_id AND performances.year = salaries.year
WHERE performances.H != 0 AND performances.year = 2001
ORDER BY (salaries.salary/ performances.H) ASC, players.first_name ASC, players.last_name ASC LIMIT 10;