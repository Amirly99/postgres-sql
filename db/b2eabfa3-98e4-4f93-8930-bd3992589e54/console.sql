CREATE TABLE student
(
    id      BIGSERIAL PRIMARY KEY,
    name    VARCHAR(256),
    surname VARCHAR(256),
    number  VARCHAR(256),
    address VARCHAR(16),
    age     INT


);


ALTER TABLE student
    ADD COLUMN weight NUMERIC(16, 2);

ALTER TABLE student
    RENAME COLUMN surname TO sur_name;

ALTER TABLE student
    RENAME COLUMN sur_name TO surname;

COMMENT ON TABLE student IS 'Hello my friends';
COMMENT ON COLUMN student.name IS 'frist is name:Jon';
INSERT INTO student(name, surname)
VALUES ('Ragib', 'Amirli');
INSERT INTO student(name, surname)
VALUES ('Agil', 'Isayev');
UPDATE student
SET age=26
WHERE name = 'Ragib';
UPDATE student
SET age=32
WHERE name = 'Agil';
SELECT *
FROM student;
INSERT INTO student (name, surname)
VALUES ('Ragib', 'Isayev');
UPDATE student
SET age=44
WHERE id = 3;
SELECT age
FROM student;
SELECT AVG(age)
FROM student;
SELECT MIN(age)
FROM student;
SELECT MAX(age)
FROM student;
SELECT SUM(age)
FROM student;
SELECT name
FROM student
WHERE name='Ragib';
DELETE
FROM student
WHERE id=3;
INSERT INTO student (name, surname, number, address, age)
VALUES ('Maga','Mammedov',DEFAULT,DEFAULT,DEFAULT);
SELECT *
FROM student;
UPDATE student
SET number='9443553636'
Where name='Maga';

SELECT *
FROM student
WHERE age BETWEEN 26 AND 49;
UPDATE student
SET age=48
WHERE name='Ragib';
SELECT *
FROM student
WHERE id=1
OR id=2;
SELECT id,name
FROM student
WHERE id=1
OR name='Maga';
SELECT *
FROM student
WHERE  age=44
AND(name='Ragib'OR name='Agil');
SELECT *
FROM student
ORDER BY id ASC ;
SELECT DISTINCT name
FROM student;
SELECT name AS n,NOW()
FROM student;
SELECT *
FROM student
ORDER BY id DESC
LIMIT 4;
SELECT *
FROM student
WHERE name IN ('Ragib','Agil');

SELECT *
FROM student
WHERE name NOT IN ('Ragib','Agil');
SELECT *
FROM student
WHERE name LIKE '%ag%';
SELECT *
FROM student
WHERE name LIKE 'Ra%';
SELECT *
FROM student
WHERE name LIKE '%ib';
