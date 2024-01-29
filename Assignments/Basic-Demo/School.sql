CREATE DATABASE db_School;
USE db_School;

CREATE TABLE Classes
(
	class_id INT NOT NULL IDENTITY (1,1),
	class_name VARCHAR(50) PRIMARY KEY NOT NULL
	
);

CREATE TABLE Instructors
(
	instructor_id INT NOT NULL IDENTITY (1,1),
	instructor_name VARCHAR(50) PRIMARY KEY NOT NULL
);

CREATE TABLE Students
(
	student_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	student_name VARCHAR(50) NOT NULL,
	student_class VARCHAR(50) CONSTRAINT fk_student_class FOREIGN KEY REFERENCES Classes(class_name),
	instructor_name VARCHAR(50) FOREIGN KEY REFERENCES Instructors(instructor_name)
);


ALTER TABLE Students
ADD FOREIGN KEY (student_class) REFERENCES Classes(class_name),
	FOREIGN KEY (student_instructor) REFERENCES Instructors(instructor_name);

INSERT INTO Classes VALUES
('Software Developer Boot Camp'),
('C# Boot Camp')
;

SELECT * FROM Classes;

INSERT INTO Students VALUES
('Ryan Sharpe'),
('Eli Takeya'),
('Solara Lunar'),
('Chappelle Stick'),
('Bill Crabs'),
('Jill Valentine')
;

SELECT * FROM Students;

INSERT INTO Instructors VALUES
('Mrs. Shirego'),
('Mr. Anderson')
;

SELECT * FROM Instructors;

UPDATE Students
SET student_class_id = 'Software Developer Boot Camp', student_Instructor_id = 'Mrs. Shirego'
WHERE student_id BETWEEN 1 AND 3;

UPDATE Students
SET student_class_id = 'C# Boot Camp', student_Instructor_id = 'Mr. Anderson'
WHERE student_id BETWEEN 4 AND 6;

DROP TABLE Instructors;
DROP TABLE Classes;
DROP TABLE Students;

