CREATE TABLE Users (
    Id BIGINT IDENTITY(1,1) PRIMARY KEY,
    Username VARCHAR(30) NOT NULL UNIQUE,
    Password VARCHAR(26) NOT NULL,
    ProfilePicture VARBINARY(8000) NULL,
    LastLoginTime DATETIME NULL,
    IsDeleted BIT NOT NULL
);

INSERT INTO Users (Username, Password, ProfilePicture, LastLoginTime, IsDeleted)
VALUES
    ('user1', 'password1', NULL, '2023-01-01 00:00:00', 0),
    ('user2', 'password2', NULL, '2023-02-02 00:00:00', 0),
    ('user3', 'password3', NULL, '2023-03-03 00:00:00', 0),
    ('user4', 'password4', NULL, '2023-04-04 00:00:00', 0),
    ('user5', 'password5', NULL, '2023-05-05 00:00:00', 0);
