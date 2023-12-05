.import --csv meteorites.csv temp

CREATE TABLE "meteorites" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "class" TEXT NOT NULL,
    "discovery" TEXT NOT NULL CHECK ("discovery" IN ('Fell', 'Found')),
    "mass" DECIMAL(10, 2),
    "lat" DECIMAL(10, 2),
    "long" DECIMAL(10, 2),
    "year" INTEGER,
    PRIMARY KEY("id")
);


UPDATE "temp"
SET "long" = NULL WHERE "long" = '';

UPDATE "temp"
SET "lat" = NULL WHERE "lat" = '';

UPDATE "temp"
SET "year" = NULL WHERE "year" = '';

UPDATE "temp"
SET "mass" = NULL WHERE "mass" = '';

UPDATE "temp"
SET "lat" = ROUND("lat",2), "long" = ROUND("long",2), "mass" = ROUND("mass",2);

DELETE FROM "temp" WHERE "nametype" = "Relict";


INSERT INTO meteorites("name","class", "discovery", "mass", "lat", "long", "year")
SELECT "name","class", "discovery", "mass", "lat", "long", "year"
FROM temp
ORDER BY "year" ASC, "name" ASC;
-->
DROP TABLE "temp";