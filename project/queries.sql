-- Add a new user
INSERT INTO `users`(`first_name`,`last_name`,`address`,`registration_date`,`name_user`)
VALUES(`David`,`Garcia`,`davigarcia@gmail.com`, `2003-05-17`,`dr.david`);

--Add a new book
INSERT INTO `books`
    (`title`,`author`,`acquisition_date`,`isbn`,`language`,`quantity`,`quantity_avaiable`)
VALUES(`Harry Potter and the philosopher's stone`, `J.K Rowling`, `2000-01-31`, `978-0-13-359414-0`,
        `English`, `4`,`3`);

--Add a new loan
INSERT INTO `loans`(`user_id`, `book_id`,`loan_date`,`loan_status`)
VALUES(`1`, `1`,`2023-07-24`,`In progress`);

--Add a new genre
INSERT INTO `genres`(`name`)
VALUES
    (`Fantasy`),
    (`Adventure`);

--Add a genre of book
INSERT INTO `book_genre`(`book_id`,`genre_id`)
VALUES
    (`1`,`1`),
    (`1`,`2`);

--Search for books by genre
SELECT books.title, genres.name
FROM books
JOIN book_genre ON books.id = book_genre.book_id
JOIN genres ON book_genre.genre_id = genres.id
WHERE genres.name = `Fantasy`
GROUP BY genres.name
ORDER BY books.title;

--Search for books lent to a user
SELECT books.title, loans.loan_date, loans.return_date, loans.loan_status,
FROM loans
JOIN users ON loans.user_id = users.id
JOIN books ON loans.book_id = books.id
WHERE users.name_user = `dr.david`;

--Search for the oldest books
SELECT title, acquisition_date
FROM books
ORDER BY acquisition_date ASC;

--Search for books in Spanish
SELECT `title`, `author`
FROM `books`
WHERE language = `Spanish`
GROUP BY `author`
ORDER BY `author`;

--Subtract the number of books available according to loans
DELIMITER //
CREATE TRIGGER before_loan
BEFORE INSERT ON loans
FOR EACH ROW
BEGIN
    UPDATE `books`
    SET `quantity_available` = `quantity_available` - 1
    WHERE `id` = NEW.book_id AND `quantity_available` > 0;
END;
//
DELIMITER ;
--Add the number of books available according to loans
DELIMITER //
CREATE TRIGGER after_loan_update
AFTER UPDATE ON loans
FOR EACH ROW
BEGIN
    IF NEW.loan_status = `Returned` AND OLD.loan_status != `Returned` THEN
        UPDATE `books`
        SET `quantity_available` = `quantity_available` + 1
        WHERE `id` = NEW.book_id;
    END IF;
END;
//
DELIMITER ;