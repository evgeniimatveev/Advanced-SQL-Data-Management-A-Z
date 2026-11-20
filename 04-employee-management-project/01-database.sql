-- Step 1: Create the new database
-- This creates a new database named 'employee_management' where all the tables and data related to this project will be stored.
CREATE DATABASE employee_management;

-- Step 2: Use the new database
-- We now select the 'employee_management' database to ensure all subsequent commands apply to this database.
USE employee_management;

-- Step 3: Create the departments table
-- The 'departments' table will store information about different departments within the company.
-- Each department has a unique ID, a name, and a location.
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique identifier for each department
    department_name VARCHAR(100) NOT NULL,         -- The name of the department (e.g., "HR", "Engineering")
    location VARCHAR(100)                          -- The location of the department (e.g., "New York", "San Francisco")
);

-- Step 4: Insert data into the departments table
-- Here, we populate the 'departments' table with initial data, defining 10 different departments.
INSERT INTO departments (department_name, location) VALUES ('Human Resources', 'New York');
INSERT INTO departments (department_name, location) VALUES ('Engineering', 'San Francisco');
INSERT INTO departments (department_name, location) VALUES ('Marketing', 'Chicago');
INSERT INTO departments (department_name, location) VALUES ('Sales', 'Boston');
INSERT INTO departments (department_name, location) VALUES ('Finance', 'Seattle');
INSERT INTO departments (department_name, location) VALUES ('Customer Support', 'Austin');
INSERT INTO departments (department_name, location) VALUES ('Legal', 'Washington D.C.');
INSERT INTO departments (department_name, location) VALUES ('Operations', 'Los Angeles');
INSERT INTO departments (department_name, location) VALUES ('Research and Development', 'Houston');
INSERT INTO departments (department_name, location) VALUES ('Product Management', 'San Diego');

-- Step 5: Create the employees table
-- The 'employees' table will store information about employees, including their department affiliation.
-- Each employee has a unique ID, name, position, salary, hire date, and a department ID to link them to a department.
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,             -- Unique identifier for each employee
    name VARCHAR(100) NOT NULL,                    -- The name of the employee
    position VARCHAR(50),                          -- The job position of the employee (e.g., "Manager", "Developer")
    salary DECIMAL(10, 2),                         -- The salary of the employee
    hire_date DATE,                                -- The date when the employee was hired
    department_id INT,                             -- Foreign key linking to the departments table
    FOREIGN KEY (department_id) REFERENCES departments(department_id)  -- Establishes a relationship between employees and departments
);

