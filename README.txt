Task 1: 

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

Task 2 : 
CREATE TABLE student_table (
    Student_id INT,
    Stu_name TEXT,
    Department TEXT,
    Email_id TEXT,
    Phone_no NUMERIC,
    Address TEXT,
    Date_of_birth DATE,
    Gender TEXT,
    Major TEXT,
    GPA NUMERIC,
    Grade TEXT
);

INSERT INTO student_table (Student_id, Stu_name, Department, Email_id, Phone_no, Address, Date_of_birth, Gender, Major, GPA, Grade)
VALUES
(1, 'Amit Kumar', 'Computer Science', 'amit@example.com', 9876543210, '123, ABC Street, Mumbai', '1999-05-15', 'Male', 'Computer Science', 3.8, 'A'),
(2, 'Priya Sharma', 'Electrical Engineering', 'priya@example.com', 8765432109, '456, XYZ Road, Delhi', '2000-02-28', 'Female', 'Electrical Engineering', 3.6, 'B'),
(3, 'Rahul Patel', 'Mechanical Engineering', 'rahul@example.com', 7654321098, '789, LMN Avenue, Bangalore', '1998-11-10', 'Male', 'Mechanical Engineering', 3.5, 'B'),
(4, 'Neha Gupta', 'Biology', 'neha@example.com', 6543210987, '234, PQR Lane, Chennai', '2001-08-05', 'Female', 'Biology', 3.9, 'A'),
(5, 'Sandeep Singh', 'Physics', 'sandeep@example.com', 5432109876, '567, RST Road, Kolkata', '1997-04-20', 'Male', 'Physics', 3.7, 'B'),
(6, 'Ananya Reddy', 'Chemistry', 'ananya@example.com', 4321098765, '678, UVW Street, Hyderabad', '2002-03-17', 'Female', 'Chemistry', 3.8, 'A'),
(7, 'Rajesh Verma', 'Mathematics', 'rajesh@example.com', 3210987654, '890, GHI Avenue, Pune', '1999-07-12', 'Male', 'Mathematics', 3.6, 'B'),
(8, 'Divya Choudhury', 'Economics', 'divya@example.com', 2109876543, '345, JKL Lane, Jaipur', '2000-10-30', 'Female', 'Economics', 3.4, 'C'),
(9, 'Rohit Joshi', 'History', 'rohit@example.com', 1098765432, '456, WXY Road, Ahmedabad', '1998-12-03', 'Male', 'History', 3.2, 'C'),
(10, 'Sonia Mishra', 'Psychology', 'sonia@example.com', 9876543211, '123, ABC Street, Lucknow', '2001-01-25', 'Female', 'Psychology', 3.9, 'A');

SELECT * FROM student_table
ORDER BY Grade DESC;

SELECT * FROM student_table
WHERE Gender = 'Male';

SELECT * FROM student_table WHERE GPA < 5.0;

UPDATE student_table
SET Email_id = 'new_email@example.com', Grade = 'A+'
WHERE Student_id = 1;

SELECT Stu_name, Date_of_birth
FROM student_table
WHERE Grade = 'B';

SELECT Department, Gender, AVG(GPA) AS Average_GPA
FROM student_table
GROUP BY Department, Gender;

ALTER TABLE student_table RENAME TO student_info;

SELECT Stu_name
FROM student_info
ORDER BY GPA DESC
LIMIT 1;

Task 3 : 

CREATE TABLE Events (
    Event_Id INT PRIMARY KEY,
    Event_Name VARCHAR(255),
    Event_Date DATE,
    Event_Location VARCHAR(255),
    Event_Description TEXT
);

CREATE TABLE Attendees (
    Attendee_Id INT PRIMARY KEY,
    Attendee_Name VARCHAR(255),
    Attendee_Phone VARCHAR(15),
    Attendee_Email VARCHAR(255),
    Attendee_City VARCHAR(255)
);

CREATE TABLE Registrations (
    Registration_Id INT PRIMARY KEY,
    Event_Id INT,
    Attendee_Id INT,
    Registration_Date DATE,
    Registration_Amount DECIMAL(10, 2),
    FOREIGN KEY (Event_Id) REFERENCES Events(Event_Id),
    FOREIGN KEY (Attendee_Id) REFERENCES Attendees(Attendee_Id)
);

INSERT INTO Events (Event_Id, Event_Name, Event_Date, Event_Location, Event_Description)
VALUES
    (1, 'Music Concert', '2023-11-15', 'Concert Hall', 'An amazing music concert'),
    (2, 'Tech Conference', '2023-12-10', 'Tech Center', 'A conference for tech enthusiasts'),
    (3, 'Art Exhibition', '2023-10-20', 'Art Gallery', 'A showcase of contemporary art'),
    (4, 'Sports Tournament', '2023-11-30', 'Sports Arena', 'Exciting sports competition'),
    (5, 'Food Festival', '2023-12-05', 'City Park', 'A celebration of culinary delights');
	
INSERT INTO Attendees (Attendee_Id, Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City)
VALUES
    (1, 'John Doe', '555-123-4567', 'john.doe@example.com', 'New York'),
    (2, 'Jane Smith', '555-987-6543', 'jane.smith@example.com', 'Los Angeles'),
    (3, 'Robert Johnson', '555-555-5555', 'robert.johnson@example.com', 'Chicago'),
    (4, 'Emily Davis', '555-888-9999', 'emily.davis@example.com', 'Houston'),
    (5, 'Michael Brown', '555-777-3333', 'michael.brown@example.com', 'San Francisco');
	
INSERT INTO Registrations (Registration_Id, Event_Id, Attendee_Id, Registration_Date, Registration_Amount)
VALUES
    (1, 1, 1, '2023-11-01', 50.00),
    (2, 2, 2, '2023-11-05', 100.00),
    (3, 3, 3, '2023-10-15', 25.00),
    (4, 4, 4, '2023-11-20', 75.00),
    (5, 5, 5, '2023-12-01', 30.00);

INSERT INTO Events (Event_Id, Event_Name, Event_Date, Event_Location, Event_Description)
VALUES (6, 'New Year Eve Party', '2023-12-31', 'Downtown Club', 'Ring in the new year with us!');

UPDATE Events SET Event_Location = 'Updated Location'
WHERE Event_Id = 1;

DELETE FROM Events WHERE Event_Id = 6;

INSERT INTO Attendees (Attendee_Id, Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City)
VALUES (6, 'Alice Johnson', '555-333-4444', 'alice.johnson@example.com', 'Miami');

INSERT INTO Registrations (Registration_Id, Event_Id, Attendee_Id, Registration_Date, Registration_Amount)
VALUES (6, 1, 6, '2023-11-10', 60.00);

SELECT * FROM Events;
SELECT A.Attendee_Name, A.Attendee_Phone, A.Attendee_Email, A.Attendee_City
FROM Attendees A

SELECT A.Attendee_Name, A.Attendee_Phone, A.Attendee_Email, A.Attendee_City
FROM Attendees A
JOIN Registrations R ON A.Attendee_Id = R.Attendee_Id
WHERE R.Event_Id = 1;

SELECT E.Event_Name, COUNT(R.Attendee_Id) AS Attendee_Count, SUM(R.Registration_Amount) AS Total_Revenue
FROM Events E
LEFT JOIN Registrations R ON E.Event_Id = R.Event_Id
GROUP BY E.Event_Name;

Task 4 : 



