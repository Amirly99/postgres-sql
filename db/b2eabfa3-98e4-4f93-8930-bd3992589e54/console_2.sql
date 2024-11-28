CREATE TABLE users
(
    user_id  INT PRIMARY KEY,
    username VARCHAR(50)
);
CREATE TABLE user_profiles
(
    profile_id   INT PRIMARY KEY,
    user_id      INT UNIQUE,
    profile_data VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);
INSERT INTO users(user_id, username)
VALUES (1, 'ragib_amirli');
INSERT INTO users(user_id, username)
VALUES (1, 'ragib_amirli');
INSERT INTO user_profiles(profile_id, user_id, profile_data)
VALUES (1, 1, '06:22:2024');
SELECT *
FROM user_profiles,
     users;
INSERT INTO users(user_id, username)
VALUES (2, 'ragib_amirli98');
INSERT INTO user_profiles(profile_data, user_id, profile_data)
VALUES (2, 2, '06:22:2025');
SELECT *
FROM users;
SELECT b.profile_data,a.username
FROM user_profiles b
INNER JOIN users a ON b.user_id=a.user_id;

CREATE TABLE son
(
    id      INT PRIMARY KEY,
    name    VARCHAR(256),
    surname VARCHAR(256),
    age     INT


);

CREATE TABLE father
(
    id      INT PRIMARY KEY,
    name    VARCHAR(100),
    surname VARCHAR(256),
    age     INT,
    son_id  INT UNIQUE,
    FOREIGN KEY (son_id) REFERENCES son (id)
);

INSERT INTO son(id, name, surname, age)
VALUES (1, 'Taleh', 'Baxsiyev', 24);
INSERT INTO father(id, name, surname, age, son_id)
VALUES (1, 'Barat', 'Baxsiyev', 44, 1);

CREATE TABLE student1
(
    id      INT PRIMARY KEY,
    name    VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    age     INT          NOT NULL


);
CREATE TABLE student_book
(
    id          INT PRIMARY KEY,
    book_name   VARCHAR(100) NOT NULL,
    student1_id INT,
    FOREIGN KEY (student1_id) REFERENCES student1 (id)

);
DROP table student_book;
DROP table student1;
INSERT INTO student1(id, name, surname, age)
VALUES (1, 'Tural', 'Isayev', 32);
INSERT INTO student1(id, name, surname, age)
VALUES (2, 'Ragib', 'Amirli', 27);
INSERT INTO student_book(id, book_name, student1_id)
VALUES (1, 'Java', 1);
INSERT INTO student_book(id, book_name, student1_id)
VALUES (2, 'Mysql', 1);
INSERT INTO student_book(id, book_name, student1_id)
VALUES (3, 'C++', 2);
INSERT INTO student_book(id, book_name, student1_id)
VALUES (4, 'Java Se', 2);
select *
from student1;
select *
from student_book;

CREATE TABLE book
(

    book_id   INT PRIMARY KEY,
    book_name VARCHAR(100)
);

CREATE TABLE book_page
(
    book_page_id INT PRIMARY KEY NOT NULL,
    page_number  INT             NOT NULL,
    book_id      INT             NOT NULL,
    FOREIGN KEY (book_id) REFERENCES book (book_id)

);
INSERT INTO book(book_id, book_name)
VALUES (1, 'JAVA');
INSERT INTO book(book_id, book_name)
VALUES (2, 'C++');
INSERT INTO book_page(book_page_id, page_number, book_id)
VALUES (1, 22, 1);
INSERT INTO book_page(book_page_id, page_number, book_id)
VALUES (2, 23, 1);


CREATE TABLE academy
(
    id         INT PRIMARY KEY NOT NULL,
    address    VARCHAR(250)    NOT NULL,
    created_at TIMESTAMP       NOT NULL
);
SELECT *
FROM academy;
