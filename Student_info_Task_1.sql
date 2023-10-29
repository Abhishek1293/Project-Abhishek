--Creating Table

CREATE TABLE Studentinfo (
    STU_ID INT PRIMARY KEY,
    STU_NAME VARCHAR(255),
    DOB DATE,
    PHONE_NO VARCHAR(15),
    EMAIL_ID VARCHAR(255),
    ADDRESS VARCHAR(255)
);
CREATE TABLE Coursesinfo (
    COURSE_ID INT PRIMARY KEY,
    COURSE_NAME VARCHAR(255),
    COURSE_INSTRUCTOR_NAME VARCHAR(255)
);
CREATE TABLE Enrollmentinfo (
    ENROLLMENT_ID INT PRIMARY KEY,
    STU_ID INT,
    COURSE_ID INT,
    ENROLL_STATUS VARCHAR(20),
    FOREIGN KEY (STU_ID) REFERENCES Studentinfo(STU_ID),
    FOREIGN KEY (COURSE_ID) REFERENCES Coursesinfo(COURSE_ID)
);

--Inserting Values

INSERT INTO Studentinfo (STU_ID, STU_NAME, DOB, PHONE_NO, EMAIL_ID, ADDRESS)
VALUES
(1, 'Rajesh Kumar', '1995-08-15', '9876543210', 'rajesh.kumar@email.com', '123, Main Street, City'),
(2, 'Priya Sharma', '1998-04-22', '8765432109', 'priya.sharma@email.com', '456, Park Road, Town'),
(3, 'Amit Singh', '1996-11-03', '7654321098', 'amit.singh@email.com', '789, Lake Avenue, Village');
INSERT INTO Coursesinfo (COURSE_ID, COURSE_NAME, COURSE_INSTRUCTOR_NAME)
VALUES
(101, 'Mathematics', 'Dr. Neha Verma'),
(102, 'Physics', 'Prof. Sanjay Patel'),
(103, 'History', 'Dr. Anjali Reddy');
INSERT INTO Enrollmentinfo (ENROLLMENT_ID, STU_ID, COURSE_ID, ENROLL_STATUS)
VALUES
(1, 1, 101, 'Enrolled'),
(2, 1, 102, 'Enrolled'),
(3, 2, 101, 'Enrolled'),
(4, 3, 103, 'Enrolled'),
(5, 3, 102, 'Not Enrolled');

--Retrieve the Student Information
--(a) Write a query to retrieve student details, such as student name, contact informations, and Enrollment status.
SELECT s.STU_NAME, s.PHONE_NO, s.EMAIL_ID, e.ENROLL_STATUS
FROM Studentinfo s
JOIN Enrollmentinfo e ON s.STU_ID = e.STU_ID;

-- (b) Write a query to retrieve a list of courses in which a specific student is enrolled.
SELECT c.COURSE_NAME
FROM Coursesinfo c
JOIN Enrollmentinfo e ON c.COURSE_ID = e.COURSE_ID
WHERE e.STU_ID = 1;

-- (c) Retrieve course information, including course name and instructor information:
SELECT * 
FROM Coursesinfo;

--(d) Retrieve course information for a specific course. 
SELECT c.COURSE_NAME, c.COURSE_INSTRUCTOR_NAME
FROM Coursesinfo c
WHERE c.COURSE_ID = 101;

-- (e) Retrieve course information for multiple courses.
SELECT c.COURSE_NAME, c.COURSE_INSTRUCTOR_NAME
FROM Coursesinfo c
WHERE c.COURSE_ID IN (101, 102);

--Reporting and Analytics (Using joining queries)
--a) Write a query to retrieve the number of students enrolled in each course 
SELECT c.COURSE_NAME, COUNT(e.STU_ID) AS Enrolled_Students_Count
FROM Coursesinfo c
LEFT JOIN Enrollmentinfo e ON c.COURSE_ID = e.COURSE_ID
GROUP BY c.COURSE_NAME;

--(b)  Retrieve the list of students enrolled in a specific course. 
SELECT s.STU_NAME
FROM Studentinfo s
JOIN Enrollmentinfo e ON s.STU_ID = e.STU_ID
WHERE e.COURSE_ID = 101;

--(c) Retrieve the count of enrolled students for each instructor:
SELECT c.COURSE_INSTRUCTOR_NAME, COUNT(e.STU_ID) AS Enrolled_Students_Count
FROM Coursesinfo c
LEFT JOIN Enrollmentinfo e ON c.COURSE_ID = e.COURSE_ID
GROUP BY c.COURSE_INSTRUCTOR_NAME;

--(d) Retrieve the list of students who are enrolled in multiple courses:
SELECT s.STU_NAME, COUNT(e.STU_ID) AS Enrollments
FROM Studentinfo s
JOIN Enrollmentinfo e ON s.STU_ID = e.STU_ID
GROUP BY s.STU_NAME
HAVING COUNT(e.STU_ID) > 1;

--e) Retrieve the courses with the highest number of enrolled students, arranged from highest to lowest:
SELECT c.COURSE_NAME, COUNT(e.STU_ID) AS Enrolled_Students_Count
FROM Coursesinfo c
LEFT JOIN Enrollmentinfo e ON c.COURSE_ID = e.COURSE_ID
GROUP BY c.COURSE_NAME
ORDER BY Enrolled_Students_Count DESC;