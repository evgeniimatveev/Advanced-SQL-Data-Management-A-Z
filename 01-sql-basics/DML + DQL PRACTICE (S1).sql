-- DML and DQL

-- # DML commands (Data Manipulation Language)
-- These commands are used to insert, update, delete, and merge data in the database.

-- Step 1: Selecting the company database for further operations
-- Ensure that the following operations are performed in the correct database.
USE company;

-- Step 2: Inserting records into the employees table
-- We're adding employee data to the employees table, one record at a time.

-- Inserting the first employee record
-- Adding Aman as a Manager with a salary of 20000.00, hired on 1995-02-02
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (1, 'Aman', 'Manager', 20000.00, '1995-02-02');

-- Inserting the second employee record
-- Adding Emily as a Developer with a salary of 25000.00, hired on 1998-08-15
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (2, 'Emily', 'Developer', 25000.00, '1998-08-15');

-- Inserting the third employee record
-- Adding John as a Designer with a salary of 22000.00, hired on 1990-01-10
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (3, 'John', 'Designer', 22000.00, '1990-01-10');

-- Inserting the fourth employee record
-- Adding Sarah as a Tester with a salary of 21000.00, hired on 1993-11-25
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (4, 'Sarah', 'Tester', 21000.00, '1993-11-25');

-- Inserting the fifth employee record
-- Adding Michael as a Project Manager with a salary of 30000.00, hired on 1985-04-15
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (5, 'Michael', 'Project Manager', 30000.00, '1985-04-15');

-- Inserting the sixth employee record
-- Adding Sophia as an HR Manager with a salary of 24000.00, hired on 1991-07-07
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (6, 'Sophia', 'HR Manager', 24000.00, '1991-07-07');

-- Inserting the seventh employee record
-- Adding David as a Developer with a salary of 26000.00, hired on 1996-05-14
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (7, 'David', 'Developer', 26000.00, '1996-05-14');

-- Inserting the eighth employee record
-- Adding Anna as a UI/UX Designer with a salary of 23500.00, hired on 1994-12-12
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (8, 'Anna', 'UI/UX Designer', 23500.00, '1994-12-12');

-- Inserting the ninth employee record
-- Adding James as a System Administrator with a salary of 27000.00, hired on 1988-02-20
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (9, 'James', 'System Administrator', 27000.00, '1988-02-20');

-- Inserting the tenth employee record
-- Adding Olivia as a Data Analyst with a salary of 28000.00, hired on 1992-09-30

INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (10, 'Olivia', 'Data Analyst', 28000.00, '1992-09-30');

-- Inserting the eleventh employee record
-- Adding Mia as a Marketing Specialist with a salary of 23000.00, hired on 1997-03-22
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (11, 'Mia', 'Marketing Specialist', 23000.00, '1997-03-22');

-- Inserting the twelfth employee record
-- Adding Lucas as a Business Analyst with a salary of 29000.00, hired on 1993-06-10
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (12, 'Lucas', 'Business Analyst', 29000.00, '1993-06-10');

-- Inserting the thirteenth employee record
-- Adding Isabella as a Customer Support Representative with a salary of 19000.00, hired on 1995-01-05
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (13, 'Isabella', 'Customer Support', 19000.00, '1995-01-05');

-- Inserting the fourteenth employee record
-- Adding Noah as a Network Engineer with a salary of 26500.00, hired on 1987-09-18
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (14, 'Noah', 'Network Engineer', 26500.00, '1987-09-18');

-- Inserting the fifteenth employee record
-- Adding Sophia as a Content Writer with a salary of 21500.00, hired on 1996-11-30
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (15, 'Sophia', 'Content Writer', 21500.00, '1996-11-30');

-- Inserting the sixteenth employee record
-- Adding Ethan as a Product Manager with a salary of 32000.00, hired on 1989-08-25
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (16, 'Ethan', 'Product Manager', 32000.00, '1989-08-25');

