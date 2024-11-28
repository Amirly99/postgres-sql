CREATE TABLE  car
(
    id INT PRIMARY KEY ,
    name VARCHAR(100)

);


CREATE TABLE car_model
(
    id INT PRIMARY KEY ,
    model_name VARCHAR (100),
    car_id INT,
    FOREIGN KEY (car_id)REFERENCES car(id)

);
INSERT INTO car(id, name)
VALUES (1,'BMW');
INSERT INTO car(id, name)
VALUES (2,'Jeep')
;INSERT INTO car(id, name)
VALUES (3,'Jeep223');

INSERT INTO car_model (id, model_name, car_id)
VALUES (1,'BMW22',1);
INSERT INTO car_model (id, model_name, car_id)
VALUES (2,'Jeep22',2);
INSERT INTO car_model (id, model_name, car_id)
VALUES (3,'Jeep223',3);
SELECT b.model_name,a.name
FROM car a
INNER JOIN car_model b ON a.id =b.car_id;

SELECT b.id ,a.name
FROM car_model b
LEFT JOIN car a ON b.car_id =a.id;
SELECT b.id ,b.model_name, a.name
FROM car_model b
FULL JOIN  car a ON b.car_id =a.id;
SELECT b.id ,a.name
FROM car_model b
CROSS JOIN car a;