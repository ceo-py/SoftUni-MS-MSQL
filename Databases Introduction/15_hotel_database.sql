CREATE TABLE Employees (
  Id INT PRIMARY KEY IDENTITY(1,1),
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Title VARCHAR(50) NOT NULL,
  Notes TEXT
);

CREATE TABLE Customers (
  AccountNumber INT PRIMARY KEY,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  PhoneNumber VARCHAR(50) NOT NULL,
  EmergencyName VARCHAR(50) NOT NULL,
  EmergencyNumber VARCHAR(50) NOT NULL,
  Notes TEXT
);

CREATE TABLE RoomStatus (
  RoomStatus VARCHAR(50) PRIMARY KEY,
  Notes TEXT
);

CREATE TABLE RoomTypes (
  RoomType VARCHAR(50) PRIMARY KEY,
  Notes TEXT
);

CREATE TABLE BedTypes (
  BedType VARCHAR(50) PRIMARY KEY,
  Notes TEXT
);

CREATE TABLE Rooms (
  RoomNumber INT PRIMARY KEY,
  RoomType VARCHAR(50) NOT NULL,
  BedType VARCHAR(50) NOT NULL,
  Rate DECIMAL(10,2) NOT NULL,
  RoomStatus VARCHAR(50) NOT NULL,
  Notes TEXT,
  FOREIGN KEY (RoomType) REFERENCES RoomTypes(RoomType),
  FOREIGN KEY (BedType) REFERENCES BedTypes(BedType),
  FOREIGN KEY (RoomStatus) REFERENCES RoomStatus(RoomStatus)
);

CREATE TABLE Payments (
  Id INT PRIMARY KEY IDENTITY(1,1),
  EmployeeId INT NOT NULL,
  PaymentDate DATE NOT NULL,
  AccountNumber INT NOT NULL,
  FirstDateOccupied DATE NOT NULL,
  LastDateOccupied DATE NOT NULL,
  TotalDays INT NOT NULL,
  AmountCharged DECIMAL(10,2) NOT NULL,
  TaxRate DECIMAL(5,2) NOT NULL,
  TaxAmount DECIMAL(10,2) NOT NULL,
  PaymentTotal DECIMAL(10,2) NOT NULL,
  Notes TEXT,
  FOREIGN KEY (EmployeeId) REFERENCES Employees(Id),
  FOREIGN KEY (AccountNumber) REFERENCES Customers(AccountNumber)
);

CREATE TABLE Occupancies (
  Id INT PRIMARY KEY IDENTITY(1,1),
  EmployeeId INT NOT NULL,
  DateOccupied DATE NOT NULL,
  AccountNumber INT NOT NULL,
  RoomNumber INT NOT NULL,
  RateApplied DECIMAL(10,2) NOT NULL,
  PhoneCharge DECIMAL(10,2) NOT NULL,
  Notes TEXT,
  FOREIGN KEY (EmployeeId) REFERENCES Employees(Id),
  FOREIGN KEY (AccountNumber) REFERENCES Customers(AccountNumber),
  FOREIGN KEY (RoomNumber) REFERENCES Rooms(RoomNumber)
);

INSERT INTO Employees (FirstName, LastName, Title, Notes)
VALUES ('John', 'Doe', 'Manager', 'Experienced Manager'),
       ('Jane', 'Doe', 'Receptionist', 'Customer Service Expert'),
       ('James', 'Smith', 'Housekeeper', 'Punctual and Efficient');

INSERT INTO Customers (AccountNumber, FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber, Notes)
VALUES (10001, 'John', 'Doe', '555-555-5555', 'Jane Doe', '555-555-5556', 'Regular Customer'),
       (10002, 'Jane', 'Smith', '555-555-5557', 'John Smith', '555-555-5558', 'New Customer'),
       (10003, 'James', 'Johnson', '555-555-5559', 'Michael Johnson', '555-555-5560', 'VIP Customer');

INSERT INTO RoomStatus (RoomStatus, Notes)
VALUES ('Vacant', 'Room is available for rental'),
       ('Occupied', 'Room is currently occupied'),
       ('Maintenance', 'Room is under maintenance');

INSERT INTO RoomTypes (RoomType, Notes)
VALUES ('Standard', 'A standard room with basic amenities'),
       ('Deluxe', 'A deluxe room with upgraded amenities'),
       ('Suite', 'A luxurious suite with premium amenities');

INSERT INTO BedTypes (BedType, Notes)
VALUES ('Single', 'A single bed room'),
       ('Double', 'A room with two beds'),
       ('King', 'A room with a king-sized bed');

INSERT INTO Rooms (RoomNumber, RoomType, BedType, Rate, RoomStatus, Notes)
VALUES (101, 'Standard', 'Single', 100, 'Vacant', 'Ready for rental'),
       (102, 'Deluxe', 'Double', 150, 'Vacant', 'Ready for rental'),
       (103, 'Suite', 'King', 200, 'Vacant', 'Ready for rental');

INSERT INTO Payments (EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, TotalDays, AmountCharged, TaxRate, TaxAmount, PaymentTotal, Notes)
VALUES (1, '2023-01-01', 10001, '2023-01-01', '2023-01-05', 5, 500, 0.15, 75, 575, 'Payment for 5 nights in room 101'),
       (1, '2023-01-02', 10002, '2023-01-02', '2023-01-04', 3, 450, 0.15, 67.5, 517.5, 'Payment for 3 nights in room 102'),
       (2, '2023-01-03', 10003, '2023-01-03', '2023-01-03', 1, 200, 0.15, 30, 230, 'Payment for 1 night in room 103');

INSERT INTO Occupancies (EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge, Notes)
VALUES (1, '2023-01-01', 10001, 101, 100, 10, 'Occupied room 101'),
		(1, '2023-01-01', 10002, 102, 101, 10, 'Occupied room 102'),
		(1, '2023-01-01', 10003, 103, 102, 10, 'Occupied room 103');

