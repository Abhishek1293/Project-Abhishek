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

INSERT INTO Coursesinfo (COURSE_ID, COURSE_NAME, COURSE_INSTRUCTOR_NAME)
VALUES
(101, 'Mathematics', 'Dr. Neha Verma'),
(102, 'Physics', 'Prof. Sanjay Patel'),
(103, 'History', 'Dr. Anjali Reddy');

SELECT s.STU_NAME, s.PHONE_NO, s.EMAIL_ID, e.ENROLL_STATUS
FROM Studentinfo s
JOIN Enrollmentinfo e ON s.STU_ID = e.STU_ID;

SELECT c.COURSE_NAME
FROM Coursesinfo c
JOIN Enrollmentinfo e ON c.COURSE_ID = e.COURSE_ID
WHERE e.STU_ID = 1;

SELECT * 
FROM Coursesinfo;

SELECT c.COURSE_NAME, c.COURSE_INSTRUCTOR_NAME
FROM Coursesinfo c
WHERE c.COURSE_ID = 101;

SELECT c.COURSE_NAME, c.COURSE_INSTRUCTOR_NAME
FROM Coursesinfo c
WHERE c.COURSE_ID IN (101, 102);

SELECT c.COURSE_NAME, COUNT(e.STU_ID) AS Enrolled_Students_Count
FROM Coursesinfo c
LEFT JOIN Enrollmentinfo e ON c.COURSE_ID = e.COURSE_ID
GROUP BY c.COURSE_NAME;

SELECT s.STU_NAME
FROM Studentinfo s
JOIN Enrollmentinfo e ON s.STU_ID = e.STU_ID
WHERE e.COURSE_ID = 101;

SELECT c.COURSE_INSTRUCTOR_NAME, COUNT(e.STU_ID) AS Enrolled_Students_Count
FROM Coursesinfo c
LEFT JOIN Enrollmentinfo e ON c.COURSE_ID = e.COURSE_ID
GROUP BY c.COURSE_INSTRUCTOR_NAME;

SELECT s.STU_NAME, COUNT(e.STU_ID) AS Enrollments
FROM Studentinfo s
JOIN Enrollmentinfo e ON s.STU_ID = e.STU_ID
GROUP BY s.STU_NAME
HAVING COUNT(e.STU_ID) > 1;

SELECT c.COURSE_NAME, COUNT(e.STU_ID) AS Enrolled_Students_Count
FROM Coursesinfo c
LEFT JOIN Enrollmentinfo e ON c.COURSE_ID = e.COURSE_ID
GROUP BY c.COURSE_NAME
ORDER BY Enrolled_Students_Count DESC;