-- Step 6: Insert data into the employees table
-- We now populate the 'employees' table with initial data.
-- This includes 30 employees, each associated with one of the 10 departments.
INSERT INTO employees (name, position, salary, hire_date, department_id)
VALUES 
('Aman', 'HR Manager', 60000.00, '2015-06-15', 1),    -- Aman, the HR Manager, belongs to the HR department.
('Emily', 'Software Engineer', 85000.00, '2018-07-23', 2), -- Emily is a Software Engineer in the Engineering department.
('John', 'Graphic Designer', 55000.00, '2016-04-10', 3),   -- John works as a Graphic Designer in the Marketing department.
('Sarah', 'Sales Executive', 50000.00, '2017-09-12', 4),   -- Sarah is a Sales Executive in the Sales department.
('Michael', 'Finance Analyst', 70000.00, '2019-01-25', 5), -- Michael is a Finance Analyst in the Finance department.
('Sophia', 'Senior Software Engineer', 95000.00, '2014-11-20', 2),  -- Sophia is a Senior Software Engineer in Engineering.
('David', 'DevOps Engineer', 90000.00, '2020-03-15', 2),   -- David works as a DevOps Engineer in Engineering.
('Anna', 'Marketing Specialist', 52000.00, '2016-08-05', 3), -- Anna is a Marketing Specialist in Marketing.
('James', 'System Administrator', 78000.00, '2018-12-02', 2), -- James is a System Administrator in Engineering.
('Olivia', 'Data Analyst', 72000.00, '2017-10-14', 5),     -- Olivia works as a Data Analyst in Finance.
('Liam', 'Customer Support Representative', 45000.00, '2021-05-11', 6), -- Liam is in Customer Support.
('Mia', 'Legal Advisor', 68000.00, '2019-03-08', 7),       -- Mia works as a Legal Advisor in the Legal department.
('Noah', 'Sales Manager', 80000.00, '2016-01-19', 4),      -- Noah is a Sales Manager in the Sales department.
('Lucas', 'Marketing Manager', 62000.00, '2018-10-29', 3), -- Lucas is the Marketing Manager.
('Isabella', 'HR Specialist', 48000.00, '2020-06-25', 1),  -- Isabella works as an HR Specialist.
('Ethan', 'Operations Manager', 75000.00, '2017-02-22', 8),-- Ethan is the Operations Manager.
('Charlotte', 'R&D Specialist', 90000.00, '2019-09-30', 9),-- Charlotte works in R&D.
('Zoe', 'Product Manager', 78000.00, '2015-12-17', 10),    -- Zoe is the Product Manager.
('Mason', 'Operations Coordinator', 55000.00, '2016-05-05', 8), -- Mason coordinates operations.
('Harper', 'Legal Assistant', 54000.00, '2020-11-13', 7),  -- Harper is a Legal Assistant.
('Alexander', 'Product Designer', 88000.00, '2018-04-27', 10), -- Alexander designs products.
('Ella', 'R&D Engineer', 94000.00, '2016-08-08', 9),       -- Ella works as an R&D Engineer.
('Benjamin', 'Chief Technology Officer', 120000.00, '2014-03-15', 2), -- Benjamin is the CTO.
('Avery', 'Chief Marketing Officer', 115000.00, '2013-06-01', 3), -- Avery is the CMO.
('Abigail', 'Sales Associate', 46000.00, '2019-02-14', 4), -- Abigail works in sales.
('Henry', 'Finance Manager', 95000.00, '2017-07-20', 5),   -- Henry is the Finance Manager.
('Sofia', 'Customer Support Lead', 60000.00, '2016-03-03', 6), -- Sofia leads Customer Support.
('Daniel', 'Operations Analyst', 67000.00, '2020-08-21', 8), -- Daniel analyzes operations.
('Matthew', 'Senior Product Manager', 105000.00, '2016-12-01', 10), -- Matthew manages products.
('Madison', 'R&D Technician', 70000.00, '2017-11-19', 9); -- Madison is a Technician in R&D.

-- Step 7: Create the projects table
-- The 'projects' table will store information about various projects within the company.
-- Each project has a unique ID, a name, start and end dates, and a status.
CREATE TABLE projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY,     -- Unique identifier for each project
    project_name VARCHAR(100) NOT NULL,            -- The name of the project (e.g., "Website Redesign")
    start_date DATE,                               -- The date when the project started
    end_date DATE,                                 -- The planned end date of the project
    status VARCHAR(50)                             -- The current status of the project (e.g., "In Progress", "Completed")
);

-- Step 8: Insert data into the projects table
-- We populate the 'projects' table with 15 projects, representing various company initiatives.
INSERT INTO projects (project_name, start_date, end_date, status)
VALUES 
('Website Redesign', '2024-01-01', '2024-06-01', 'In Progress'), -- Redesigning the company website.
('AI Research', '2023-05-01', '2024-12-31', 'In Progress'),      -- Conducting research on AI technologies.
('Marketing Campaign Q4', '2023-07-01', '2023-12-31', 'Completed'), -- Marketing campaign for Q4 2023.
('Cloud Migration', '2022-03-01', '2023-03-01', 'Completed'),    -- Migrating systems to the cloud.
('New Product Launch', '2024-02-15', '2024-08-15', 'In Progress'), -- Launching a new product.
('Customer Support Optimization', '2023-04-01', '2023-10-01', 'Completed'), -- Improving customer support systems.
('Legal Compliance Review', '2023-01-01', '2023-12-31', 'In Progress'), -- Ensuring legal compliance across operations.
('Operations Workflow Improvement', '2024-03-01', '2024-09-01', 'In Progress'), -- Improving operations workflow.
('R&D Project X', '2023-06-01', '2024-06-01', 'In Progress'),   -- R&D project for new technologies.
('Sales Territory Expansion', '2024-05-01', '2024-11-01', 'In Progress'), -- Expanding sales territories.
('Finance System Upgrade', '2022-01-01', '2022-12-31', 'Completed'), -- Upgrading finance systems.
('HR Policy Revision', '2023-09-01', '2024-03-01', 'In Progress'), -- Revising HR policies.
('Product Development Cycle Optimization', '2024-04-01', '2025-04-01', 'In Progress'), -- Optimizing product development.
('Global Market Analysis', '2023-10-01', '2024-03-31', 'In Progress'), -- Analyzing global markets.
('Customer Feedback Initiative', '2024-07-01', '2024-12-31', 'In Progress'); -- Initiative to gather and act on customer feedback.

