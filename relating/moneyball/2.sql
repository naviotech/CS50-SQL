SELECT "year", CAST(AVG("salary")AS INT) AS "average salary" FROM "salaries"
WHERE "player_id" IN (
    SELECT "id" FROM "players" WHERE "first_name" = 'Cal' AND "last_name" = 'Ripken'
)
GROUP BY "year" ORDER BY "year" DESC;