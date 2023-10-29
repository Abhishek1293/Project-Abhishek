-- Create the student_info table
CREATE TABLE student_info (
    Student_id INT PRIMARY KEY,
    Stu_name TEXT,
    Department TEXT,
    email_id TEXT,
    Phone_no NUMERIC,
    Address TEXT,
    Date_of_birth DATE,
    Gender TEXT,
    Major TEXT,
    GPA NUMERIC,
    Grade TEXT
);
-- Insert 10 sample records into the student_info table
INSERT INTO student_info (Student_id, Stu_name, Department, email_id, Phone_no, Address, Date_of_birth, Gender, Major, GPA, Grade)
VALUES
    (1, 'John Doe', 'Computer Science', 'john@example.com', 1234567890, '123 Main St', '1995-05-15', 'Male', 'Computer Science', 3.5, 'B'),
    (2, 'Jane Smith', 'Mathematics', 'jane@example.com', 9876543210, '456 Elm St', '1996-03-22', 'Female', 'Mathematics', 4.0, 'A'),
    -- Add 8 more sample records here
    (10, 'Tom Johnson', 'Physics', 'tom@example.com', 5555555555, '789 Oak St', '1994-11-10', 'Male', 'Physics', 4.5, 'A');
-- Retrieve all students' information and sort by grade in descending order
SELECT * FROM student_info
ORDER BY Grade DESC;
-- Retrieve information about all male students
SELECT * FROM student_info
WHERE Gender = 'Male';
-- Fetch details of students with GPA less than 5.0
SELECT * FROM student_info
WHERE GPA < 5.0;
-- Update the email and grade for a specific student
UPDATE student_info
SET email_id = 'new_email@example.com', Grade = 'A'
WHERE Student_id = 1;
-- Retrieve names and ages of students with a grade of "B"
SELECT Stu_name, Date_of_birth
FROM student_info
WHERE Grade = 'B';
-- Group by Department and Gender, calculate average GPA
SELECT Department, Gender, AVG(GPA) AS Avg_GPA
FROM student_info
GROUP BY Department, Gender;
-- Rename the table
ALTER TABLE student_info RENAME TO student_table;
-- Retrieve the name of the student with the highest GPA
SELECT Stu_name
FROM student_table
ORDER BY GPA DESC
LIMIT 1;