-- Step 9: Create the employee_projects junction table
-- The 'employee_projects' table manages the many-to-many relationship between employees and projects.
-- It links each employee to the projects they are working on.
-- Step 9: Create the employee_projects junction table
-- Purpose: 
-- The 'employee_projects' table is essential for managing the many-to-many relationship between employees and projects.
-- In real-world scenarios, an employee can work on multiple projects, and a single project can have multiple employees.
-- This table acts as an intermediary to link employees and projects effectively.

CREATE TABLE employee_projects (
    employee_id INT,                               -- Foreign key linking to the employees table
    project_id INT,                                -- Foreign key linking to the projects table
    PRIMARY KEY (employee_id, project_id),         -- Composite primary key to ensure unique employee-project pairs
    FOREIGN KEY (employee_id) REFERENCES employees(id),  -- Ensures employee_id corresponds to a valid employee in the employees table
    FOREIGN KEY (project_id) REFERENCES projects(project_id)  -- Ensures project_id corresponds to a valid project in the projects table
);

-- Explanation:
-- - 'employee_id' is a foreign key that references the 'id' column in the 'employees' table.
--   This links each record to a specific employee.
-- - 'project_id' is a foreign key that references the 'project_id' column in the 'projects' table.
--   This links each record to a specific project.
-- - The PRIMARY KEY constraint on the combination of 'employee_id' and 'project_id' ensures that 
--   each employee can be associated with a specific project only once, preventing duplicate records.

-- Significance:
-- - This function table is crucial for accurately representing the complex relationships where employees 
--   contribute to multiple projects, and projects involve multiple employees.
-- - With this table, you can efficiently query and manage these many-to-many relationships.

-- Step 10: Populate the employee_projects table
-- Purpose:
-- After creating the 'employee_projects' table, we populate it with data that links employees to their respective projects.
-- This data reflects real-world assignments where employees are distributed across various projects within the company.

