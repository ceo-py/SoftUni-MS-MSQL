INSERT INTO Towns (Name)
VALUES ('Sofia'), ('Plovdiv'), ('Varna'), ('Burgas');

INSERT INTO Departments (Name)
VALUES ('Engineering'), ('Sales'), ('Marketing'), ('Software Development'), ('Quality Assurance');

INSERT INTO Employees (FirstName, MiddleName, LastName, JobTitle, DepartmentId, HireDate, Salary, AddressId)
VALUES
('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', (SELECT Id FROM Departments WHERE Name = 'Software Development'), '2013-02-01', 3500, 1),
('Petar', 'Petrov', 'Petrov', 'Senior Engineer', (SELECT Id FROM Departments WHERE Name = 'Engineering'), '2004-03-02', 4000, 1),
('Maria', 'Petrova', 'Ivanova', 'Intern', (SELECT Id FROM Departments WHERE Name = 'Quality Assurance'), '2016-08-28', 525.25, 1),
('Georgi', 'Teziev', 'Ivanov', 'CEO', (SELECT Id FROM Departments WHERE Name = 'Sales'), '2007-12-09', 3000.00, 1),
('Peter', 'Pan', 'Pan', 'Intern', 3, '2006-08-28', 599.88, 1);
