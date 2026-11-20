-- State that the lecture scripts in 01-sql-basics expect (the CREATE steps of 02-dml-and-dql.sql,
-- before that script drops them again). Used only by the manual CI run.
CREATE DATABASE company;
USE company;
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(50),
    salary DECIMAL(10, 2)
);
ALTER TABLE employees ADD hire_date DATE;
