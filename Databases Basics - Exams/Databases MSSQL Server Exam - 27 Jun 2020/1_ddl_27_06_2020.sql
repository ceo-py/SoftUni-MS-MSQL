CREATE TABLE Clients (
  ClientId INT PRIMARY KEY IDENTITY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Phone VARCHAR(12) CHECK(LEN(Phone) = 12),
);


CREATE TABLE Mechanics (
  MechanicId INT PRIMARY KEY IDENTITY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Address VARCHAR(255),
);


CREATE TABLE Models (
  ModelId INT PRIMARY KEY IDENTITY,
  Name VARCHAR(50) UNIQUE
);

CREATE TABLE Jobs (
  JobId INT PRIMARY KEY IDENTITY,
  ModelId INT FOREIGN KEY REFERENCES Models(ModelId),
  Status VARCHAR(11) DEFAULT 'Pending' CHECK(Status IN ( 'Pending', 'In Progress', 'Finished')),
  ClientId INT FOREIGN KEY REFERENCES Clients(ClientId),
  MechanicId INT FOREIGN KEY REFERENCES Mechanics(MechanicId),
  IssueDate DATETIME,
  FinishDate DATETIME,
);


CREATE TABLE Orders (
  OrderId INT PRIMARY KEY IDENTITY,
  JobId INT FOREIGN KEY REFERENCES Jobs(JobId),
  IssueDate DATETIME,
  Delivered TINYINT DEFAULT 0
);

CREATE TABLE Vendors (
  VendorId INT PRIMARY KEY IDENTITY,
  Name VARCHAR(50) UNIQUE
);


CREATE TABLE Parts (
  PartId INT PRIMARY KEY IDENTITY,
  SerialNumber VARCHAR(50) UNIQUE,
  Description VARCHAR(255),
  Price Money CHECK(Price > 0 and PRICE <= 9999.99),
  VendorId INT FOREIGN KEY REFERENCES Vendors(VendorId),
  StockQty INT DEFAULT 15 CHECK(StockQty > 0)
);


CREATE TABLE OrderParts (
  OrderId INT FOREIGN KEY REFERENCES Orders(OrderId),
  PartId INT FOREIGN KEY REFERENCES Parts(PartId),
  Quantity INT DEFAULT 1 CHECK(Quantity > 0),
  PRIMARY KEY(OrderId, PartId)
);


CREATE TABLE PartsNeeded (
  JobId INT FOREIGN KEY REFERENCES Jobs(JobId),
  PartId INT FOREIGN KEY REFERENCES Parts(PartId),
  Quantity INT DEFAULT 1 CHECK(Quantity > 0),
  PRIMARY KEY(JobId, PartId)
);
