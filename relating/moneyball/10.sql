SELECT players.first_name, players.last_name, salaries.salary,performances.HR, performances.year FROM players
JOIN salaries ON salaries.player_id = players.id
JOIN performances ON performances.player_id = salaries.player_id AND performances.year = salaries.year
ORDER BY players.id ASC,performances.year DESC, performances.HR DESC, salaries.salary DESC;