INSERT INTO employee_projects (employee_id, project_id) VALUES
(1, 12),  -- Links employee with ID 1 (Aman) to project with ID 12 (HR Policy Revision)
(2, 1),   -- Links employee with ID 2 (Emily) to project with ID 1 (Website Redesign)
(3, 3),   -- Links employee with ID 3 (John) to project with ID 3 (Marketing Campaign Q4)
(4, 10),  -- Links employee with ID 4 (Sarah) to project with ID 10 (Sales Territory Expansion)
(5, 11),  -- Links employee with ID 5 (Michael) to project with ID 11 (Finance System Upgrade)
(6, 2),   -- Links employee with ID 6 (Sophia) to project with ID 2 (AI Research)
(7, 4),   -- Links employee with ID 7 (David) to project with ID 4 (Cloud Migration)
(8, 3),   -- Links employee with ID 8 (Anna) to project with ID 3 (Marketing Campaign Q4)
(9, 4),   -- Links employee with ID 9 (James) to project with ID 4 (Cloud Migration)
(10, 11), -- Links employee with ID 10 (Olivia) to project with ID 11 (Finance System Upgrade)
(11, 6),  -- Links employee with ID 11 (Liam) to project with ID 6 (Customer Support Optimization)
(12, 7),  -- Links employee with ID 12 (Mia) to project with ID 7 (Legal Compliance Review)
(13, 10), -- Links employee with ID 13 (Noah) to project with ID 10 (Sales Territory Expansion)
(14, 3),  -- Links employee with ID 14 (Lucas) to project with ID 3 (Marketing Campaign Q4)
(15, 12), -- Links employee with ID 15 (Isabella) to project with ID 12 (HR Policy Revision)
(16, 8),  -- Links employee with ID 16 (Ethan) to project with ID 8 (Operations Workflow Improvement)
(17, 9),  -- Links employee with ID 17 (Charlotte) to project with ID 9 (R&D Project X)
(18, 5),  -- Links employee with ID 18 (Zoe) to project with ID 5 (New Product Launch)
(19, 8),  -- Links employee with ID 19 (Mason) to project with ID 8 (Operations Workflow Improvement)
(20, 7),  -- Links employee with ID 20 (Harper) to project with ID 7 (Legal Compliance Review)
(21, 5),  -- Links employee with ID 21 (Alexander) to project with ID 5 (New Product Launch)
(22, 9),  -- Links employee with ID 22 (Ella) to project with ID 9 (R&D Project X)
(23, 4),  -- Links employee with ID 23 (Benjamin) to project with ID 4 (Cloud Migration)
(24, 3),  -- Links employee with ID 24 (Avery) to project with ID 3 (Marketing Campaign Q4)
(25, 13), -- Links employee with ID 25 (Abigail) to project with ID 13 (Product Development Cycle Optimization)
(26, 14), -- Links employee with ID 26 (Henry) to project with ID 14 (Global Market Analysis)
(27, 6),  -- Links employee with ID 27 (Sofia) to project with ID 6 (Customer Support Optimization)
(28, 8),  -- Links employee with ID 28 (Daniel) to project with ID 8 (Operations Workflow Improvement)
(29, 15), -- Links employee with ID 29 (Matthew) to project with ID 15 (Customer Feedback Initiative)
(30, 9);  -- Links employee with ID 30 (Madison) to project with ID 9 (R&D Project X)

-- Explanation:
-- - Each line in this insertion block establishes a connection between a specific employee and a specific project.
-- - For example, employee ID 1 (Aman) is linked to project ID 12 (HR Policy Revision).
-- - This data allows us to accurately represent which employees are working on which projects.

-- Significance:
-- - By populating this table, we now have a complete mapping of employee participation across various projects.
-- - This structure supports complex queries, such as determining all employees assigned to a particular project or 
--   finding all projects that a specific employee is involved in.
-- - This is crucial for resource management, project planning, and tracking employee workload across the organization.

-- Step 11: Create the salaries table
-- The 'salaries' table tracks the salary history of each employee over time.
-- It links each salary record to an employee via a foreign key.
CREATE TABLE salaries (
    salary_id INT AUTO_INCREMENT PRIMARY KEY,      -- Unique identifier for each salary record
    employee_id INT,                               -- Foreign key linking to the employees table
    salary_amount DECIMAL(10, 2),                  -- The salary amount
    effective_date DATE,                           -- The date when this salary became effective
    FOREIGN KEY (employee_id) REFERENCES employees(id)  -- Establishes a relationship between salaries and employees
);

-- Step 12: Insert data into the salaries table
-- Recording salary history for all employees, showing their current salary as of 2023.
INSERT INTO salaries (employee_id, salary_amount, effective_date) VALUES
(1, 58000.00, '2023-01-01'), (2, 82000.00, '2023-01-01'), (3, 54000.00, '2023-01-01'),
(4, 49000.00, '2023-01-01'), (5, 67000.00, '2023-01-01'), (6, 92000.00, '2023-01-01'),
(7, 87000.00, '2023-01-01'), (8, 51000.00, '2023-01-01'), (9, 76000.00, '2023-01-01'),
(10, 71000.00, '2023-01-01'), (11, 44000.00, '2023-01-01'), (12, 66000.00, '2023-01-01'),
(13, 78000.00, '2023-01-01'), (14, 60000.00, '2023-01-01'), (15, 46000.00, '2023-01-01'),
(16, 74000.00, '2023-01-01'), (17, 89000.00, '2023-01-01'), (18, 75000.00, '2023-01-01'),
(19, 53000.00, '2023-01-01'), (20, 52000.00, '2023-01-01'), (21, 86000.00, '2023-01-01'),
(22, 90000.00, '2023-01-01'), (23, 115000.00, '2023-01-01'), (24, 46000.00, '2023-01-01'),
(25, 94000.00, '2023-01-01'), (26, 59000.00, '2023-01-01'), (27, 67000.00, '2023-01-01'),
(28, 69000.00, '2023-01-01'), (29, 103000.00, '2023-01-01'), (30, 68000.00, '2023-01-01');

