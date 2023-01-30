CREATE TABLE Categories (
  Id INT PRIMARY KEY IDENTITY(1,1),
  CategoryName VARCHAR(50) NOT NULL,
  DailyRate MONEY NOT NULL,
  WeeklyRate MONEY NOT NULL,
  MonthlyRate MONEY NOT NULL,
  WeekendRate MONEY NOT NULL
);

INSERT INTO Categories (CategoryName, DailyRate, WeeklyRate, MonthlyRate, WeekendRate)
VALUES
  ('Economy', 50, 300, 800, 60),
  ('Mid-Size', 60, 400, 900, 70),
  ('Luxury', 80, 500, 1000, 80);

CREATE TABLE Cars (
  Id INT PRIMARY KEY IDENTITY(1,1),
  PlateNumber VARCHAR(20) NOT NULL,
  Manufacturer VARCHAR(50) NOT NULL,
  Model VARCHAR(50) NOT NULL,
  CarYear INT NOT NULL,
  CategoryId INT NOT NULL,
  Doors TINYINT NOT NULL,
  Picture VARCHAR(MAX) NULL,
  [Condition] VARCHAR(50) NOT NULL,
  Available BIT NOT NULL,
  FOREIGN KEY (CategoryId) REFERENCES Categories(Id)
);

INSERT INTO Cars (PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors, [Condition], Available)
VALUES
  ('ABC-123', 'Toyota', 'Camry', 2020, 1, 4, 'Excellent', 1),
  ('DEF-456', 'Honda', 'Accord', 2021, 2, 4, 'Good', 1),
  ('GHI-789', 'Tesla', 'Model S', 2022, 3, 4, 'Excellent', 1);

CREATE TABLE Employees (
  Id INT PRIMARY KEY IDENTITY(1,1),
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Title VARCHAR(50) NOT NULL,
  Notes VARCHAR(MAX) NULL
);

INSERT INTO Employees (FirstName, LastName, Title, Notes)
VALUES
  ('John', 'Doe', 'Manager', NULL),
  ('Jane', 'Doe', 'Assistant Manager', NULL),
  ('Jim', 'Smith', 'Clerk', NULL);

CREATE TABLE Customers (
  Id INT PRIMARY KEY IDENTITY(1,1),
  DriverLicenceNumber VARCHAR(50) NOT NULL,
  FullName VARCHAR(100) NOT NULL,
  Address VARCHAR(100) NOT NULL,
  City VARCHAR(50) NOT NULL,
  ZIPCode VARCHAR(10) NOT NULL,
  Notes VARCHAR(MAX) NULL
);

INSERT INTO Customers (DriverLicenceNumber, FullName, Address, City, ZIPCode, Notes)
VALUES
  ('DL-123', 'John Doe', '123 Main St', 'Anytown', '12345', NULL),
  ('DL-456', 'Jane Doe', '456 Elm St', 'Anytown', '12345', NULL),
  ('DL-789', 'Jim Smith', '789 Oak St', 'Anytown', '12345', NULL);

CREATE TABLE RentalOrders (
  Id INT PRIMARY KEY IDENTITY(1,1),
  EmployeeId INT NOT NULL,
  CustomerId INT NOT NULL,
  CarId INT NOT NULL,
  TankLevel FLOAT NOT NULL,
  KilometrageStart INT NOT NULL,
  KilometrageEnd INT NOT NULL,
  TotalKilometrage INT NOT NULL,
  StartDate DATETIME NOT NULL,
  EndDate DATETIME NOT NULL,
  TotalDays INT NOT NULL,
  RateApplied FLOAT NOT NULL,
  TaxRate FLOAT NOT NULL,
  OrderStatus NVARCHAR(50) NOT NULL,
  Notes NVARCHAR(MAX) NULL,
  CONSTRAINT FK_RentalOrders_Employees FOREIGN KEY (EmployeeId) REFERENCES Employees (Id),
  CONSTRAINT FK_RentalOrders_Customers FOREIGN KEY (CustomerId) REFERENCES Customers (Id),
  CONSTRAINT FK_RentalOrders_Cars FOREIGN KEY (CarId) REFERENCES Cars (Id)
);

INSERT INTO RentalOrders (EmployeeId, CustomerId, CarId, TankLevel, KilometrageStart, KilometrageEnd, TotalKilometrage, StartDate, EndDate, TotalDays, RateApplied, TaxRate, OrderStatus, Notes)
VALUES
  (1, 1, 1, 0.7, 10000, 10500, 500, '2022-01-01 10:00:00', '2022-01-05 10:00:00', 4, 100.0, 0.13, 'Completed', 'Order completed without any issues'),
  (2, 2, 2, 0.5, 20000, 20500, 500, '2022-02-01 10:00:00', '2022-02-05 10:00:00', 4, 120.0, 0.13, 'Completed', 'Order completed without any issues'),
  (3, 3, 3, 0.6, 30000, 30500, 500, '2022-03-01 10:00:00', '2022-03-05 10:00:00', 4, 140.0, 0.13, 'Completed', 'Order completed without any issues');

