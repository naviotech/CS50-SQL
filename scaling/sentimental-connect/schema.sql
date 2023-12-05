
CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32) NOT NULL,
    `name_user` VARCHAR(32) NOT NULL UNIQUE,
    `password` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `schools`  (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL UNIQUE,
    `type` ENUM(`Primary`, `Secondary`,`Higher Education`) NOT NULL,
    `location` VARCHAR(32) NOT NULL,
    `year` YEAR NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `companies` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL UNIQUE,
    `industry` ENUM(`Technology`,`Education`,`Business`) NOT NULL,
    `location` VARCHAR(32) NOT NULL,
);

CREATE TABLE `conect_people` (
        `id` INT AUTO_INCREMENT,
        `user1` VARCHAR(32) NOT NULL UNIQUE,
        `user2` VARCHAR(32) NOT NULL UNIQUE,
        PRIMARY KEY(`id`),
        FOREIGN KEY (`user1`) REFERENCES `users`(`id`),
        FOREIGN KEY (`user2`) REFERENCES `users`(`id`)
);

CREATE TABLE `conect_school` (
        `id` INT AUTO_INCREMENT,
        `title` VARCHAR(8),
        `start` DATE,
        `end` DATE,
        `school_id` INT NOT NULL UNIQUE,
        `user_id` INT NOT NULL UNIQUE,
        PRIMARY KEY(`id`),
        FOREIGN KEY (`school_id`) REFERENCES `schools`(`id`),
        FOREIGN KEY (`user_id`) REFERENCES `users`(`id`)
);

CREATE TABLE "conect_companie" (
        `id` INT AUTO_INCREMENT,
        `title` VARCHAR(8),
        `start` DATE,
        `end` DATE,
        `companie_id` INT NOT NULL UNIQUE,
        `user_id` INT NOT NULL UNIQUE,
        PRIMARY KEY(`id`),
        FOREIGN KEY (`companie_id`) REFERENCES `companies`(`id`),
        FOREIGN KEY (`user_id`) REFERENCES `users`(`id`)
);