-- Representation of library users
CREATE TABLE `users`  (
    `id` INT AUTO_INCREMENT UNIQUE NOT NULL,
    `first_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32) NOT NULL,
    `address` VARCHAR(100) NOT NULL,
    `registration_date` DATE NOT NULL,
    `name_user` VARCHAR(32) NOT NULL UNIQUE,
    PRIMARY KEY(`id`)
);

--Representation of books in the library
CREATE TABLE `books`  (
    `id` INT AUTO_INCREMENT UNIQUE NOT NULL,
    `title` VARCHAR(250) NOT NULL,
    `author` VARCHAR(100) NOT NULL,
    `acquisition_date` DATE NOT NULL,
    `isbn` VARCHAR(20) UNIQUE,
    `language` VARCHAR(50),
    `quantity` TINYINT NOT NULL,
    `quantity_avaiable` TINYINT NOT NULL,
    `location` VARCHAR(20),
    PRIMARY KEY(`id`)
);

--Representation of borrowed books
CREATE TABLE `loans`  (
    `id` INT AUTO_INCREMENT NOT NULL,
    `user_id` INT NOT NULL,
    `book_id` INT NOT NULL,
    `loan_date` DATE NOT NULL,
    `return_date` DATE,
    `loan_status` ENUM(`In progress`,`Returned`),
    `notes` TEXT,
    PRIMARY KEY(`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`book_id`) REFERENCES `books`(`id`)
);

--Representation of books genre
CREATE TABLE `genres` (
    `id` INT AUTO_INCREMENT UNIQUE NOT NULL,
    `name` VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY(`id`)
);

--Representation of books genre multiple relationship
CREATE TABLE `book_genre` (
    `book_id` INT NOT NULL,
    `genre_id` INT NOT NULL,
    PRIMARY KEY (`book_id`, `genre_id`),
    FOREIGN KEY (`book_id`) REFERENCES `books`(`id`),
    FOREIGN KEY (`genre_id`) REFERENCES `genres`(`id`)
);
--Create index for efficiency
CREATE INDEX `index_books_title` ON `books` (`title`);
CREATE INDEX `index_user_id` ON `loans` (`user_id`);
CREATE INDEX `index_book_id` ON `loans` (`book_id`);