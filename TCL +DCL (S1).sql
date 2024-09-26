-- Comprehensive Guide: Using COMMIT, ROLLBACK, GRANT, and REVOKE in SQL

-- Step 1: Creating the 'employees_DCL' table
CREATE TABLE employees_DCL (
    id INT PRIMARY KEY,           -- Primary key to uniquely identify each employee
    name VARCHAR(100),            -- Name of the employee
    position VARCHAR(50),         -- Job title or position of the employee
    salary DECIMAL(10,2),         -- Salary of the employee with two decimal places
    hire_date DATE                -- Date when the employee was hired
);

-- Step 2: Inserting data into the 'employees_DCL' table
INSERT INTO employees_DCL (id, name, position, salary, hire_date) VALUES
(1, 'Alex', 'Product Manager', 22000.00, '2001-03-10'),
(2, 'Jessica', 'Software Engineer', 26000.00, '2003-08-19'),
(3, 'Mark', 'Graphic Designer', 24000.00, '1998-10-12'),
(4, 'Samantha', 'QA Engineer', 21500.00, '2000-05-21'),
(5, 'Chris', 'Project Lead', 31000.00, '1997-04-30'),
(6, 'Natalie', 'HR Coordinator', 24500.00, '1999-03-22'),
(7, 'Peter', 'Backend Developer', 27000.00, '2002-07-16'),
(8, 'Laura', 'UX Designer', 25000.00, '2001-11-03'),
(9, 'Kevin', 'IT Support', 27500.00, '1998-02-14'),
(10, 'Sophia', 'Business Analyst', 29500.00, '2000-01-26'),
(11, 'Chloe', 'Marketing Coordinator', 23500.00, '2003-12-09'),
(12, 'Ryan', 'Data Scientist', 31000.00, '1999-09-17'),
(13, 'Eva', 'Customer Service Rep', 20000.00, '2001-06-04'),
(14, 'Jack', 'Network Specialist', 28000.00, '1997-11-07'),
(15, 'Isabella', 'Content Strategist', 22500.00, '2002-10-13'),
(18, 'Liam', 'Sales Executive', 30500.00, '1999-05-01'),
(19, 'Emily', 'Talent Acquisition', 26000.00, '2000-04-27'),
(20, 'Aiden', 'Data Engineer', 35500.00, '2001-07-09'),
(21, 'Lily', 'Software Developer', 29000.00, '1999-02-23'),
(22, 'Grace', 'Data Analyst', 31000.00, '2003-03-14'),
(23, 'Benjamin', 'Cloud Architect', 32500.00, '1998-06-11'),
(24, 'Olivia', 'Visual Designer', 25000.00, '2000-09-19'),
(25, 'Henry', 'Database Specialist', 34000.00, '1997-12-22'),
(26, 'Mason', 'Consultant', 30000.00, '2002-11-16'),
(27, 'Oliver', 'Full Stack Engineer', 33000.00, '2003-05-31'),
(28, 'Mia', 'HR Specialist', 24500.00, '2000-06-15'),
(33, 'Samuel', 'Systems Analyst', 34000.00, '1999-08-21'),
(38, 'Charlotte', 'Technical Writer', 27500.00, '2001-10-29'),
(47, 'Lucas', 'Infrastructure Engineer', 35000.00, '1998-12-04'),
(49, 'Ethan', 'UI Developer', 29500.00, '2004-02-18'),
(50, 'Abigail', 'Support Engineer', 23000.00, '1999-03-07');

-- Step 3: Viewing the data to verify insertion
SELECT * FROM employees_DCL;

-- Example 1: Basic Update with COMMIT and ROLLBACK
BEGIN;
UPDATE employees_DCL
SET salary = salary * 1.07
WHERE position = 'Marketing Coordinator';
COMMIT;  -- Uncomment if everything is correct
-- ROLLBACK;  -- Uncomment to undo the changes

