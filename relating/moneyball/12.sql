SELECT players.first_name, players.last_name FROM players
JOIN salaries ON salaries.player_id = players.id
JOIN performances ON performances.player_id = salaries.player_id AND performances.year = salaries.year
WHERE performances.year = 2001 AND performances.H != 0 AND performances.RBI != 0
AND salaries.salary/performances.H IN (
    SELECT salaries.salary/performances.H FROM salaries
    JOIN performances ON performances.year = salaries.year AND performances.player_id = salaries.player_id
    WHERE performances.H != 0 AND salaries.year = 2001
    ORDER BY salaries.salary/performances.H ASC
    LIMIT 10
)
AND salaries.salary/performances.RBI IN (
    SELECT salaries.salary/performances.RBI FROM salaries
    JOIN performances ON performances.year = salaries.year AND performances.player_id = salaries.player_id
    WHERE performances.RBI != 0 AND salaries.year = 2001
    ORDER BY salaries.salary/performances.RBI ASC
    LIMIT 10
)
ORDER BY players.id ASC;