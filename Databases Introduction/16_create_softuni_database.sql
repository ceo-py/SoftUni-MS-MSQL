CREATE DATABASE SoftUni;

USE SoftUni;

CREATE TABLE Towns (
  Id INT PRIMARY KEY IDENTITY(1,1),
  Name VARCHAR(100) NOT NULL
);

CREATE TABLE Addresses (
  Id INT PRIMARY KEY IDENTITY(1,1),
  AddressText VARCHAR(200) NOT NULL,
  TownId INT NOT NULL,
  FOREIGN KEY (TownId) REFERENCES Towns(Id)
);

CREATE TABLE Departments (
  Id INT PRIMARY KEY IDENTITY(1,1),
  Name VARCHAR(100) NOT NULL
);

CREATE TABLE Employees (
  Id INT PRIMARY KEY IDENTITY(1,1),
  FirstName VARCHAR(100) NOT NULL,
  MiddleName VARCHAR(100) NULL,
  LastName VARCHAR(100) NOT NULL,
  JobTitle VARCHAR(100) NOT NULL,
  DepartmentId INT NOT NULL,
  HireDate DATE NOT NULL,
  Salary DECIMAL(10,2) NOT NULL,
  AddressId INT NOT NULL,
  FOREIGN KEY (DepartmentId) REFERENCES Departments(Id),
  FOREIGN KEY (AddressId) REFERENCES Addresses(Id)
);

INSERT INTO Towns (Name)
VALUES ('Sofia'), ('Plovdiv'), ('Varna');

INSERT INTO Addresses (AddressText, TownId)
VALUES ('1 Main St', 1), ('2 Main St', 2), ('3 Main St', 3);

INSERT INTO Departments (Name)
VALUES ('IT'), ('HR'), ('Marketing');

INSERT INTO Employees (FirstName, MiddleName, LastName, JobTitle, DepartmentId, HireDate, Salary, AddressId)
VALUES ('John', 'Doe', 'Smith', 'Manager', 1, '2022-01-01', 5000.00, 1),
       ('Jane', 'Doe', 'Johnson', 'Developer', 1, '2022-02-01', 6000.00, 2),
       ('Jim', 'D', 'Brown', 'Marketing Manager', 3, '2022-03-01', 7000.00, 3);
