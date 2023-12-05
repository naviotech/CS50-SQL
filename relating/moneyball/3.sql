SELECT "year", "HR" FROM "performances"
WHERE "player_id" = (
    SELECT "id" FROM "players" WHERE "birth_year" = '1969' AND "first_name" = 'Ken'
) GROUP BY "year" ORDER BY "year" DESC;