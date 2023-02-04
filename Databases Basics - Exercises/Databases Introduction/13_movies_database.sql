CREATE TABLE Directors (
    Id INT PRIMARY KEY IDENTITY(1,1),
    DirectorName VARCHAR(100) NOT NULL,
    Notes VARCHAR(255) NULL
);

CREATE TABLE Genres (
    Id INT PRIMARY KEY IDENTITY(1,1),
    GenreName VARCHAR(100) NOT NULL,
    Notes VARCHAR(255) NULL
);

CREATE TABLE Categories (
    Id INT PRIMARY KEY IDENTITY(1,1),
    CategoryName VARCHAR(100) NOT NULL,
    Notes VARCHAR(255) NULL
);

CREATE TABLE Movies (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Title VARCHAR(255) NOT NULL,
    DirectorId INT NOT NULL REFERENCES Directors(Id),
    CopyrightYear INT NOT NULL,
    Length INT NOT NULL,
    GenreId INT NOT NULL REFERENCES Genres(Id),
    CategoryId INT NOT NULL REFERENCES Categories(Id),
    Rating DECIMAL(3,2) NULL,
    Notes VARCHAR(255) NULL
);

INSERT INTO Directors (DirectorName, Notes)
VALUES ('James Cameron', 'Known for Avatar and Titanic'),
       ('Christopher Nolan', 'Known for Inception and The Dark Knight'),
       ('Stanley Kubrick', 'Known for 2001: A Space Odyssey and A Clockwork Orange'),
       ('Quentin Tarantino', 'Known for Pulp Fiction and Kill Bill'),
       ('Martin Scorsese', 'Known for Goodfellas and The Irishman');

INSERT INTO Genres (GenreName, Notes)
VALUES ('Action', NULL),
       ('Comedy', NULL),
       ('Drama', NULL),
       ('Science Fiction', NULL),
       ('Thriller', NULL);

INSERT INTO Categories (CategoryName, Notes)
VALUES ('Blockbuster', NULL),
       ('Indie', NULL),
       ('Classic', NULL),
       ('Controversial', NULL),
       ('Cult', NULL);

INSERT INTO Movies (Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Rating, Notes)
VALUES ('Avatar', 1, 2009, 162, 1, 1, 8.0, 'Highest grossing movie of all time'),
       ('Titanic', 1, 1997, 194, 3, 1, 7.8, 'Second highest grossing movie of all time'),
       ('Inception', 2, 2010, 148, 5, 1, 8.8, NULL),
       ('The Dark Knight', 2, 2008, 152, 1, 1, 9.0, NULL),
       ('2001: A Space Odyssey', 3, 1968, 149, 4, 3, 8.3, 'Classic sci-fi movie');
