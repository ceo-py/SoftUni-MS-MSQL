CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50)
);


INSERT INTO Students (Name)
VALUES ('Mila'),
       ('Toni'),
       ('Ron');

CREATE TABLE Exams (
    ExamID INT PRIMARY KEY IDENTITY(101,1),
    Name VARCHAR(50)
);

INSERT INTO Exams (Name)
VALUES ('SpringMVC'),
       ('Neo4j'),
       ('Oracle 11g');

CREATE TABLE StudentsExams (
    StudentID INT,
    ExamID INT,
    PRIMARY KEY (StudentID, ExamID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (ExamID) REFERENCES Exams(ExamID)
);

INSERT INTO StudentsExams (StudentID, ExamID)
VALUES (1, 101),
       (1, 102),
       (2, 101),
       (2, 102),
       (3, 103),
       (2, 103);
