-->1
INSERT INTO "user_logs" ("type","old_username","new_username","old_password","new_password")
SELECT 'update', "admin", "admin",
            (SELECT "password" FROM "users" WHERE "username" = "admin") ,
            (SELECT "password" FROM "users" WHERE "username" = "emily33");
-->2
UPDATE "users"
SET
    "password" = "982c0381c279d139fd221fce974916e7"
WHERE
    "username" = "admin" AND "id" = 1;
-->3
DELETE FROM "user_logs" WHERE "type" = "update"
    AND "new_username" = "admin"
    AND "new_password" = "982c0381c279d139fd221fce974916e7";