CREATE TABLE "ingredients" (
        "id" INTEGER,
        "donuts_id" TEXT NOT NULL,
        "name" TEXT NOT NULL,
        "price" DECIMAL(6,2),
        PRIMARY KEY("id"),
        FOREIGN KEY ("donuts_id") REFERENCES "donuts"("id")
);

CREATE TABLE "donuts" (
        "id" INTEGER,
        "name" TEXT NOT NULL,
        "gluten" TEXT CHECK ("gluten" IN ('free', 'yes')),
        "price" DECIMAL(10,2),
        "ingredient_id" INTEGER,
        PRIMARY KEY("id"),
        FOREIGN KEY("ingredient_id") REFERENCES "ingredients"("id")
);

CREATE TABLE "orders" (
        "id" INTEGER,
        "number" INTEGER,
        "donut_id" TEXT NOT NULL,
        "customer_id" INTEGER,
        PRIMARY KEY("id"),
        FOREIGN KEY ("customer_id") REFERENCES "customers"("id")
);

CREATE TABLE "customers" (
        "id" INTEGER,
        "first_name" TEXT NOT NULL,
        "last_name" TEXT,
        "order_id" INTEGER,
        PRIMARY KEY("id"),
        FOREIGN KEY("order_id") REFERENCES "orders"("id")
);

CREATE TABLE "donuts_ingredients"  (
        "donut_id" INTEGER,
        "ingredient_id" INTEGER,
        PRIMARY KEY("donut_id", "ingredient_id"),
        FOREIGN KEY("donut_id") REFERENCES "donuts"("id"),
        FOREIGN KEY("ingredient_id") REFERENCES "ingredients"("id")
);