                          # RegeX as REGEXP 
-- Step 1: Use the 'classicmodels' schema
USE classicmodels;

-- Step 2: Basic usage of RegEx operators
-- 2.1: Find customers whose first name starts with 'A'
SELECT * 
FROM customers 
WHERE contactFirstName REGEXP '^a';  -- ^ indicates the start of the string

-- Explanation:
-- The caret symbol (^) means that the match should occur at the beginning of the string.
-- This query will return all customers whose first name starts with the letter 'A'.

-- 2.2: Find customers whose first name ends with 's'
SELECT * 
FROM customers 
WHERE contactFirstName REGEXP 's$';  -- $ indicates the end of the string

-- Explanation:
-- The dollar symbol ($) means that the match should occur at the end of the string.
-- This query will return all customers whose first name ends with 's'.

-- 2.3: Find customers whose phone number starts with '9'
SELECT * 
FROM customers 
WHERE phone REGEXP '^9';  -- ^ indicates the string starts with '9'

-- Explanation:
-- This query will return all customers whose phone number starts with the digit '9'.
-- This can be useful for filtering based on the initial digits of phone numbers.

-- 2.4: Find customers whose first name contains 'ar'
SELECT * 
FROM customers 
WHERE contactFirstName REGEXP 'ar';  -- 'ar' matches anywhere in the string

-- Explanation:
-- This query looks for the substring 'ar' anywhere in the first name.
-- It returns any customer whose first name contains 'ar', like "Carine" or "Mark".

-- 2.5: Find products whose code starts with 'S' and ends with a digit between 5 and 9
SELECT * 
FROM products 
WHERE productCode REGEXP '^s.*[5-9]$';  -- ^s for start with 'S', .* for any characters, [5-9]$ for end with digit 5-9

-- Explanation:
-- ^s: The product code must start with the letter 'S'.
-- .*: Any number of characters (0 or more) can appear after the 'S'.
-- [5-9]$: The product code must end with a digit between 5 and 9.
-- This query will return product codes like 'S1235' or 'S98'.

-- Step 3: Using character classes and ranges
-- 3.1: Find customers whose first name starts with a vowel (A, E, I, O, U)
SELECT * 
FROM customers 
WHERE contactFirstName REGEXP '^[aeiou]';  -- Character class [aeiou]

-- Explanation:
-- The character class [aeiou] looks for any first name that starts with a vowel.
-- The query will return customers with names like "Anna", "Edgar", "Isla".

-- 3.2: Find products with codes containing any digit from 1 to 3
SELECT * 
FROM products 
WHERE productCode REGEXP '[1-3]';  -- Matches any product code that contains '1', '2', or '3'

-- Explanation:
-- The character class [1-3] looks for any occurrence of the digits 1, 2, or 3 within the product code.

-- Step 4: Combining conditions with alternation (logical OR)
-- 4.1: Find customers whose first name starts with either 'A' or 'B'
SELECT * 
FROM customers 
WHERE contactFirstName REGEXP '^(a|b)';  -- The pipe (|) is used for alternation (OR)

-- Explanation:
-- This query will return customers whose first name starts with either 'A' or 'B'.
-- The pipe (|) is a logical OR operator, allowing us to match multiple patterns.

-- Step 5: Working with quantifiers (number of occurrences)
-- 5.1: Find customers with first names that are exactly 5 characters long
SELECT * 
FROM customers 
WHERE contactFirstName REGEXP '^.{5}$';  -- . matches any character, {5} specifies exactly 5 occurrences

-- Explanation:
-- The dot (.) matches any single character.
-- The quantifier {5} means exactly 5 characters.
-- The caret (^) and dollar ($) symbols ensure that the entire name is exactly 5 characters long.

-- 5.2: Find products whose code has at least 2 digits
SELECT * 
FROM products 
WHERE productCode REGEXP '[0-9]{2,}';  -- {2,} specifies two or more digits

-- Explanation:
-- [0-9] matches any digit, and {2,} specifies at least 2 occurrences.
-- This query will return product codes that contain two or more digits, such as 'S123'.

-- Step 6: Special character classes
-- 6.1: Find customers whose phone number contains a digit (any number)
SELECT * 
FROM customers 
WHERE phone REGEXP '[[:digit:]]';  -- Matches any digit

-- Explanation:
-- [[:digit:]] is a predefined character class that matches any digit (0-9).
-- This is an alternative to using [0-9].

-- 6.2: Find customers whose phone number contains any letter (a-z)
SELECT * 
FROM customers 
WHERE phone REGEXP '[[:alpha:]]';  -- Matches any alphabetic character

-- Explanation:
-- [[:alpha:]] is a predefined character class that matches any letter (A-Z or a-z).
-- This query checks if the phone number contains any alphabetic characters, which could indicate an incorrect entry.

-- Step 7: Practical exercise
-- 7.1: Find customers whose first name contains either 'Jo' or 'Je', and ends with 'n'
SELECT * 
FROM customers 
WHERE contactFirstName REGEXP '(jo|je).*n$';

-- Explanation:
-- The pattern (jo|je) matches names that contain either 'Jo' or 'Je'.
-- .* matches any number of characters between the start and the end of the name.
-- n$ ensures that the name ends with 'n', such as "John" or "Jen".

-- 7.2: Find products whose code starts with 'F' or 'H' and ends with a digit
SELECT * 
FROM products 
WHERE productCode REGEXP '^(f|h).*[0-9]$';

-- Explanation:
-- The pattern ^(f|h) matches codes that start with 'F' or 'H'.
-- .* matches any number of characters between the start and the end of the code.
-- [0-9]$ ensures that the product code ends with a digit.