



















INNER JOIN

-- Returns only the rows where there is a match between both tables based on the specified join condition.

-- wants to identify the current salary of each employee along with their department name. To achieve this, they need to combine information from the Employees, Departments, and Salaries tables.


SELECT Employees.FirstName, Employees.LastName, Departments.DepartmentName, Salaries.Salary
FROM Employees
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
INNER JOIN Salaries ON Employees.EmployeeID = Salaries.EmployeeID
WHERE Salaries.EndDate IS NULL; 


LEFT JOIN

-- Returns all rows from the left table, and the matched rows from the right table. 
-- If there is no match, the result set will contain NULL values for the columns from the right table.

-- wants to see a list of all employees and the projects they are currently working on (if any).  This report should include employees who haven't been assigned to any projects yet.

SELECT Employees.FirstName, Employees.LastName, Projects.ProjectName
FROM Employees
LEFT JOIN Employees_Projects ON Employees.EmployeeID = Employees_Projects.EmployeeID
LEFT JOIN Projects ON Employees_Projects.ProjectID = Projects.ProjectID
WHERE Employees_Projects.EndDate IS NULL OR Employees_Projects.EndDate >= CURRENT_DATE;



RIGHT JOIN 

-- Returns all rows from the right table, and the matched rows from the left table. If there is no match, the result set will contain NULL values for the columns from the left table.

-- is reviewing its project portfolio and wants to identify all projects, whether active or inactive, along with the employees currently assigned to each project (if any).

SELECT Projects.ProjectName, Employees.FirstName, Employees.LastName 
FROM Employees
RIGHT JOIN Employees_Projects ON Employees.EmployeeID = Employees_Projects.EmployeeID
RIGHT JOIN Projects ON Employees_Projects.ProjectID = Projects.ProjectID
WHERE Employees_Projects.EndDate IS NULL OR Employees_Projects.EndDate >= CURRENT_DATE;
