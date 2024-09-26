-- Enhancing the existing 'employee_management' database with advanced features
USE employee_management;

-- ==============================================
-- Step 1: Stored Procedures
-- ==============================================
-- Stored procedures allow you to encapsulate SQL code in reusable functions.
-- We'll create a stored procedure to assign an employee to a new project.

DELIMITER $$  -- Changing the delimiter to avoid conflicts with MySQL statement terminators
CREATE PROCEDURE AssignEmployeeToProject(IN emp_id INT, IN proj_id INT)
BEGIN
    -- This procedure inserts a record into the employee_projects table, linking an employee to a project.
    INSERT INTO employee_projects (employee_id, project_id)
    VALUES (emp_id, proj_id);
END $$
DELIMITER ;  -- Resetting the delimiter back to semicolon

-- Explanation:
-- - The procedure takes two parameters: 'emp_id' (employee ID) and 'proj_id' (project ID).
-- - It inserts a new record into the 'employee_projects' table, associating the employee with a specific project.

-- Example usage of the stored procedure
CALL AssignEmployeeToProject(1, 15);  -- Assigns Aman to the Customer Feedback Initiative project

-- ==============================================
-- Step 2: Triggers
-- ==============================================
-- Triggers automatically execute specified code in response to certain events on a table.
-- We'll create a trigger to log any changes to an employee's salary.

CREATE TABLE salary_changes_log (
    change_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique identifier for each salary change log entry
    employee_id INT,  -- The ID of the employee whose salary has changed
    old_salary DECIMAL(10, 2),  -- The salary amount before the change
    new_salary DECIMAL(10, 2),  -- The salary amount after the change
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP  -- Timestamp of when the change occurred
);

DELIMITER $$  -- Changing the delimiter to avoid conflict within the trigger

CREATE TRIGGER LogSalaryChange
AFTER UPDATE ON salaries  -- Trigger will activate after any update to the salaries table
FOR EACH ROW  -- Applies to each row that is updated
BEGIN
    -- Insert a new record into salary_changes_log to log the old and new salary whenever an employee's salary is updated.
    INSERT INTO salary_changes_log (employee_id, old_salary, new_salary)
    VALUES (OLD.employee_id, OLD.salary_amount, NEW.salary_amount);
END $$
DELIMITER ;  -- Resetting the delimiter back to semicolon

-- Explanation:
-- - The trigger logs any salary changes made in the 'salaries' table by inserting a record into 'salary_changes_log'.
-- - 'OLD.salary_amount' represents the previous salary, and 'NEW.salary_amount' represents the updated salary.

-- ==============================================
-- Step 3: Advanced Triggers - Project Change Logging
-- ==============================================
-- Another example of a trigger is to log any changes made to a project's status or end date.

CREATE TABLE project_changes_log (
    change_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique ID for each change log entry
    project_id INT,  -- The ID of the project that was changed
    old_status VARCHAR(50),  -- The previous status of the project
    new_status VARCHAR(50),  -- The new status of the project after the change
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP  -- Timestamp of when the change occurred
);

DELIMITER $$  -- Changing the delimiter for the trigger definition

CREATE TRIGGER LogProjectChange
AFTER UPDATE ON projects  -- Trigger activates after an update on the projects table
FOR EACH ROW  -- Applies to each row that is updated
BEGIN
    -- Check if the project status has changed and log it if true
    IF OLD.status <> NEW.status THEN
        INSERT INTO project_changes_log (project_id, old_status, new_status)
        VALUES (OLD.project_id, OLD.status, NEW.status);
    END IF;
END $$
DELIMITER ;  -- Resetting the delimiter back to semicolon

-- Explanation:
-- - This trigger checks if the status of a project has changed. If it has, it logs the change in 'project_changes_log'.
-- - This helps in tracking project lifecycle changes over time.

