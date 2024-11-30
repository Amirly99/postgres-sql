CREATE TABLE phone
(
    id          INTEGER PRIMARY KEY,
    phone_model VARCHAR(256) UNIQUE,
    phone_mark  VARCHAR(256) NOT NULL,
    created_at  TIMESTAMP DEFAULT NOW()


);
CREATE TABLE phone_battery
(
    id               INTEGER PRIMARY KEY,
    battery_capacity VARCHAR(100) NOT NULL,
    phone_id         INT,
    FOREIGN KEY (phone_id) REFERENCES phone (id)
);
INSERT INTO phone(id, phone_model, phone_mark, created_at)
VALUES (1, 'IPhone', 'SE2020', DEFAULT);
INSERT INTO phone_battery(id, battery_capacity, phone_id)
VALUES (1, '300mhr', 1);

SELECT a.id, a.phone_model, a.phone_mark, a.created_at, b.phone_id
FROM phone_battery b
         INNER JOIN phone a ON b.phone_id = a.id;
SELECT a.id, a.phone_model, a.phone_mark, a.created_at, b.phone_id
FROM phone_battery b
         LEFT JOIN phone a ON b.phone_id = a.id;
SELECT b.phone_id, b.battery_capacity
FROM phone_battery b
         RIGHT JOIN phone a ON b.phone_id = a.id;


CREATE TABLE instagram_account
(
    id        BIGSERIAL PRIMARY KEY,
    user_name VARCHAR(256) UNIQUE
);
CREATE TABLE instagram_password
(
    id                   BIGSERIAL PRIMARY KEY,
    user_password        VARCHAR(256) UNIQUE,
    instagram_account_id INT,
    FOREIGN KEY (instagram_account_id) REFERENCES instagram_account (id)
);


INSERT INTO instagram_account(id, user_name)
VALUES (1, 'mark.hernandez');
INSERT INTO instagram_account(id, user_name)
VALUES (2, 'amirli_ragib');
INSERT INTO instagram_password(id, user_password, instagram_account_id)
VALUES (1, '********', 1);
INSERT INTO instagram_password(id, user_password, instagram_account_id)
VALUES (2, '*********', 2);
SELECT a.id, a.user_name, b.user_password, b.instagram_account_id
FROM instagram_password b
         INNER JOIN instagram_account a ON b.instagram_account_id = a.id;

CREATE TABLE departments
(
    department_id   INT PRIMARY KEY,
    department_name VARCHAR(50)
);
CREATE TABLE employees
(
    employee_id   INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments (department_id)
);
INSERT INTO departments(department_id, department_name)
VALUES (1, 'Akanji');
INSERT INTO departments(department_id, department_name)
VALUES (2, 'Ali');
INSERT INTO employees(employee_id, employee_name, department_id)
VALUES (1, 'pro', 1);
INSERT INTO employees(employee_id, employee_name, department_id)
VALUES (2, 'pro1', 1);
INSERT INTO employees (employee_id, employee_name, department_id)
VALUES (3, 'tech', 2);
SELECT a.department_id, a.department_name, b.employee_name, b.department_id, b.employee_id, b
FROM employees b
         INNER JOIN departments a ON b.department_id = a.department_id;
CREATE TABLE houses
(

    houses_id     INT PRIMARY KEY,
    houses_number VARCHAR(250)
);

CREATE TABLE buildings
(
    buildings_id           INT PRIMARY KEY,
    buildings_block_number INT
);
CREATE TABLE rooms
(

    houses_id    INT,
    buildings_id INT,
    PRIMARY KEY (houses_id, buildings_id),
    FOREIGN KEY (houses_id) REFERENCES houses (houses_id),
    FOREIGN KEY (buildings_id) REFERENCES buildings (buildings_id)

);
INSERT INTO houses(houses_id, houses_number)
VALUES (1,'12B');
INSERT INTO  buildings(buildings_id, buildings_block_number)
VALUES (1,124);
INSERT INTO rooms(houses_id, buildings_id)
VALUES (1,1);
SELECT a.houses_number,b.buildings_block_number,c.houses_id,c.buildings_id
FROM rooms c
INNER JOIN houses a ON c.houses_id=a.houses_id
INNER JOIN buildings b ON c.buildings_id = b.buildings_id;