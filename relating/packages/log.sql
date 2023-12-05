
-- *** The Lost Letter ***
SELECT "id", "type" FROM "addresses" WHERE "address" = "900 Somerville Avenue";
         --id: 432, type: Residential--
SELECT "id", "contents", "to_address_id" FROM "packages" WHERE "from_address_id" = 432;
         --id:384, content:Congratulatory letter, to_address_id:854--
SELECT "id", "action" FROM "scans" WHERE "package_id" = 384;
        --id:94. action:Drop.
SELECT "address_id" FROM "scans" WHERE "id" = 94;
        -- address id: 854.
SELECT "address","type" FROM "addresses" WHERE "id" = 854;
        -- 2 Finnigan Street, Residential--
-- *** The Devious Delivery ***
SELECT "id","contents", "from_address_id" FROM "packages" WHERE "from_address_id" IS NULL;
        --id  5098 content : Duck debugger.
SELECT "id","address_id","action" FROM "scans" WHERE "package_id" = 5098;
        --adrees_id 348.
SELECT "address","type" FROM "addresses" WHERE "id" = 348;
        --address: 7 Humboldt Place. type: Police Station.
-- *** The Forgotten Gift ***
SELECT "id", "type" FROM "addresses" WHERE "address" = "109 Tileston Street";
    --id: 9873 --
SELECT "id", "contents" FROM "packages" WHERE "from_address_id" = 9873;
   -- id:9523, content: Flowers--
SELECT "id", "action","address_id" FROM "scans" WHERE "package_id" = 9523;
-- id 12432, action: Pick, adres_id:7432--
SELECT "address","type" FROM "addresses" WHERE "id" = 7432;
--address: 950 Brannon Harris Way, type: Warehouse.
SELECT "id", "action","address_id","driver_id" FROM "scans" WHERE "package_id" = 9523;
--driver id: 17.--
SELECT "id", "name" FROM "drivers" WHERE "id" = 17;
-- name: Mikel.--
