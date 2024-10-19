-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20),
    PurchaseAmount DECIMAL(10, 2),
    RegistrationDate DATE
);

-- Insert Sample Data into Customers Table
INSERT INTO Customers (CustomerID, FirstName, LastName, Age, Email, PhoneNumber, PurchaseAmount, RegistrationDate) VALUES
(1, 'John', 'Doe', 25, 'john.doe@example.com', '123-456-7890', 500.50, '2023-01-15'),
(2, 'Jane', 'Doe', 30, 'jane.doe@example.com', '987-654-3210', 600.75, '2023-02-20'),
(3, 'John', 'Doe', 25, 'john.doe@example.com', '123-456-7890', 500.50, '2023-01-15'), -- Duplicate Row
(4, 'Alice', 'Smith', 35, 'alice.smith@example.com', '555-123-4567', 10000.00, '2023-03-10'), -- Outlier in PurchaseAmount
(5, 'Bob', 'Johnson ', NULL, 'bob.johnson@example.com', ' 333-333-3333', NULL, '2023-05-05'); -- Extra spaces, missing Age and PurchaseAmount

#Removing Duplicates
-- Find duplicate rows
SELECT FirstName, LastName, COUNT(*)
FROM Customers
GROUP BY FirstName, LastName
HAVING COUNT(*) > 1;

-- Remove duplicate rows (keep one record)
DELETE FROM Customers
WHERE CustomerID NOT IN (
    SELECT MIN(CustomerID) FROM Customers
    GROUP BY FirstName, LastName
);

#Removing Extra Spaces
-- Remove extra spaces from LastName
UPDATE Customers
SET LastName = TRIM(LastName);

-- Remove extra spaces from PhoneNumber
UPDATE Customers
SET PhoneNumber = TRIM(PhoneNumber);

#Checking for Outliers
-- Check for outliers (PurchaseAmount less than 0 or more than 5000)
SELECT * FROM Customers
WHERE PurchaseAmount < 0 OR PurchaseAmount > 5000;

#Correcting Errors
-- Correct phone numbers by replacing spaces with hyphens
UPDATE Customers
SET PhoneNumber = REPLACE(PhoneNumber, ' ', '-');

#Checking for Missing Values
-- Find rows with missing Age or PurchaseAmount
SELECT * FROM Customers
WHERE Age IS NULL OR PurchaseAmount IS NULL;

#Standardizing Data
-- Convert email addresses to lowercase
SET SQL_SAFE_UPDATES = 0;
UPDATE Customers
SET Email = LOWER(Email);

#Validating Data
-- Check if Age is within the range of 18 to 100
SELECT * FROM Customers
WHERE Age < 18 OR Age > 100;


