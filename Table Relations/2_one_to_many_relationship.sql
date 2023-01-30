CREATE TABLE Manufacturers (
    ManufacturerID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    Name VARCHAR(50) NOT NULL,
    EstablishedOn DATE NOT NULL,
);

INSERT INTO Manufacturers (Name, EstablishedOn)
VALUES ('BMW', '1916-03-07'),
	   ('Tesla', '2003-01-01'),
	   ('Lada', '1966-05-01');


CREATE TABLE Models (
    ModelID INT PRIMARY KEY IDENTITY(101,1) NOT NULL,
    Name VARCHAR(50) NOT NULL,
    ManufacturerID INT NOT NULL,
);

INSERT INTO Models (Name, ManufacturerID)
VALUES ('X1', 1),
       ('i6', 1),
       ('Model S', 2),
       ('Model X', 2),
       ('Model 3', 2),
       ('Nova', 3);


ALTER TABLE Models
ADD FOREIGN KEY (ManufacturerID) REFERENCES Manufacturers(ManufacturerID);
