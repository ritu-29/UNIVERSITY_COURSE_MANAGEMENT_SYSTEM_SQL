CREATE DATABASE UNIVERSITY_DB;

USE UNIVERSITY_DB;

-- create tables 
CREATE TABLE Departments(
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(30)
);

CREATE TABLE Students(
StudentID INT PRIMARY KEY,
FirstName VARCHAR(20),
LastName VARCHAR(20),
Email VARCHAR(40),
BirthDate DATE,
EnrollmentDate DATE
);

CREATE TABLE Courses(
CourseID INT PRIMARY KEY,
CourseName VARCHAR(40),
DepartmentID INT,
Credits INT,
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Instructors(
InstructorID INT PRIMARY KEY,
FirstName VARCHAR(20),
LastName VARCHAR(20),
Email VARCHAR(40),
DepartmentID INT,
Salary INT,
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Enrollments(
EnrollmentID INT PRIMARY KEY,
StudentID INT,
CourseID INT,
EnrollmentDate DATE,
FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Insert values  
INSERT INTO Departments VALUES
(1,'Computer Science'),
(2,'Mathematics'),
(3,'Physics'),
(4,'Statistics'),
(5,'IT');

INSERT INTO Students VALUES
(1,'John','Doe','john@gmail.com','2000-01-15','2022-08-01'),
(2,'Jane','Smith','jane@gmail.com','1999-05-25','2021-08-01'),
(3,'Rehan','Gupta','rehan@gmail.com','2000-01-01','2023-04-05'),
(4,'Pooja','Chaudhari','pooja@gmail.com','2000-01-01','2021-06-21'),
(5,'Veena','Parmar','veena@gmail.com','2000-01-01','2023-05-25'),
(6,'Shreya','Patel','shreya@gmail.com','2000-01-01','2020-12-30'),
(7,'Ayushi','Yadav','ayushi@gmail.com','2000-01-01','2022-07-16'),
(8,'Khushi','Parmar','khushi@gmail.com','2000-01-01','2019-04-25'),
(9,'Devyanshi','Joshi','devyanshi@gmail.com','2000-01-01','2020-03-29'),
(10,'Riya','Patel','riya@gmail.com','2000-01-01','2023-01-13');

INSERT INTO Courses VALUES
(101,'Introduction to SQL',1,3),
(102,'Data Structures',2,4),
(103,'DBMS',1,3),
(104,'Operating System',5,4),
(105,'Computer Networks',3,3),
(106,'Statistics Basics',4,3),
(107,'AI Fundamentals',1,4),
(108,'Web Development',5,3),
(109,'Maths',2,3),
(110,'Probability',4,4);

INSERT INTO Instructors VALUES
(1,'Alice','Johnson','alice@univ.com',1,60000),
(2,'Bob','Lee','bob@univ.com',2,55000),
(3,'Raj','Shah','raj@univ.com',3,70000),
(4,'Nina','Patel','nina@univ.com',4,65000),
(5,'Simran','Kaur','simran@univ.com',5,58000),
(6,'Amit','Verma','amit@univ.com',1,72000),
(7,'Priya','Desai','priya@univ.com',2,50000),
(8,'Rohit','Sharma','rohit@univ.com',3,62000),
(9,'Sneha','Joshi','sneha@univ.com',4,75000),
(10,'Karan','Mehta','karan@univ.com',5,80000);

INSERT INTO Enrollments VALUES
(1,1,101,'2022-08-01'),
(2,2,102,'2021-08-01'),
(3,3,103,'2023-04-05'),
(4,4,104,'2021-06-21'),
(5,5,105,'2023-05-25'),
(6,6,106,'2020-12-30'),
(7,7,107,'2022-07-16'),
(8,8,108,'2019-04-25'),
(9,9,109,'2020-03-29'),
(10,10,110,'2023-01-13'),
(11,2,101,'2024-01-01'),
(12,3,101,'2024-01-01'),
(13,4,101,'2024-01-01'),
(14,5,101,'2024-01-01'),
(15,6,101,'2024-01-01'),
(16,7,101,'2024-01-01');

SELECT * FROM Students;

SELECT * FROM Courses;

SELECT * FROM Instructors;

SELECT * FROM Enrollments;

-- 1. Perform CRUD Operations on all tables.
-- 1. CRUD ON Departments
-- CREATE
INSERT INTO Departments VALUES (6,'Commerce');

-- READ
SELECT * FROM Departments;

-- UPDATE
UPDATE Departments
SET DepartmentName='Business'
WHERE DepartmentID=6;

-- DELETE
DELETE FROM Departments
WHERE DepartmentID=6;

-- 2.CRUD ON Students
-- CREATE
INSERT INTO Students VALUES
(11,'Amit','Sharma','amit@gmail.com','2001-05-15','2024-02-10');

-- READ
SELECT * FROM Students;

-- UPDATE
UPDATE Students
SET FirstName='Ritika'
WHERE StudentID=11;

-- DELETE
DELETE FROM Students
WHERE StudentID=11;

-- 3. CRUD ON Courses
-- CREATE
INSERT INTO Courses VALUES (111,'Machine Learning',1,4);

-- READ
SELECT * FROM Courses;

-- UPDATE
UPDATE Courses
SET Credits=5
WHERE CourseID=111;

-- DELETE
DELETE FROM Courses
WHERE CourseID=111;

-- 4. CRUD ON Instructors
-- CREATE
INSERT INTO Instructors VALUES
(11,'Rohit','Verma','rohit@univ.com',1,70000);

-- READ
SELECT * FROM Instructors;

-- UPDATE
UPDATE Instructors
SET Salary=75000
WHERE InstructorID=11;

-- DELETE
DELETE FROM Instructors
WHERE InstructorID=11;

-- 5. CRUD ON Enrollments
-- CREATE
INSERT INTO Enrollments VALUES (11,1,101,'2024-03-01');

-- READ
SELECT * FROM Enrollments;

-- UPDATE
UPDATE Enrollments
SET CourseID=102
WHERE EnrollmentID=11;

-- DELETE
DELETE FROM Enrollments
WHERE EnrollmentID=11;

--  2. Retrieve students enrolled after 2022
SELECT * FROM Students
WHERE EnrollmentDate > '2022-12-31';

-- 3. Retrieve courses offered by the Mathematics department with a limit of 5 courses.
SELECT * FROM Courses
WHERE DepartmentID=2
LIMIT 5;

-- 4. Get the number of students enrolled in each course, filtering for courses with more than 5 students.
SELECT c.CourseId,c.CourseName, COUNT(e.StudentId) AS Total_Student
FROM Courses AS c
INNER JOIN Enrollments AS e
ON c.CourseId = e.CourseId
GROUP BY c.CourseId, c.CourseName
HAVING COUNT(e.StudentId) > 5;

-- 5. Find students who are enrolled in both Introduction to SQL and Data Structures.
SELECT StudentId, FirstName, LastName
FROM Students
WHERE StudentId IN
(SELECT StudentId
    FROM Enrollments
    WHERE CourseId IN (101,102)
    GROUP BY StudentId
    HAVING COUNT(DISTINCT CourseId) = 2);
    
-- 6. Find students who are either enrolled in Introduction to SQL or Data Structures.
SELECT DISTINCT s.StudentId, s.FirstName, s.LastName 
FROM Students AS s
JOIN Enrollments AS e
ON s.StudentId = e.StudentId
WHERE e.CourseId IN (101,102);

-- 7. Calculate the average number of credits for all courses.
SELECT AVG(Credits) AS AverageCredits FROM Courses;

-- 8. Find the maximum salary of instructors in the Computer Science department.
SELECT MAX(i.Salary) AS MAX_SALARY
FROM Instructors i
JOIN Departments d
ON i.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Computer Science';

-- 9. Count the number of students enrolled in each department.
SELECT d.DepartmentName, COUNT(DISTINCT e.StudentID) AS TotalStudents
FROM Departments d
JOIN Courses c ON d.DepartmentID = c.DepartmentID
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY d.DepartmentName;

-- 10. INNER JOIN: Retrieve students and their corresponding courses.
SELECT s.StudentId,s.FirstName,s.LastName,c.CourseName
FROM Students s
INNER JOIN Enrollments e 
ON s.StudentId = e.StudentId
INNER JOIN Courses c
ON e.CourseId = c.CourseId;


-- 11. LEFT JOIN: Retrieve all students and their corresponding courses, if any.
SELECT s.StudentId,s.FirstName,s.LastName,c.CourseName
FROM Students s
LEFT JOIN Enrollments e 
ON s.StudentId = e.StudentId
LEFT JOIN Courses c
ON e.CourseId = c.CourseId;


-- 12. Subquery: Find students enrolled in courses that have more than 5 students
SELECT StudentID, FirstName, LastName
FROM Students
WHERE StudentID IN (
    SELECT e.StudentID
    FROM Enrollments e
    WHERE e.CourseID IN (
        SELECT CourseID
        FROM Enrollments
        GROUP BY CourseID
        HAVING COUNT(StudentID) > 5
        )
);
-- 13. Extract the year from the EnrollmentDate of students.
SELECT StudentId,FirstName,LastName,
YEAR(EnrollmentDate) AS Enroll_year
FROM Students;

-- 14. Concatenate the instructor's first and last name.
SELECT InstructorId, CONCAT(FirstName,' ',LastName) AS Fullname
FROM Instructors;

-- 15. Calculate the running total of students enrolled in courses.
SELECT  EnrollmentID, CourseID, COUNT(StudentID) 
OVER (ORDER BY EnrollmentID) AS RunningTotalStudents
FROM Enrollments;

-- 16. Label students as 'Senior' or 'Junior' based on their year of enrollment.
SELECT StudentID, FirstName, LastName, EnrollmentDate,
CASE
WHEN YEAR(EnrollmentDate) <= 2022 THEN 'Senior'
ELSE 'Junior'
END AS StudentLevel
FROM Students;



