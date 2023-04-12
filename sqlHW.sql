CREATE DATABASE skypro;
\c skypro;
CREATE TABLE employee
(
    id         BIGSERIAL   NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name  VARCHAR(50) nOT NULL,
    gender     VARCHAR(6)  NOT NULL,
    age        INT         NOT NULL
);
SELECT *
FROM employee;
INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Ivan', 'Ivanov', 'male', 32);
INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Liliya', 'Nosach', 'female', 31);
INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Alisa', 'Petrova', 'female', 18);
SELECT *
FROM employee;
UPDATE employee
SET first_name = 'Nikolay',
    last_name  = 'Nikolaev',
    age        = 33
WHERE first_name = 'Ivan';
SELECT *
FROM employee;
DELETE
FROM employee
WHERE id = 1;
SELECT *
FROM employee;

/*
* Задание 1
* 1. Доведите количество записей в таблице до 5.
*/
INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Ivan', 'Ivanov', 'male', 19);
INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Petr', 'Rakov', 'male', 33);
INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Zlata', 'Kong', 'female', 18);
SELECT *
FROM employee;

/*
 * 2. Получите информацию об именах и фамилиях по всем сотрудникам. Колонки должны называться «Имя» и «Фамилия».
 */
SELECT first_name AS Имя, last_name AS Фамилия
FROM employee;

/*
 * 3. Получите всю информацию о сотрудниках, которые младше 30 или старше 50 лет.
 */
SELECT *
FROM employee
WHERE age < 30
   OR age > 50;

/*
 * 4. Получите всю информацию о сотрудниках, которым от 30 до 50 лет.
 */
SELECT *
FROM employee
WHERE age BETWEEN 30 and 50;

/*
 * 5. Выведите полный список сотрудников, которые отсортированы по фамилиям в обратном порядке.
 */
SELECT *
FROM employee
ORDER BY last_name DESC;

/*
 * 6. Выведите сотрудников, имена которых длиннее 4 символов.
 */
SELECT *
FROM employee
WHERE LENGTH(first_name) > 4;

/*
 * Задание 2
 * 1. Измените имена у двух сотрудников так, чтобы на 5 сотрудников было только 3 разных имени,
 * то есть чтобы получились две пары тезок и один сотрудник с уникальным именем.
 */
UPDATE employee
SET first_name = 'Alisa'
WHERE id = 5;
UPDATE employee
SET first_name = 'Liliya'
WHERE id = 6;

/*
 * 2. Посчитайте суммарный возраст для каждого имени. Выведите в двух столбцах «имя» и «суммарный возраст».
 */
SELECT first_name AS Имя, SUM(age) AS Суммарный_возраст
FROM employee
GROUP BY Имя;

/*
 * 3. Выведите имя и самый юный возраст, соответствующий имени.
 */
SELECT first_name, age
FROM employee
WHERE age = (SELECT MIN(age) FROM employee);

/*
 * 4. Выведите имя и максимальный возраст только для неуникальных имен. Результат отсортируйте по возрасту в порядке возрастания.
 */
SELECT first_name AS имя, MAX(age) AS максимальный_возраст
FROM employee
GROUP BY first_name
HAVING COUNT(first_name) > 1;