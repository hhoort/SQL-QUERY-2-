CREATE database flower;

	-- Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
);
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
    (1, 'HR'),
    (2, 'IT'),
    (3, 'Finance');

--Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10, 2),
	  FOREIGN KEY (DepartmentID) REFERENCES Departments (DepartmentID)
);
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary)
VALUES
    (1, 'John', 'Doe', 1, 60000.00),
    (2, 'Jane', 'Smith', 2, 55000.00),
    (3, 'Mike', 'Johnson', 1, 65000.00),
    (4, 'Emily', 'Williams', 3, 70000.00),
    (5, 'David', 'Brown', 2, 50000.00),
    (6, 'Sarah', 'Miller', 1, 62000.00),
    (7, 'Chris', 'Wilson', 3, 75000.00),
    (8, 'Anna', 'Jones', 2, 53000.00),
    (9, 'Brian', 'Taylor', 1, 58000.00),
    (10, 'Laura', 'Anderson', 3, 72000.00);

		select * from Employees;
    select * from Departments;

	alter table Employees add project varchar(255);
	update Employees set project='covid-19 test vaccine'where EmployeeID=1;
	update Employees set project='e-commerce book'where EmployeeID=2;
	update Employees set project='covid-19 test vaccine'where EmployeeID=3;
	update Employees set project='music online play'where EmployeeID=4;
	update Employees set project='covid-19 test vaccine'where EmployeeID=5;
	update Employees set project='online booking tickets'where EmployeeID=6;
	update Employees set project='online couses 'where EmployeeID=7;
	update Employees set project='covid-19 test vaccine'where EmployeeID=8;
	update Employees set project='learning arabic course'where EmployeeID=9;
	update Employees set project='food online booking'where EmployeeID=10;

--4. Assign each employee to a department in the Employees table.
SELECT  e.FirstName, d.DepartmentName
FROM Employees e INNER JOIN Departments d ON E.DepartmentID = D.DepartmentID;
	-- Retrieve the details of employees whose salary is above 50000.
SELECT * FROM Employees where salary>50000;
-- Fetch a list of all employees along with the department they belong to.
SELECT e.EmployeeID, e.FirstName, e.LastName, e.Salary, d.DepartmentName
FROM Employees e INNER JOIN Departments d ON E.DepartmentID = D.DepartmentID;
--7. Retrieve the employees whose last name starts with 'S'.
SELECT * FROM Employees WHERE LastName LIKE 'S%';
--8. Retrieve the projects with names containing the word 'covid-19 test vaccine'.
select * from Employees WHERE project='covid-19 test vaccine';
--9. Calculate the total salary of all employees.
select SUM(salary) from Employees;
--10.Find the department with the highest average salary.
SELECT d.DepartmentID, d.DepartmentName, AVG(e.Salary) AS AvgSalary FROM Departments d inner JOIN Employees e ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName;


                             


