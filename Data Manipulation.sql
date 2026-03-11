-- 1. Select all columns from the "Employees" table.
SELECT *
FROM Employees;


-- 2. Select only the "Name" and "Salary" columns from the "Employees" table.
SELECT Name, Salary
FROM Employees;


-- 3. Select distinct values of the "DeptName" column from the "Employees" table.
SELECT DISTINCT DeptName
FROM Employees;


-- 4. Select the top 5 records from the "Employees" table.
SELECT TOP 5 *
FROM Employees;


-- 5. Select all records from the "Employees" table, ordered by the "Salary" column in descending order.
SELECT *
FROM Employees
ORDER BY Salary DESC;


-- 6. Select the first 10 records from the "Employees" table, starting from the third record.
SELECT *
FROM Employees
ORDER BY (SELECT NULL)
OFFSET 2 ROWS FETCH NEXT 10 ROWS ONLY;


-- 7. Select the average salary from the "Employees" table.
SELECT AVG(Salary) AS AverageSalary
FROM Employees;


-- 8. Select the maximum and minimum salaries from the "Employees" table.
SELECT MAX(Salary) AS MaxSalary,
       MIN(Salary) AS MinSalary
FROM Employees;


-- 9. Select the top 3 highest salaries from the "Employees" table.
SELECT TOP 3 Salary
FROM Employees
ORDER BY Salary DESC;


-- 10. Select all records from the "Employees" table, ordered by "Name" in ascending order.
SELECT *
FROM Employees
ORDER BY Name ASC;


-- 11. Select the first 5 records from the "Employees" table, starting from the second record,
-- ordered by "Salary" in descending order.
SELECT *
FROM Employees
ORDER BY Salary DESC
OFFSET 1 ROWS FETCH NEXT 5 ROWS ONLY;


-- 12. Select the sum of all salaries from the "Employees" table.
SELECT SUM(Salary) AS TotalSalaries
FROM Employees;


-- 13. Select records where the "Salary" is between 40000 and 60000,
-- ordered by "Salary" in ascending order.
SELECT *
FROM Employees
WHERE Salary BETWEEN 40000 AND 60000
ORDER BY Salary ASC;