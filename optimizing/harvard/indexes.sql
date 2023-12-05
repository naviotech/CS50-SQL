CREATE INDEX "person_id" ON "students" ("id");

CREATE INDEX "satisfies_id" ON "satisfies" ("course_id, requirement_id");

CREATE INDEX "semester" ON "courses" ("semester");

CREATE INDEX "title" ON "courses" ("title");

CREATE INDEX "department" ON "courses" ("department");