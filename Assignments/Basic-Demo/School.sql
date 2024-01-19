CREATE DATABASE db_School;

CREATE TABLE Classes
(
	class_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	class_name VARCHAR(50) NOT NULL
);

CREATE TABLE Students
(
	student_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	student_name VARCHAR(50) NOT NULL,
	class_id INT,
	instructor_id INT
);

CREATE TABLE Instructors
(
	instructor_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	instructor_name VARCHAR(50) NOT NULL
);

SELECT * FROM Students;

ALTER TABLE Students
ADD FOREIGN KEY (class_id) REFERENCES Classes(class_id);

ALTER TABLE Students
ADD FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id);

INSERT INTO Classes VALUES
('Software Developer Boot Camp'),
('C# Boot Camp');

INSERT INTO Students VALUES
('Ryan Sharpe'),
('Eli Takeya'),
('Solara Lunar'),
('Chappelle Stick'),
('Bill Crabs'),
('Jill Valentine');

INSERT INTO Instructors VALUES
('Mrs. Shirego'),
('Mr. Anderson');