-- Create the Events table
CREATE TABLE Events (
    Event_Id INT PRIMARY KEY,
    Event_Name VARCHAR(255),
    Event_Date DATE,
    Event_Location VARCHAR(255),
    Event_Description TEXT
);

-- Create the Attendees table
CREATE TABLE Attendees (
    Attendee_Id INT PRIMARY KEY,
    Attendee_Name VARCHAR(255),
    Attendee_Phone VARCHAR(15),
    Attendee_Email VARCHAR(255),
    Attendee_City VARCHAR(255)
);

-- Create the Registrations table with foreign key constraints
CREATE TABLE Registrations (
    Registration_Id INT PRIMARY KEY,
    Event_Id INT,
    Attendee_Id INT,
    Registration_Date DATE,
    Registration_Amount DECIMAL(10, 2),
    FOREIGN KEY (Event_Id) REFERENCES Events(Event_Id),
    FOREIGN KEY (Attendee_Id) REFERENCES Attendees(Attendee_Id)
);
-- Insert sample data into the Events table
INSERT INTO Events (Event_Id, Event_Name, Event_Date, Event_Location, Event_Description)
VALUES
    (4, 'Conference A', '2023-11-15', 'City Center Convention Center', 'Annual tech conference'),
    (5, 'Seminar B', '2023-12-10', 'Downtown Hotel', 'Marketing strategies seminar');
	
INSERT INTO Attendees (Attendee_Id, Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City)
VALUES
    (1, 'John Doe', '123-456-7890', 'john@example.com', 'New York'),
    (2, 'Jane Smith', '987-654-3210', 'jane@example.com', 'Los Angeles');
INSERT INTO Registrations (Registration_Id, Event_Id, Attendee_Id, Registration_Date, Registration_Amount)
VALUES
    (1, 1, 1, '2023-11-05', 150.00),
    (2, 1, 2, '2023-11-06', 150.00),
    (3, 2, 1, '2023-12-01', 100.00);
INSERT INTO Events (Event_Id, Event_Name, Event_Date, Event_Location, Event_Description)
VALUES (3, 'Workshop C', '2023-12-20', 'Community Center', 'Hands-on coding workshop');
UPDATE Events
SET Event_Description = 'Updated event description'
WHERE Event_Id = 1;
DELETE FROM Registrations WHERE Event_Id = 2;
DELETE FROM Events WHERE Event_Id = 2;
INSERT INTO Attendees (Attendee_Id, Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City)
VALUES (3, 'Bob Johnson', '555-555-5555', 'bob@example.com', 'Chicago');
INSERT INTO Registrations (Event_Id, Attendee_Id, Registration_Date, Registration_Amount)
VALUES (1, 3, '2023-11-07', 150.00);
SELECT * FROM Events;
SELECT A.Attendee_Name, A.Attendee_Phone, A.Attendee_Email, A.Attendee_City
FROM Attendees A
JOIN Registrations R ON A.Attendee_Id = R.Attendee_Id
WHERE R.Event_Id = 1;
SELECT E.Event_Name, COUNT(R.Attendee_Id) AS Attendee_Count, SUM(R.Registration_Amount) AS Total_Revenue
FROM Events E
LEFT JOIN Registrations R ON E.Event_Id = R.Event_Id
GROUP BY E.Event_Name;


