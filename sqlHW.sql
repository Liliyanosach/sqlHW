CREATE DATABASE skypro;
\c skypro;
CREATE TABLE employee(
                         id BIGSERIAL NOT NULL PRIMARY KEY,
                         first_name VARCHAR(50) NOT NULL,
                         last_name VARCHAR(50) nOT NULL,
                         gender VARCHAR(6) NOT NULL,
                         age INT NOT NULL
);
SELECT * FROM employee;
INSERT INTO employee (
    first_name, last_name, gender, age)
VALUES ('Ivan', 'Ivanov', 'male', 32);
INSERT INTO employee (
    first_name, last_name, gender, age)
VALUES ('Liliya', 'Nosach', 'female', 31);
INSERT INTO employee (
    first_name, last_name, gender, age)
VALUES ('Alisa', 'Petrova', 'female', 18);
SELECT * FROM employee;
UPDATE employee SET first_name = 'Nikolay', last_name = 'Nikolaev', age = 33 WHERE first_name = 'Ivan';
SELECT * FROM employee;
DELETE FROM employee WHERE id = 1;
SELECT * FROM employee;