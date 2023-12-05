CREATE TABLE "users" (
        "id" INTEGER,
        "first_name" TEXT NOT NULL,
        "last_name" TEXT,
        "username" TEXT UNIQUE NOT NULL,
        "password" TEXT NOT NULL,
        PRIMARY KEY("id")
);

CREATE TABLE "schools" (
        "id" INTEGER,
        "name" TEXT NOT NULL,
        "type" TEXT,
        "location" TEXT,
        "year" INTEGER,
        PRIMARY KEY("id")
);

CREATE TABLE "companies" (
        "id" INTEGER,
        "name" TEXT NOT NULL,
        "industry" TEXT,
        "location" TEXT,
        PRIMARY KEY("id")
);

CREATE TABLE "conect_people" (
        "id" INTEGER,
        "user1" TEXT NOT NULL,
        "user2" TEXT NOT NULL,
        PRIMARY KEY("id"),
        FOREIGN KEY ("user1") REFERENCES "users"("id"),
        FOREIGN KEY ("user2") REFERENCES "users"("id")
);

CREATE TABLE "conect_school" (
        "id" INTEGER,
        "title" TEXT,
        "start" DATE,
        "end" DATE,
        "school_id" INTEGER,
        "user_id" INTEGER,
        PRIMARY KEY("id"),
        FOREIGN KEY ("school_id") REFERENCES "schools"("id"),
        FOREIGN KEY ("user_id") REFERENCES "users"("id")
);

CREATE TABLE "conect_companie" (
        "id" INTEGER,
        "title" TEXT,
        "start" DATE,
        "end" DATE,
        "companie_id" INTEGER,
        "user_id" INTEGER,
        PRIMARY KEY("id"),
        FOREIGN KEY ("companie_id") REFERENCES "companies"("id"),
        FOREIGN KEY ("user_id") REFERENCES "users"("id")
);