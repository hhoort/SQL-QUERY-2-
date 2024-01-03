create database class14;

-- Students Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    GPA DECIMAL(3, 2)
);

INSERT INTO Students (StudentID, FirstName, LastName, Age, GPA)
VALUES
    (1, 'Alice', 'Johnson', 20, 3.75),
    (2, 'Bob', 'Smith', 22, 3.50),
    (3, 'Charlie', 'Davis', 21, 3.80),
    (4, 'Diana', 'Brown', 23, 3.90),
    (5, 'Eva', 'Miller', 20, 3.65),
    (6, 'Frank', 'Jones', 22, 3.70),
    (7, 'Grace', 'Wilson', 21, 3.85),
    (8, 'Henry', 'Anderson', 23, 3.95),
    (9, 'Ivy', 'Taylor', 20, 3.60),
    (10, 'Jack', 'Clark', 22, 3.75);

-- Courses Table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50)
);

-- Inserting 10 sample records into Courses table
INSERT INTO Courses (CourseID, CourseName)
VALUES
    (1, 'Introduction to Programming'),
    (2, 'Web Development Basics'),
    (3, 'Database Management'),
    (4, 'Data Structures and Algorithms'),
    (5, 'JavaScript Fundamentals'),
    (6, 'Mobile App Development'),
    (7, 'Software Engineering Principles'),
    (8, 'Networking Essentials'),
    (9, 'Artificial Intelligence Basics'),
    (10, 'Cybersecurity Fundamentals');

	--Retrieve a list of all students and the courses they are enrolled in, including those who are not enrolled in any course.
SELECT s.StudentID, s.FirstName, s.LastName,e.CourseName
FROM Students s
INNER JOIN Courses e ON s.StudentID = e.CourseID
INNER JOIN Courses c ON e.CourseID = c.CourseID ;

--Display the details of students who are enrolled in the course 'Web Development Basics'.
SELECT s.StudentID, s.FirstName, s.LastName
FROM Students s
INNER JOIN Courses e ON s.StudentID = e.CourseID
INNER JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName = 'Web Development Basics';
--Find out which courses have no enrolled students.
SELECT c.CourseID, c.CourseName
FROM Courses c
LEFT JOIN students e ON e.StudentID = c.CourseID
WHERE c.CourseID IS NULL;

--List the students who are enrolled in any course, along with the course names.
SELECT s.StudentID, e.FirstName, c.CourseName
FROM Students s
JOIN Students e ON s.StudentID = e.StudentID
JOIN Courses c ON e.StudentID = c.CourseID;
--Retrieve a list of all courses along with the number of students enrolled in each course, even if the count is zero.
SELECT c.CourseID, c.CourseName, COUNT(e.StudentID) AS NumberOfStudents
FROM Courses c
LEFT JOIN Students e ON c.CourseID = e.StudentID
GROUP BY c.CourseID, c.CourseName
ORDER BY c.CourseID;
