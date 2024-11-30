CREATE TABLE clock
(
    id          INTEGER PRIMARY KEY DEFAULT nextval('clock_id'),
    clock_name  VARCHAR(256),
    clock_color VARCHAR(100)
);
ALTER TABLE clock
    ADD CONSTRAINT clock_name_color UNIQUE (clock_name, clock_color);
CREATE SEQUENCE clock_id
    INCREMENT 2
    START 2;
INSERT INTO clock(ID, CLOCK_NAME, CLOCK_COLOR)
VALUES (nextval('clock_id'), 'Rolex', 'Blue');
SELECT *
FROM clock;
DELETE
FROM clock
WHERE id = 1;
INSERT INTO clock(ID, CLOCK_NAME, CLOCK_COLOR)
VALUES (nextval('clock_id'), 'Tissot', 'Black');
INSERT INTO clock(ID, CLOCK_NAME, CLOCK_COLOR)
VALUES (nextval('clock_id'), 'Nacar', 'White');
BEGIN;
UPDATE clock
SET clock_name='Welar'
WHERE id = 8;

SAVEPOINT my_save;

UPDATE clock
SET clock_name='Welar'
WHERE id = 2;

UPDATE clock
SET clock_name='Welar'
WHERE id = 20;
ROLLBACK TO my_save;
COMMIT;





SELECT COUNT(id)
FROM clock
WHERE id>2;
SELECT AVG(id)
FROM clock;
SELECT MAX(id)
FROM clock;
SELECT MIN(id)
FROM clock;
SELECT sum(id)
FROM clock;
SELECT DISTINCT (clock_name  )
FROM clock;
SELECT *
FROM clock
WHERE  clock_name LIKE '%ss%';
SELECT *
FROM clock
WHERE  clock_name LIKE 'Ti%';


ALTER TABLE clock
ADD COLUMN clock_money INT;
UPDATE clock
SET clock_money=22
WHERE id=6;
UPDATE clock
SET clock_money=24
WHERE id=2;
UPDATE clock
SET clock_money=28
WHERE id=8;
SELECT *
FROM clock;
SELECT year,SUM(clock_money)
FROM clock
GROUP BY year;
ALTER TABLE clock
ADD COLUMN year INT;
UPDATE clock
SET year=2020
WHERE id=2;
UPDATE clock
SET year=2022
WHERE id=8;
UPDATE clock
SET year=2022
WHERE id=6;
SELECT clock.year ,SUM(clock_money)
FROM clock
GROUP BY clock.year
HAVING SUM(clock_money)>40;
SELECT *
from clock
WHERE clock_money BETWEEN 20 AND 25;