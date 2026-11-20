-- ==========================================
-- Script to Check Normalization Forms
-- ==========================================

-- ==========================================
-- Step 1: Check for First Normal Form (1NF)
-- ==========================================
-- 1NF requires that each table column contains only atomic values (no multiple values in a single column)
-- and that each entry in a column is of the same data type.

-- The following query checks for columns that might violate 1NF by looking for potential multi-valued columns (e.g., columns containing commas).
SELECT table_name, column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'employee_management'  -- Filter for the 'employee_management' schema
AND data_type IN ('varchar', 'char', 'text')  -- Check only text-based columns
AND column_name LIKE '%,%';  -- Look for columns that may contain multiple values separated by commas

-- Explanation:
-- This query scans the text-based columns in all tables within the 'employee_management' schema.
-- It looks for columns containing commas, which may suggest that multiple values are being stored in a single field,
-- potentially violating the 1NF rule of atomicity.

-- Another check for 1NF violations using DISTINCT to identify duplicate rows.
SELECT table_name, COUNT(DISTINCT column_name) AS unique_columns
FROM information_schema.columns
WHERE table_schema = 'employee_management'
GROUP BY table_name
HAVING COUNT(column_name) != COUNT(DISTINCT column_name);

-- Explanation:
-- This query helps to identify tables where there might be duplicate values in columns.
-- By using `DISTINCT`, the query counts the number of unique column names in each table.
-- If the count of all columns differs from the count of distinct columns, it suggests that the table might contain duplicate values, which could indicate a 1NF violation.

-- ==========================================
-- Step 2: Check for Second Normal Form (2NF)
-- ==========================================
-- 2NF requires that all non-key attributes are fully functionally dependent on the entire primary key.
-- This means there should be no partial dependency, especially in tables with composite keys.

-- First, identify tables with composite primary keys.
SELECT table_name, COUNT(DISTINCT column_name) AS key_columns
FROM information_schema.key_column_usage
WHERE table_schema = 'employee_management'  -- Filter for the 'employee_management' schema
GROUP BY table_name
HAVING key_columns > 1;  -- Select tables with composite primary keys (more than one column as a key)

-- Explanation:
-- This query identifies tables that have composite primary keys (more than one column as a primary key).
-- These are the tables that need to be examined for 2NF violations.

-- Next, check if there are any non-key columns in these tables.
SELECT column_name, table_name
FROM information_schema.columns
WHERE table_schema = 'employee_management'  -- Filter for the 'employee_management' schema
AND table_name IN (
    SELECT table_name
    FROM information_schema.key_column_usage
    WHERE table_schema = 'employee_management'
    GROUP BY table_name
    HAVING COUNT(DISTINCT column_name) > 1  -- Focus on tables with composite keys
)
AND column_name NOT IN (
    SELECT column_name
    FROM information_schema.key_column_usage
    WHERE table_schema = 'employee_management'
);

-- Explanation:
-- This query lists non-key columns in tables with composite primary keys.
-- If these non-key columns are dependent on only part of the composite key, they would violate 2NF.
-- However, identifying the specific partial dependencies would require further domain-specific analysis.

-- ==========================================
-- Step 3: Check for Third Normal Form (3NF)
-- ==========================================
-- 3NF requires that all the attributes are functionally dependent only on the primary key and not on any other non-key attributes.
-- This means no transitive dependencies should exist.

-- Identify potential transitive dependencies by checking relationships between non-key attributes.
SELECT table_name, column_name, referenced_table_name, referenced_column_name
FROM information_schema.key_column_usage
WHERE table_schema = 'employee_management'  -- Filter for the 'employee_management' schema
AND referenced_table_name IS NOT NULL  -- Only consider columns that are foreign keys
AND column_name NOT IN (
    SELECT column_name
    FROM information_schema.key_column_usage
    WHERE table_schema = 'employee_management'
);

-- Explanation:
-- This query checks for foreign key references where the foreign key is not part of the primary key.
-- If a non-key column in one table references another table's key, it might indicate a transitive dependency, which violates 3NF.
-- For example, if a column "department_name" in the `employees` table references `departments`, it should instead store only `department_id`.

-- ==========================================
-- Step 4: Check for Boyce-Codd Normal Form (BCNF)
-- ==========================================
-- BCNF is an enhancement of 3NF where for every functional dependency X -> Y, X should be a superkey.
-- This means that every determinant in a functional dependency should be a candidate key.

-- Identify dependencies that violate BCNF.
SELECT table_name, column_name, referenced_table_name, referenced_column_name
FROM information_schema.key_column_usage
WHERE table_schema = 'employee_management'  -- Filter for the 'employee_management' schema
AND referenced_table_name IS NOT NULL  -- Only consider columns that are foreign keys
AND table_name NOT IN (
    SELECT DISTINCT table_name
    FROM information_schema.table_constraints
    WHERE table_schema = 'employee_management'
    AND constraint_type = 'PRIMARY KEY'
);

-- Explanation:
-- This query looks for foreign key references where the referencing column is not a superkey.
-- Violations here may indicate that some tables need to be further normalized to comply with BCNF.
-- For instance, if a non-primary key column is a foreign key in another table but is not a candidate key, this would violate BCNF.

-- ==========================================
-- Additional Considerations
-- ==========================================
-- After running the above checks, it’s important to manually review the results.
-- Some violations, especially for 2NF and 3NF, might require domain knowledge to fully understand and address.
-- These checks provide a strong foundation but may need refinement based on specific use cases or business rules.