-- Example 2: Insert with Conditional COMMIT and ROLLBACK
BEGIN;
INSERT INTO employees_DCL (id, name, position, salary, hire_date) VALUES
(51, 'Daniel', 'Network Administrator', 32000.00, '2005-01-15'),
(52, 'Sophia', 'UI/UX Designer', 27500.00, '2005-03-12');
COMMIT;  -- Uncomment if everything is correct
-- ROLLBACK;  -- Uncomment to undo the changes

-- Example 3: Deleting Records with COMMIT and ROLLBACK
BEGIN;
DELETE FROM employees_DCL
WHERE hire_date < '1995-01-01';
COMMIT;  -- Uncomment if everything is correct
-- ROLLBACK;  -- Uncomment to undo the deletion

-- Example 4: Complex Update with Multiple Tables
-- Assume 'departments' table exists
CREATE TABLE departments (
    department_name VARCHAR(50) PRIMARY KEY,
    budget DECIMAL(10, 2)
);
-- Inserting data into the 'departments' table
INSERT INTO departments (department_name, budget) VALUES
('Data Science', 500000.00),     -- Existing department from previous examples
('Marketing', 300000.00),        -- Existing department from previous examples
('Sales', 400000.00),            -- New department
('Human Resources', 150000.00),  -- New department
('Finance', 600000.00),          -- New department
('IT Support', 250000.00),       -- New department
('Legal', 350000.00),            -- New department
('Operations', 450000.00),       -- New department
('Research and Development', 700000.00), -- New department
('Customer Service', 200000.00), -- New department
('Procurement', 180000.00);      -- New department

-- Example 4: Complex Update with Multiple Tables
BEGIN;
UPDATE employees_DCL
SET salary = salary * 1.05
WHERE position = 'Data Scientist';
UPDATE departments
SET budget = budget * 0.95
WHERE department_name = 'Data Science';
COMMIT;  -- Uncomment if both updates succeed
-- ROLLBACK;  -- Uncomment to undo both updates if one fails

-- Example 5: Handling Errors During Transactions
BEGIN;
UPDATE employees_DCL
SET salary = salary * 1.10
WHERE position = 'Systems Analyst';
-- Simulating an error
-- UPDATE employees_DCL SET salary = 'INVALID' WHERE position = 'Systems Analyst';
COMMIT;  -- Uncomment if no errors occur
-- ROLLBACK;  -- Uncomment to undo the update if an error occurs

-- Example 6: Rolling Back Part of a Transaction
BEGIN;
UPDATE employees_DCL
SET salary = salary * 1.05
WHERE position = 'Business Analyst';
UPDATE employees_DCL
SET salary = salary * 1.07
WHERE position = 'Full Stack Engineer';
ROLLBACK;  -- Uncomment to undo the last update for 'Full Stack Engineer'
COMMIT;  -- Uncomment to save the first update for 'Business Analyst'

-- Additional Examples: Using GRANT and REVOKE Commands

-- Example 7: Granting SELECT Permission to a User
GRANT SELECT ON employees_DCL TO 'john_doe';

-- Example 8: Granting SELECT and INSERT Permissions to a User
GRANT SELECT, INSERT ON employees_DCL TO 'jane_doe';

-- Example 9: Granting ALL Privileges to an Administrator
GRANT ALL PRIVILEGES ON employees_DCL TO 'admin_user';

-- Example 10: Granting UPDATE Permission on Specific Columns
GRANT UPDATE (salary, position) ON employees_DCL TO 'editor_user';

-- Example 11: Revoking Specific Privileges from a User
REVOKE INSERT ON employees_DCL FROM 'jane_doe';

-- Example 12: Revoking All Privileges from a User
REVOKE ALL PRIVILEGES ON employees_DCL FROM 'admin_user';

-- Example 13: Granting Permission to Create New Tables
GRANT CREATE ON DATABASE company TO 'schema_manager';

-- Example 14: Revoking Permission to Create New Tables
REVOKE CREATE ON DATABASE company FROM 'schema_manager';

-- Final Step: Cleanup (optional)
-- Dropping the 'departments' table if it was created for this script
DROP TABLE departments;