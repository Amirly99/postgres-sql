CREATE TABLE wolf
(
    id       BIGSERIAL PRIMARY KEY,
    address  VARCHAR(100) UNIQUE,
    color    VARCHAR(100) NOT NULL,
    happened TIMESTAMP DEFAULT now(),
    age      INT,
    weight   NUMERIC(100, 2)


);
ALTER TABLE wolf
    ADD CONSTRAINT wolf_age_weight UNIQUE (age, weight);
ALTER TABLE wolf
    DROP CONSTRAINT wolf_age_weight;
INSERT INTO wolf(id, address, color, happened, age, weight)
VALUES (1, 'Africa', 'Black', '2020-06-22', 2, 50.5);
UPDATE wolf
SET weight =60.5
WHERE id = 1;
INSERT INTO wolf (id, address, color, happened, age, weight)
VALUES (2, 'Asia', 'Blue', DEFAULT, 3, 61.50);
CREATE SEQUENCE next_id
    INCREMENT 3
    START 6;
CREATE TABLE phone
(
    id INTEGER PRIMARY KEY DEFAULT nextval('next_id'),
    name VARCHAR(256)
);
INSERT INTO phone (id, name)
VALUES (nextval('next_id'),'Samsung');
SELECT *
FROM phone;
DELETE
FROM phone
WHERE id=6;
INSERT INTO phone (id, name)
VALUES (nextval('next_id'),'Honor');