-- ==============================================
-- Step 4: Views
-- ==============================================
-- Views are virtual tables based on the result of a SELECT query.
-- We'll create a view to summarize the number of employees working on each project.

CREATE VIEW ProjectSummary AS
SELECT p.project_name, COUNT(ep.employee_id) AS NumberOfEmployees
FROM projects p
JOIN employee_projects ep ON p.project_id = ep.project_id
GROUP BY p.project_name;

-- Explanation:
-- - The 'ProjectSummary' view shows the name of each project and the number of employees assigned to it.
-- - It simplifies the retrieval of summary data on project staffing.

-- Example query using the view
SELECT * FROM ProjectSummary;  -- Retrieves the summary of employee distribution across projects

-- ==============================================
-- Step 5: Indexes
-- ==============================================
-- Indexes speed up the retrieval of rows by creating a pointer system.
-- We'll create an index on the 'employee_projects' table to improve the performance of queries involving employee-project assignments.

CREATE INDEX idx_employee_project ON employee_projects(employee_id, project_id);

-- Explanation:
-- - This index is created to optimize queries that involve searching for specific employees within projects.
-- - Indexes reduce the time needed to find specific rows in a large table, improving query performance.

-- ==============================================
-- Step 6: Data Security and User Roles
-- ==============================================
-- User roles allow you to control who can access or modify certain data.
-- We'll create roles for HR, Project Managers, and Financial Analysts, each with different permissions.

-- Create HR role with permission to view and update employee data
CREATE ROLE hr_role;
GRANT SELECT, UPDATE ON employees TO hr_role;

-- Create Project Manager role with permission to view and manage projects
CREATE ROLE project_manager_role;
GRANT SELECT, INSERT, UPDATE ON projects TO project_manager_role;
GRANT SELECT, INSERT, UPDATE ON employee_projects TO project_manager_role;

-- Create Financial Analyst role with permission to view salary data
CREATE ROLE financial_analyst_role;
GRANT SELECT ON salaries TO financial_analyst_role;

-- Assign roles to specific users (assuming users have been created in the MySQL server)
-- GRANT hr_role TO 'hr_user'@'localhost';
-- GRANT project_manager_role TO 'pm_user'@'localhost';
-- GRANT financial_analyst_role TO 'fa_user'@'localhost';

-- Explanation:
-- - User roles are created to segregate duties and limit access based on job responsibilities.
-- - HR can manage employee data, project managers can oversee project-related data, and financial analysts can access salary information.

-- ==============================================
-- Step 7: Advanced Reporting
-- ==============================================
-- Advanced reports provide insights into your data.
-- We'll create a report to show the average salary by department.

SELECT d.department_name, AVG(e.salary) AS AverageSalary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name;

-- Explanation:
-- - This query calculates the average salary for each department.
-- - It joins the 'employees' and 'departments' tables to group the salaries by department.

-- ==============================================
-- Step 8: Database Backup and Restore
-- ==============================================
-- Backing up and restoring databases is crucial for data integrity and disaster recovery.
-- Although these commands are usually run outside of the SQL environment, you can demonstrate the commands here.

-- Command to backup the database
-- mysqldump -u root -p employee_management > backup.sql

-- Command to restore the database from backup
-- mysql -u root -p employee_management < backup.sql

-- Explanation:
-- - 'mysqldump' creates a backup of the 'employee_management' database.
-- - The 'mysql' command restores the database from the backup file.

-- ==============================================
-- Step 9: Normalization/Denormalization
-- ==============================================
-- Normalization reduces redundancy, while denormalization improves performance.
-- We'll demonstrate a normalization example by splitting an existing table into two.

-- Example: Normalizing the employee table by separating contact details into a new table
CREATE TABLE employee_contacts (
    employee_id INT PRIMARY KEY,  -- Employee ID, linked to the employees table
    address VARCHAR(255),  -- Contact address
    phone_number VARCHAR(20),  -- Contact phone number
    FOREIGN KEY (employee_id) REFERENCES employees(id)  -- Foreign key constraint linking to employees
);

