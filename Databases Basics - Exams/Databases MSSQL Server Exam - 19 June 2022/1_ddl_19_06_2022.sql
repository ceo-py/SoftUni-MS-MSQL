
CREATE TABLE Owners (
  Id INT PRIMARY KEY IDENTITY,
  Name VARCHAR(50) NOT NULL,
  PhoneNumber VARCHAR(15) NOT NULL,
  Address VARCHAR(50)
);

CREATE TABLE AnimalTypes (
  Id INT PRIMARY KEY IDENTITY,
  AnimalType VARCHAR(30) NOT NULL
);

CREATE TABLE Cages (
  Id INT PRIMARY KEY IDENTITY,
  AnimalTypeId INT NOT NULL,
  FOREIGN KEY (AnimalTypeId) REFERENCES AnimalTypes(Id)
);

CREATE TABLE Animals (
  Id INT PRIMARY KEY IDENTITY,
  Name VARCHAR(30) NOT NULL,
  BirthDate DATE NOT NULL,
  OwnerId INT,
  AnimalTypeId INT NOT NULL,
  FOREIGN KEY (OwnerId) REFERENCES Owners(Id),
  FOREIGN KEY (AnimalTypeId) REFERENCES AnimalTypes(Id)
);

CREATE TABLE AnimalsCages (
  CageId INT NOT NULL,
  AnimalId INT NOT NULL,
  FOREIGN KEY (CageId) REFERENCES Cages(Id),
  FOREIGN KEY (AnimalId) REFERENCES Animals(Id),
  PRIMARY KEY (CageId, AnimalId)
);

CREATE TABLE VolunteersDepartments (
  Id INT PRIMARY KEY IDENTITY,
  DepartmentName VARCHAR(30) NOT NULL
);

CREATE TABLE Volunteers (
  Id INT PRIMARY KEY IDENTITY,
  Name VARCHAR(50) NOT NULL,
  PhoneNumber VARCHAR(15) NOT NULL,
  Address VARCHAR(50),
  AnimalId INT,
  DepartmentId INT NOT NULL,
  FOREIGN KEY (AnimalId) REFERENCES Animals(Id),
  FOREIGN KEY (DepartmentId) REFERENCES VolunteersDepartments(Id)
);