-- Inserting the seventeenth employee record
-- Adding Ava as a Financial Analyst with a salary of 27500.00, hired on 1991-10-11
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (17, 'Ava', 'Financial Analyst', 27500.00, '1991-10-11');

-- Inserting the eighteenth employee record
-- Adding William as a Sales Manager with a salary of 29500.00, hired on 1990-02-19
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (18, 'William', 'Sales Manager', 29500.00, '1990-02-19');

-- Inserting the nineteenth employee record
-- Adding Emma as a Recruiter with a salary of 25000.00, hired on 1995-12-03
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (19, 'Emma', 'Recruiter', 25000.00, '1995-12-03');

-- Inserting the twentieth employee record
-- Adding Mason as a Data Scientist with a salary of 34000.00, hired on 1992-04-04
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (20, 'Mason', 'Data Scientist', 34000.00, '1992-04-04');



-- Adding Liam as a Software Engineer with a salary of 28000.00, hired on 1990-07-12
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (21, 'Liam', 'Software Engineer', 28000.00, '1990-07-12');

-- Inserting the twenty-second employee record
-- Adding Charlotte as a Data Analyst with a salary of 29500.00, hired on 1992-11-01
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (22, 'Charlotte', 'Data Analyst', 29500.00, '1992-11-01');

-- Inserting the twenty-third employee record
-- Adding Benjamin as a DevOps Engineer with a salary of 31000.00, hired on 1988-03-15
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (23, 'Benjamin', 'DevOps Engineer', 31000.00, '1988-03-15');

-- Inserting the twenty-fourth employee record
-- Adding Evelyn as a Graphic Designer with a salary of 24500.00, hired on 1994-06-28
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (24, 'Evelyn', 'Graphic Designer', 24500.00, '1994-06-28');

-- Inserting the twenty-fifth employee record
-- Adding Henry as a Database Administrator with a salary of 33000.00, hired on 1986-05-04
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (25, 'Henry', 'Database Administrator', 33000.00, '1986-05-04');

-- Inserting the twenty-sixth employee record
-- Adding Aria as a Business Consultant with a salary of 29000.00, hired on 1993-01-23
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (26, 'Aria', 'Business Consultant', 29000.00, '1993-01-23');

-- Inserting the twenty-seventh employee record
-- Adding Elijah as a Full Stack Developer with a salary of 32000.00, hired on 1989-08-30
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (27, 'Elijah', 'Full Stack Developer', 32000.00, '1989-08-30');

-- Inserting the twenty-eighth employee record
-- Adding Lily as an HR Specialist with a salary of 24000.00, hired on 1995-02-07
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (28, 'Lily', 'HR Specialist', 24000.00, '1995-02-07');

-- Inserting the twenty-ninth employee record
-- Adding Sebastian as a Security Analyst with a salary of 28500.00, hired on 1991-12-22
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (29, 'Sebastian', 'Security Analyst', 28500.00, '1991-12-22');

-- Inserting the thirtieth employee record
-- Adding Zoe as a Product Designer with a salary of 27000.00, hired on 1997-09-18
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (30, 'Zoe', 'Product Designer', 27000.00, '1997-09-18');

-- Inserting the thirty-first employee record
-- Adding Gabriel as a Backend Developer with a salary of 31000.00, hired on 1990-10-10
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (31, 'Gabriel', 'Backend Developer', 31000.00, '1990-10-10');

-- Inserting the thirty-second employee record
-- Adding Grace as a Frontend Developer with a salary of 30000.00, hired on 1989-12-05
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (32, 'Grace', 'Frontend Developer', 30000.00, '1989-12-05');

-- Inserting the thirty-third employee record
-- Adding Samuel as a Systems Engineer with a salary of 33000.00, hired on 1987-04-17
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (33, 'Samuel', 'Systems Engineer', 33000.00, '1987-04-17');

-- Inserting the thirty-fourth employee record
-- Adding Victoria as a Data Engineer with a salary of 31500.00, hired on 1992-06-11
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (34, 'Victoria', 'Data Engineer', 31500.00, '1992-06-11');

