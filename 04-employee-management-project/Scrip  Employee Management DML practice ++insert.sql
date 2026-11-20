DELETE FROM employee_contacts WHERE employee_id IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30);

-- Disable foreign key checks to allow data insertion
SET FOREIGN_KEY_CHECKS = 0;

-- Insert data into employee_contacts with updated phone numbers
INSERT INTO employee_contacts (employee_id, address, phone_number) VALUES
(1, '123 Main St, New York, NY', '212-555-1010'),      -- HR Manager (New York)
(2, '456 Market St, San Francisco, CA', '415-555-2020'), -- Software Engineer (San Francisco)
(3, '789 Wacker Dr, Chicago, IL', '312-555-3030'),     -- Graphic Designer (Chicago)
(4, '321 Boylston St, Boston, MA', '617-555-4040'),    -- Sales Executive (Boston)
(5, '654 Pine St, Seattle, WA', '206-555-5050'),       -- Finance Analyst (Seattle)
(6, '987 Castro St, San Francisco, CA', '415-555-6060'), -- Senior Software Engineer (San Francisco)
(7, '543 Mission St, San Francisco, CA', '415-555-7070'), -- DevOps Engineer (San Francisco)
(8, '210 Oak St, Chicago, IL', '312-555-8080'),        -- Marketing Specialist (Chicago)
(9, '432 Fremont St, San Francisco, CA', '415-555-9090'), -- System Administrator (San Francisco)
(10, '876 Pike St, Seattle, WA', '206-555-1111'),      -- Data Analyst (Seattle)
(11, '234 6th St, Austin, TX', '512-555-1212'),        -- Customer Support Representative (Austin)
(12, '567 K St NW, Washington, D.C.', '202-555-1313'), -- Legal Advisor (Washington, D.C.)
(13, '890 Beacon St, Boston, MA', '617-555-1414'),     -- Sales Manager (Boston)
(14, '345 Michigan Ave, Chicago, IL', '312-555-1515'), -- Marketing Manager (Chicago)
(15, '678 Lexington Ave, New York, NY', '212-555-1616'), -- HR Specialist (New York)
(16, '123 Sunset Blvd, Los Angeles, CA', '213-555-1717'), -- Operations Manager (Los Angeles)
(17, '456 Research Blvd, Houston, TX', '713-555-1818'), -- R&D Specialist (Houston)
(18, '789 Innovation Dr, San Diego, CA', '619-555-1919'), -- Product Manager (San Diego)
(19, '321 Operations Way, Los Angeles, CA', '213-555-2021'), -- Operations Coordinator (Los Angeles)
(20, '654 Constitution Ave, Washington, D.C.', '202-555-2122'), -- Legal Assistant (Washington, D.C.)
(21, '987 Innovation Dr, San Diego, CA', '619-555-2323'), -- Product Designer (San Diego)
(22, '543 R&D St, Houston, TX', '713-555-2424'),       -- R&D Engineer (Houston)
(23, '210 Market St, San Francisco, CA', '415-555-2525'), -- Chief Technology Officer (San Francisco)
(24, '432 Marketing Dr, Chicago, IL', '312-555-2626'), -- Chief Marketing Officer (Chicago)
(25, '876 Sales Ave, Boston, MA', '617-555-2727'),     -- Sales Associate (Boston)
(26, '234 Finance St, Seattle, WA', '206-555-2828'),   -- Finance Manager (Seattle)
(27, '567 Support Rd, Austin, TX', '512-555-2929'),    -- Customer Support Lead (Austin)
(28, '890 Operations Dr, Los Angeles, CA', '213-555-3030'), -- Operations Analyst (Los Angeles)
(29, '345 Product St, San Diego, CA', '619-555-3131'), -- Senior Product Manager (San Diego)
(30, '678 R&D Ave, Houston, TX', '713-555-3232');      -- R&D Technician (Houston)

-- Re-enable foreign key checks to maintain database integrity
SET FOREIGN_KEY_CHECKS = 1;

SELECT * FROM employee_management.employee_contacts;

-- ===============================================
-- Updating the salaries for 10 employees and logging the changes
-- ===============================================

-- The following updates increase the salaries of specific employees by a certain amount.
-- Each time a salary is updated, the trigger will automatically log the change in the `salary_changes_log` table.

-- Increase the salary of the employee with ID 2 by $5000
UPDATE salaries 
SET salary_amount = salary_amount + 5000 
WHERE employee_id = 2;

-- Increase the salary of the employee with ID 3 by $3000
UPDATE salaries 
SET salary_amount = salary_amount + 3000 
WHERE employee_id = 3;

-- Increase the salary of the employee with ID 4 by $7000
UPDATE salaries 
SET salary_amount = salary_amount + 7000 
WHERE employee_id = 4;

-- Increase the salary of the employee with ID 5 by $4500
UPDATE salaries 
SET salary_amount = salary_amount + 4500 
WHERE employee_id = 5;

-- Increase the salary of the employee with ID 6 by $5500
UPDATE salaries 
SET salary_amount = salary_amount + 5500 
WHERE employee_id = 6;

-- Increase the salary of the employee with ID 7 by $6000
UPDATE salaries 
SET salary_amount = salary_amount + 6000 
WHERE employee_id = 7;

-- Increase the salary of the employee with ID 8 by $4000
UPDATE salaries 
SET salary_amount = salary_amount + 4000 
WHERE employee_id = 8;

-- Increase the salary of the employee with ID 9 by $3500
UPDATE salaries 
SET salary_amount = salary_amount + 3500 
WHERE employee_id = 9;

-- Increase the salary of the employee with ID 10 by $8000
UPDATE salaries 
SET salary_amount = salary_amount + 8000 
WHERE employee_id = 10;

-- ===============================================
-- Explanation:
-- ===============================================
-- Each of these UPDATE statements adjusts the salary for a specific employee in the `salaries` table.
-- The `salary_amount` is increased by the specified amount based on the `employee_id`.
-- The trigger `LogSalaryChange`, which was previously created, automatically logs the old salary,
-- new salary, and the change date into the `salary_changes_log` table for every update.
-- This ensures that all salary modifications are tracked and recorded without the need for manual logging.