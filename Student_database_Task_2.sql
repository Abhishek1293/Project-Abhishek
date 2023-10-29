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
