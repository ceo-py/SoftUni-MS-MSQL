CREATE TABLE Sizes (
  Id INT PRIMARY KEY IDENTITY,
  Length INT NOT NULL CHECK (Length >= 10 AND Length <= 25),
  RingRange DECIMAL(2,1) NOT NULL CHECK (RingRange >= 1.5 AND RingRange <= 7.5)
);

CREATE TABLE Tastes (
  Id INT PRIMARY KEY IDENTITY,
  TasteType VARCHAR(20) NOT NULL,
  TasteStrength VARCHAR(15) NOT NULL,
  ImageURL VARCHAR(100) NOT NULL,
);

CREATE TABLE Brands (
  Id INT PRIMARY KEY IDENTITY,
  BrandName VARCHAR(30) NOT NULL UNIQUE,
  BrandDescription VARCHAR(MAX),
);

CREATE TABLE Cigars (
  Id INT PRIMARY KEY IDENTITY,
  CigarName VARCHAR(80) NOT NULL,
  BrandId INT NOT NULL FOREIGN KEY REFERENCES Brands(Id),
  TastId INT NOT NULL FOREIGN KEY REFERENCES Tastes(Id),
  SizeId INT NOT NULL FOREIGN KEY REFERENCES Sizes(Id),
  PriceForSingleCigar DECIMAL(19,4) NOT NULL,
  ImageURL VARCHAR(100) NOT NULL,
);

CREATE TABLE Addresses (
  Id INT PRIMARY KEY IDENTITY,
  Town VARCHAR(30) NOT NULL,
  Country VARCHAR(30) NOT NULL,
  Streat VARCHAR(100) NOT NULL,
  ZIP VARCHAR(20) NOT NULL,
);

CREATE TABLE Clients (
  Id INT PRIMARY KEY IDENTITY,
  FirstName VARCHAR(30) NOT NULL,
  LastName VARCHAR(30) NOT NULL,
  Email VARCHAR(50) NOT NULL,
  AddressId INT NOT NULL FOREIGN KEY REFERENCES Addresses(Id),
);

CREATE TABLE ClientsCigars (
  ClientId INT FOREIGN KEY REFERENCES Clients(Id),
  CigarId INT FOREIGN KEY REFERENCES Cigars(Id),
  PRIMARY KEY (ClientId, CigarId)
);

