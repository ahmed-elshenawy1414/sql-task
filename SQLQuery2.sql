-- 1. Create a table named "Employees" with columns for ID, Name, and Salary
CREATE TABLE Employees (
    ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Salary DECIMAL(10,2)
);

-- 2. Add a new column named "Department" to the "Employees" table
ALTER TABLE Employees
ADD Department VARCHAR(50);

-- 3. Remove the "Salary" column from the "Employees" table
ALTER TABLE Employees
DROP COLUMN Salary;

-- 4. Rename the "Department" column in the "Employees" table to "DeptName"
EXEC sp_rename 'Employees.Department', 'DeptName', 'COLUMN';

-- 5. Create a new table called "Projects"
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100)
);

-- 6. Add a primary key constraint to the "Employees" table for the "ID" column
-- (Already created as PRIMARY KEY in step 1)

-- 7. Create a foreign key relationship between Employees and Projects
ALTER TABLE Employees
ADD ProjectID INT;

ALTER TABLE Employees
ADD CONSTRAINT FK_Employees_Projects
FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID);

-- 8. Remove the foreign key relationship between Employees and Projects
ALTER TABLE Employees
DROP CONSTRAINT FK_Employees_Projects;

-- 9. Add a unique constraint to the "Name" column in the "Employees" table
ALTER TABLE Employees
ADD CONSTRAINT UQ_Employees_Name UNIQUE (Name);

-- 10. Create a table named "Customers"
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Status VARCHAR(20)
);

-- 11. Add a unique constraint to FirstName and LastName
ALTER TABLE Customers
ADD CONSTRAINT UQ_Customers_Name UNIQUE (FirstName, LastName);

-- 12. Add a default value of 'Active' for the Status column
ALTER TABLE Customers
ADD CONSTRAINT DF_Customers_Status DEFAULT 'Active' FOR Status;

-- 13. Create a table named "Orders"
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10,2)
);

-- 14. Add a check constraint to ensure TotalAmount > 0
ALTER TABLE Orders
ADD CONSTRAINT CHK_TotalAmount CHECK (TotalAmount > 0);

-- 15. Create a schema named "Sales"
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Sales')
BEGIN
    EXEC('CREATE SCHEMA Sales');
END;

-- Move the Orders table to Sales schema
ALTER SCHEMA Sales TRANSFER dbo.Orders;

-- 16. Rename the "Orders" table to "SalesOrders"
EXEC sp_rename 'Sales.Orders', 'SalesOrders';