SELECT "first_name", "last_name", "height" AS "Above Average Height" FROM "players"
WHERE "height" > (SELECT AVG("height") FROM "players")
ORDER BY "height" DESC, "first_name" ASC, "last_name" ASC;