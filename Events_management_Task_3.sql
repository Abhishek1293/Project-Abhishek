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
