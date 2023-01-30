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



--
--   CREATE TABLE Categories (
--   Id INT PRIMARY KEY,
--   CategoryName VARCHAR(50) NOT NULL,
--   DailyRate DECIMAL(10,2) NOT NULL,
--   WeeklyRate DECIMAL(10,2) NOT NULL,
--   MonthlyRate DECIMAL(10,2) NOT NULL,
--   WeekendRate DECIMAL(10,2) NOT NULL
-- );
--
-- CREATE TABLE Cars (
--   Id INT PRIMARY KEY,
--   PlateNumber VARCHAR(10) NOT NULL,
--   Manufacturer VARCHAR(50) NOT NULL,
--   Model VARCHAR(50) NOT NULL,
--   CarYear INT NOT NULL,
--   CategoryId INT NOT NULL,
--   Doors INT NOT NULL,
--   Picture VARCHAR(50),
--   Condition VARCHAR(50) NOT NULL,
--   Available TINYINT NOT NULL,
--   FOREIGN KEY (CategoryId) REFERENCES Categories(Id)
-- );
--
-- CREATE TABLE Employees (
--   Id INT PRIMARY KEY,
--   FirstName VARCHAR(50) NOT NULL,
--   LastName VARCHAR(50) NOT NULL,
--   Title VARCHAR(50) NOT NULL,
--   Notes VARCHAR(100)
-- );
--
-- CREATE TABLE Customers (
--   Id INT PRIMARY KEY,
--   DriverLicenceNumber VARCHAR(20) NOT NULL,
--   FullName VARCHAR(100) NOT NULL,
--   Address VARCHAR(100) NOT NULL,
--   City VARCHAR(50) NOT NULL,
--   ZIPCode VARCHAR(10) NOT NULL,
--   Notes VARCHAR(100)
-- );
--
-- CREATE TABLE RentalOrders (
--   Id INT PRIMARY KEY,
--   EmployeeId INT NOT NULL,
--   CustomerId INT NOT NULL,
--   CarId INT NOT NULL,
--   TankLevel DECIMAL(5,2) NOT NULL,
--   KilometrageStart INT NOT NULL,
--   KilometrageEnd INT NOT NULL,
--   TotalKilometrage INT NOT NULL,
--   StartDate DATE NOT NULL,
--   EndDate DATE NOT NULL,
--   TotalDays INT NOT NULL,
--   RateApplied DECIMAL(10,2) NOT NULL,
--   TaxRate DECIMAL(5,2) NOT NULL,
--   OrderStatus VARCHAR(50) NOT NULL,
--   Notes VARCHAR(100),
--   FOREIGN KEY (EmployeeId) REFERENCES Employees(Id),
--   FOREIGN KEY (CustomerId) REFERENCES Customers(Id),
--   FOREIGN KEY (CarId) REFERENCES Cars(Id)
-- );
--
-- INSERT INTO Categories (Id, CategoryName, DailyRate, WeeklyRate, MonthlyRate, WeekendRate)
-- VALUES (1, 'Economy', 50, 300, 1000, 60),
--        (2, 'Compact', 60, 400, 1200, 70),
--        (3, 'Luxury', 100, 700, 2500, 120);
--
-- INSERT INTO Cars (Id, PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors, Picture, Condition, Available)
-- VALUES (1, 'ABC123', 'Toyota', 'Camry', 2020, 1, 4, 'camry.jpg', 'Excellent', 1),
--        (2, 'DEF456', 'Honda', 'Civic', 2021, 2, 4, 'civic.jpg', 'Good', 1),
--        (3, 'GHI789', 'BMW', '7 Series', 2022, 3, 4, '7series.jpg', 'Excellent', 1);
--
-- INSERT INTO Employees (Id, FirstName, LastName, Title, Notes)
-- VALUES (1, 'John', 'Doe', 'Manager', 'Experienced Manager'),
--        (2, 'Jane', 'Doe', 'Employee', 'Friendly Employee'),
--        (3, 'Jim', 'Smith', 'Employee', 'Expert Mechanic');
--
-- INSERT INTO Customers (Id, DriverLicenceNumber, FullName, Address, City, ZIPCode, Notes)
-- VALUES (1, 'A123456789', 'Jack Smith', '123 Main St', 'New York', '10001', 'Good Customer'),
--        (2, 'B234567890', 'Jane Doe', '456 Park Ave', 'Los Angeles', '90001', 'Regular Customer'),
--        (3, 'C345678901', 'John Doe', '789 Market St', 'Chicago', '60001', 'VIP Customer');
--
-- INSERT INTO RentalOrders (Id, EmployeeId, CustomerId, CarId, TankLevel, KilometrageStart, KilometrageEnd, TotalKilometrage, StartDate, EndDate, TotalDays, RateApplied, TaxRate, OrderStatus, Notes)
-- VALUES (1, 1, 1, 1, 0.7, 10000, 10500, 500, '2022-12-01', '2022-12-05', 5, 250, 0.1, 'Completed', 'Smooth Transaction'),
--        (2, 2, 2, 2, 0.5, 20000, 20250, 250, '2022-12-06', '2022-12-08', 2, 120, 0.05, 'Completed', 'Good Experience'),
--        (3, 3, 3, 3, 0.9, 30000, 30500, 500, '2022-12-09', '2022-12-12', 3, 450, 0.15, 'Completed', 'Luxury Ride');
--
--
