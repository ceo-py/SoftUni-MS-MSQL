CREATE TABLE Majors (
    MajorID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50) NOT NULL,
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    StudentNumber INT NOT NULL,
    StudentName VARCHAR(50) NOT NULL,
    MajorID INT FOREIGN KEY (MajorID) REFERENCES Majors(MajorID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY IDENTITY(1,1),
    PaymentDate Date NOT NULL,
    PaymentAmount DECIMAL(10,2) NOT NULL,
    StudentID INT FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

CREATE TABLE Subjects (
    SubjectID INT PRIMARY KEY IDENTITY(1,1),
    SubjectName VARCHAR(50) NOT NULL,
);


CREATE TABLE Agenda (
    StudentID INT FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    SubjectID INT FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID),
	PRIMARY KEY (StudentID, SubjectID)
);