-- Step 13: Create the attendance table
-- The 'attendance' table tracks the daily attendance of employees.
-- Each record shows whether an employee was present, absent, or on leave for a specific day.
CREATE TABLE attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique identifier for each attendance record
    employee_id INT,                               -- Foreign key linking to the employees table
    date DATE,                                     -- The date of attendance
    status VARCHAR(50),                            -- The attendance status (e.g., "Present", "Absent", "Sick Leave")
    FOREIGN KEY (employee_id) REFERENCES employees(id)  -- Establishes a relationship between attendance and employees
);

-- Step 14: Insert data into the attendance table
-- We record the attendance status for all 30 employees on a specific day (September 1, 2024).
INSERT INTO attendance (employee_id, date, status) VALUES
(1, '2024-09-01', 'Present'), (2, '2024-09-01', 'Present'), (3, '2024-09-01', 'Sick Leave'),
(4, '2024-09-01', 'Present'), (5, '2024-09-01', 'Absent'), (6, '2024-09-01', 'Present'),
(7, '2024-09-01', 'Present'), (8, '2024-09-01', 'Present'), (9, '2024-09-01', 'Absent'),
(10, '2024-09-01', 'Present'), (11, '2024-09-01', 'Present'), (12, '2024-09-01', 'Present'),
(13, '2024-09-01', 'Present'), (14, '2024-09-01', 'Present'), (15, '2024-09-01', 'Sick Leave'),
(16, '2024-09-01', 'Present'), (17, '2024-09-01', 'Present'), (18, '2024-09-01', 'Present'),
(19, '2024-09-01', 'Absent'), (20, '2024-09-01', 'Present'), (21, '2024-09-01', 'Present'),
(22, '2024-09-01', 'Present'), (23, '2024-09-01', 'Present'), (24, '2024-09-01', 'Present'),
(25, '2024-09-01', 'Present'), (26, '2024-09-01', 'Present'), (27, '2024-09-01', 'Present'),
(28, '2024-09-01', 'Present'), (29, '2024-09-01', 'Present'), (30, '2024-09-01', 'Present');

-- Step 15: Query examples to demonstrate database relationships

-- Example 1: Retrieve all employees with their department names.
-- This query joins the 'employees' table with the 'departments' table to show which department each employee belongs to.
SELECT e.name AS EmployeeName, d.department_name AS Department
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

-- Example 2: List all projects with the employees working on them.
-- This query joins the 'projects', 'employee_projects', and 'employees' tables to show which employees are working on which projects.
SELECT p.project_name AS ProjectName, e.name AS EmployeeName
FROM projects as  p
JOIN employee_projects as  ep ON p.project_id = ep.project_id
JOIN employees e ON ep.employee_id = e.id;

-- Example 3: Retrieve the salary history for a specific employee (e.g., Aman).
-- This query retrieves the salary history for a particular employee by joining the 'salaries' and 'employees' tables.
SELECT s.salary_amount, s.effective_date
FROM salaries as s
JOIN employees as e ON s.employee_id = e.id
WHERE e.name = 'Aman';

-- Example 4: Check the attendance status of all employees on a specific date.
-- This query retrieves the attendance status of all employees for a given date by joining the 'attendance' and 'employees' tables.
SELECT e.name AS EmployeeName, a.status AS AttendanceStatus
FROM attendance as a
JOIN employees as e ON a.employee_id = e.id
WHERE a.date = '2024-09-01';


-- View for project summary