-- Explanation:
-- - This table stores employee contact details separately, reducing redundancy in the main employees table.
-- - It allows for better management of contact information and adheres to normalization principles.
-- Insert data into employee_contacts
INSERT INTO employee_contacts (employee_id, address, phone_number) VALUES
(1, '123 Main St, Springfield', '555-1234'),
(2, '456 Elm St, Springfield', '555-5678'),
(3, '789 Maple St, Springfield', '555-9012'),
(4, '321 Oak St, Springfield', '555-3456'),
(5, '654 Pine St, Springfield', '555-7890'),
(6, '987 Cedar St, Springfield', '555-2345'),
(7, '543 Birch St, Springfield', '555-6789'),
(8, '210 Willow St, Springfield', '555-0123'),
(9, '876 Chestnut St, Springfield', '555-4567'),
(10, '432 Aspen St, Springfield', '555-8901');

SELECT * FROM employee_contacts;
-- Explanation:
-- - This query inserts 10 records into the `employee_contacts` table.
-- - Each record includes an `employee_id`, an `address`, and a `phone_number`.
-- - The data here is fictional, representing typical addresses and phone numbers for employees.
-- ==============================================
-- Step 10: Data Import/Export
-- ==============================================
-- Importing and exporting data to/from external files is important for data sharing and backups.
-- We'll show how to import data from a CSV file into a table.

-- Example: Importing data from a CSV file into the 'employees' table
-- LOAD DATA INFILE '/path/to/employees.csv'
-- INTO TABLE employees
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;

-- Explanation:
-- - 'LOAD DATA INFILE' imports data from a CSV file into the 'employees' table.
-- - You specify the path to the CSV file and the formatting details, such as field and line terminators.

-- ==============================================
-- Step 11: Performance Tuning
-- ==============================================
-- Optimizing query performance is crucial as databases grow in size and complexity.
-- We'll analyze and optimize a slow query using EXPLAIN and indexing.

-- Example: Analyzing and optimizing a query
EXPLAIN SELECT * FROM employees WHERE salary > 80000;

-- Explanation:
-- - 'EXPLAIN' provides insights into how MySQL executes the query, showing where potential bottlenecks might be.
-- - Based on this analysis, you might create an index on the 'salary' column to improve performance.

CREATE INDEX idx_salary ON employees(salary);

-- Explanation:
-- - The 'idx_salary' index is created on the 'salary' column to speed up queries that filter by salary.

-- ==============================================
-- Step 12: Implementing an Inventory Management System (Optional)
-- ==============================================
-- If your database requires inventory management, you can include a system to track resources within departments.

CREATE TABLE inventory (
    item_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique ID for each inventory item
    item_name VARCHAR(100),  -- Name of the inventory item
    quantity INT,  -- Quantity of the item in stock
    department_id INT,  -- Department to which the inventory belongs
    FOREIGN KEY (department_id) REFERENCES departments(department_id)  -- Foreign key linking to departments
);

-- Stored Procedure to update inventory when items are used or added
DELIMITER $$
CREATE PROCEDURE UpdateInventory(IN dept_id INT, IN item_name VARCHAR(100), IN qty INT)
BEGIN
    -- Update the quantity of the item in the specified department
    UPDATE inventory
    SET quantity = quantity + qty
    WHERE department_id = dept_id AND item_name = item_name;
END $$
DELIMITER ;

-- Explanation:
-- - This system tracks inventory by department, allowing for resource management.
-- - The stored procedure `UpdateInventory` adjusts stock levels based on usage or new deliveries.

-- ==============================================
-- Conclusion
-- ==============================================
-- This script introduces advanced database management features including stored procedures, triggers, views, indexes, roles, and performance tuning.
-- These elements enhance the functionality, security, and efficiency of the `employee_management` database, making it robust for various business needs