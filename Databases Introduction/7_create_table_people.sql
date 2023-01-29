CREATE TABLE People (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(200) NOT NULL,
    Picture VARBINARY(MAX) NULL,
    Height FLOAT(53) NULL,
    Weight FLOAT(53) NULL,
    Gender CHAR(1) NOT NULL,
    Birthdate DATE NOT NULL,
    Biography NVARCHAR(MAX) NULL
);

INSERT INTO People (Name, Picture, Height, Weight, Gender, Birthdate, Biography)
VALUES
    ('John Doe', NULL, 1.80, 80.0, 'm', '1980-01-01', 'John is a great person.'),
    ('Jane Doe', NULL, 1.70, 60.0, 'f', '1985-02-02', 'Jane is a smart person.'),
    ('Bob Smith', NULL, 1.75, 70.0, 'm', '1990-03-03', 'Bob is a funny person.'),
    ('Alice Brown', NULL, 1.65, 55.0, 'f', '1995-04-04', 'Alice is a creative person.'),
    ('Charlie White', NULL, 1.78, 68.0, 'm', '2000-05-05', 'Charlie is a kind person.');
