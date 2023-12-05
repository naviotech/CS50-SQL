CREATE VIEW "agrupation" AS
SELECT "id", "sentence"
FROM "sentences"
WHERE "id" IN ("14","114","618", "630", "932", "2230", "2346","3041");
-->
CREATE VIEW "message" AS
SELECT
    CASE "agrupation"."id"
        WHEN '14' THEN substr("sentence", 98, 4)
        WHEN '114' THEN substr("sentence", 3, 5)
        WHEN '618' THEN substr("sentence", 72, 9)
        WHEN '630' THEN substr("sentence", 7, 3)
        WHEN '932' THEN substr("sentence", 12, 5)
        WHEN '2230' THEN substr("sentence", 50, 7)
        WHEN '2346' THEN substr("sentence", 44, 10)
        WHEN '3041' THEN substr("sentence", 14, 5)
        ELSE NULL
    END AS "phrase"
FROM "agrupation";