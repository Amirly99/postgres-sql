CREATE TABLE person
(
    id   BIGSERIAL PRIMARY KEY,
    name VARCHAR(16)

);
INSERT INTO person
VALUES (DEFAULT, 'Tural'),
       (DEFAULT, 'Agil');
/*
SELECT name
from student
UNION
SELECT name
from person;


 */
 /*
SELECT name
from student
UNION ALL
SELECT name
from person;

  */



CREATE TABLE countries
(
    id     BIGSERIAL PRIMARY KEY,
    name   VARCHAR(100),
    budget DECIMAL

);
CREATE TABLE companies_profit
(
    id             BIGSERIAL PRIMARY KEY,
    name           VARCHAR(250),
    year           INT,
    money_turnover DECIMAL

);
SELECT COUNT(*)
FROM countries
WHERE budget < 300;


SELECT COUNT(DISTINCT name)
FROM countries
WHERE budget < 300;

SELECT AVG(budget)
FROM countries;

SELECT MIN(budget)
FROM countries;

SELECT MAX(budget)
FROM countries;
SELECT SUM(budget)
FROM countries;

SELECT year, SUM(money_turnover)
FROM companies_profit
GROUP BY year;
SELECT name, SUM(money_turnover)
FROM companies_profit
GROUP BY name
HAVING SUM(money_turnover) < 300;
