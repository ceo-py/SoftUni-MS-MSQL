CREATE TABLE Persons (
    PersonID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    FirstName VARCHAR(50),
    Salary DECIMAL(10,2),
	PassportID INT
);

INSERT INTO Persons (FirstName, Salary)
VALUES ('Roberto', 43300.00),
       ('Tom', 56100.00),
       ('Yana', 60200.00);

CREATE TABLE Passports (
    PassportID INT PRIMARY KEY IDENTITY(101,1) NOT NULL,
    PassportNumber VARCHAR(50)
);

INSERT INTO Passports (PassportNumber)
VALUES ('N34FG21B'),
       ('K65LO4R7'),
       ('ZE657QP2');


ALTER TABLE Persons
ADD FOREIGN KEY (PassportID) REFERENCES Passports(PassportID);