-- Inserting the thirty-fifth employee record
-- Adding Jack as a Software Tester with a salary of 25000.00, hired on 1995-11-13
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (35, 'Jack', 'Software Tester', 25000.00, '1995-11-13');

-- Inserting the thirty-sixth employee record
-- Adding Scarlett as a Digital Marketing Manager with a salary of 29000.00, hired on 1993-03-27
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (36, 'Scarlett', 'Digital Marketing Manager', 29000.00, '1993-03-27');

-- Inserting the thirty-seventh employee record
-- Adding Daniel as an IT Support Specialist with a salary of 24000.00, hired on 1988-10-31
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (37, 'Daniel', 'IT Support Specialist', 24000.00, '1988-10-31');

-- Inserting the thirty-eighth employee record
-- Adding Madison as a Technical Writer with a salary of 26000.00, hired on 1994-07-19
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (38, 'Madison', 'Technical Writer', 26000.00, '1994-07-19');

-- Inserting the thirty-ninth employee record
-- Adding Matthew as a Lead Developer with a salary of 35000.00, hired on 1989-05-26
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (39, 'Matthew', 'Lead Developer', 35000.00, '1989-05-26');

-- Inserting the fortieth employee record
-- Adding Ella as an Operations Manager with a salary of 31000.00, hired on 1991-08-08
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (40, 'Ella', 'Operations Manager', 31000.00, '1991-08-08');

-- Inserting the forty-first employee record
-- Adding Joseph as a Network Administrator with a salary of 27000.00, hired on 1986-11-24
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (41, 'Joseph', 'Network Administrator', 27000.00, '1986-11-24');

-- Inserting the forty-second employee record
-- Adding Sofia as a Content Strategist with a salary of 28000.00, hired on 1996-02-16
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (42, 'Sofia', 'Content Strategist', 28000.00, '1996-02-16');

-- Inserting the forty-third employee record
-- Adding Oliver as a Cloud Architect with a salary of 34000.00, hired on 1993-09-02
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (43, 'Oliver', 'Cloud Architect', 34000.00, '1993-09-02');

-- Inserting the forty-fourth employee record
-- Adding Harper as an HR Coordinator with a salary of 24000.00, hired on 1995-04-29
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (44, 'Harper', 'HR Coordinator', 24000.00, '1995-04-29');

-- Inserting the forty-fifth employee record
-- Adding Alexander as a Machine Learning Engineer with a salary of 36000.00, hired on 1991-11-21
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (45, 'Alexander', 'Machine Learning Engineer', 36000.00, '1991-11-21');

-- Inserting the forty-sixth employee record
-- Adding Avery as an SEO Specialist with a salary of 24500.00, hired on 1994-08-14
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (46, 'Avery', 'SEO Specialist', 24500.00, '1994-08-14');

-- Inserting the forty-seventh employee record
-- Adding Mason as a Data Architect with a salary of 33500.00, hired on 1988-06-06
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (47, 'Mason', 'Data Architect', 33500.00, '1988-06-06');

-- Inserting the forty-eighth employee record
-- Adding Amelia as a Product Owner with a salary of 32500.00, hired on 1992-03-03
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (48, 'Amelia', 'Product Owner', 32500.00, '1992-03-03');

-- Inserting the forty-ninth employee record
-- Adding James as a UI Developer with a salary of 28000.00, hired on 1997-07-22
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (49, 'James', 'UI Developer', 28000.00, '1997-07-22');

-- Inserting the fiftieth employee record
-- Adding Abigail as a Technical Support with a salary of 22000.00, hired on 1990-11-15
INSERT INTO employees (id, name, position, salary, hire_date)
VALUES (50, 'Abigail', 'Technical Support', 22000.00, '1990-11-15')

-- # DQL command (Data Query Language)
-- The following command is used to retrieve data from the database.

-- Query to retrieve all records from the employees table
-- This will display all 10 records inserted above, showing the current data in the employees table.
SELECT * FROM employees;



