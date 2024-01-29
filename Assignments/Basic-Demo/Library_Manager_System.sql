CREATE TABLE Library_Branch
(
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(50) NOT NULL,
	BranchAddress VARCHAR(50) NOT NULL
);

INSERT INTO Library_Branch VALUES
('First Contact', '73 Morningstar Road'),
('2:12', '212 Jewett Avenue'),
('Champion Books', '169 Stallone Street'),
('Almond Way', '5348 Orange Avenue'),
('Apex', '1 Spectrum Point'),
('SharpsTown', '224 Running Lane')
;

SELECT * FROM Library_Branch;

SELECT COUNT(BranchName) FROM Library_Branch;

CREATE TABLE Publisher
(
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	PublisherAddress VARCHAR(50) NOT NULL,
	PublisherPhone VARCHAR(50) NOT NULL
);

INSERT INTO Publisher VALUES
('Banishing Flat', '623 Green Road', '(718) 632-1'),
('Button Check', '58 Express Way', '(514) 677-9567'),
('Dino-Butter', '18 Soar Lane', '(818) 559-8008'),
('Essentials', '200 Sprint Street', '(918) 342-7777'),
('Four', '1 Deep Pointe', '(777) 374-5654'),
('Nice Town', '21 Sheets Lane', '(645) 656-3277'),
('Bake Books', '8 Oven Road', '(887) 965-3657'),
('Yolky Pages', '9 Shell Way', '(833) 866-5335'),
('Timeless', '808 Sunset Blvd', '(656) 434-3543'),
('Dot Books', '7 Ruby Road', '(757) 533-2565')
;

SELECT * FROM Publisher;

CREATE TABLE Books
(
	BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Publisher(PublisherName)
);

INSERT INTO Books VALUES
('The Lost Tribe', 'Timeless'), ('Clockwork Orange', 'Dot Books'),
('Wild Things', 'Banishing Flat'), ('Tenderizer', 'Button Check'),
('100 Eyes', 'Dino-Butter'), ('My Hamster', 'Yolky Pages'),
('Cuckoo;s Nest', 'Four'), ('TIme in the Kitchen', 'Bake Books'),
('Time of Cholera', 'Nice Town'), ('Everyone Poops', 'Essentials'),
('As I lay Dying', 'Four'), ('Fight Club', 'Banishing Flat'),
('Hard-Boiled', 'Bake Books'), ('Wrinkle in Time', 'Timeless'),
('Trainspotting', 'Nice Town'), ('American Psycho', 'Dino-Butter'),
('Fear & Loathing', 'Essentials'), ('Brave New World', 'Button Check'),
('Invisible Monsters', 'Yolky Pages'), ('Lunar Park', 'Dot Books')
;

SELECT * FROM Books;

CREATE TABLE Borrower
(
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BorrowerName VARCHAR(50) NOT NULL,
	BorrowerAddress VARCHAR(50) NOT NULL,
	BorrowerPhone VARCHAR(25) NOT NULL
);

INSERT INTO Borrower VALUES
('Roger Grey', '5 Tomoato Lane', '(917) 534-9989'),
('Lean Spot', '101 Vibing Road', '(719) 438-9421'),
('Sol Badguy', '6 Gunflame Alley', '(212) 337-7070'),
('Laila Cerda', '77 Healing Way', '(989) 776-9321'),
('Viviana Smith', '4225 Pecan Street', '(743) 777-2543'),
('Domon Kasshu', '13 King of Hearts Blvd', '(343) 438-1313'),
('Leonardo DaVinci', '8 Artists Alley', '(576) 897-3456'),
('Bruce Wayne', '1 Wayne Manor', '(643) 978-9432')
;

SELECT * FROM Library_Branch;
SELECT * FROM Books;
SELECT * FROM Borrower;

CREATE TABLE Book_Copies
(
	BookID INT NOT NULL FOREIGN KEY REFERENCES Books(BookID),
	BranchID INT NOT NULL FOREIGN KEY REFERENCES Library_Branch(BranchID),
	Number_Of_Copies INT NOT NULL
);

INSERT INTO Book_Copies VALUES
(1, 1, 4),
(2, 1, 9),
(5, 6, 20),
(10, 3, 6),
(16, 4, 3),
(19, 2, 11),
(12, 5, 13),
(14, 2, 3),
(9, 1, 8),
(3, 4, 4),
(16, 5, 10),
(6, 1, 5),
(1, 6, 7)
;

SELECT * FROM Book_Copies;

CREATE TABLE Book_Loans
(
	BookID INT NOT NULL FOREIGN KEY REFERENCES Books(BookID),
	BranchID INT NOT NULL FOREIGN KEY REFERENCES Library_Branch(BranchID),
	CardNo INT NOT NULL FOREIGN KEY REFERENCES Borrower(CardNo),
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
);

INSERT INTO Book_Loans VALUES
(1, 1, 4, '2023-01-10', '2023-02-01'),
(6, 1, 4, '2023-12-11', '2023-01-03'),
(10, 3, 2, '2023-02-14', '2023-03-01'),
(5, 6, 6, '2023-03-15', '2023-05-23'),
(19, 2, 3, '2023-06-17', '2023-07-02'),
(14, 2, 5, '2023-07-21', '2023-08-20'),
(10, 3, 7, '2023-11-29', '2024-01-05'),
(16, 5, 1, '2023-04-20', '2023-05-15'),
(9, 1, 8, '2023-10-29', '2023-12-01'),
(14, 2, 4, '2024-02-29', '2024-05-02')
;

SELECT * FROM Book_Loans;

CREATE TABLE Book_Authors
(
	BookID INT NOT NULL FOREIGN KEY REFERENCES Books(BookID),
	AuthorName VARCHAR(50) NOT NULL
);

INSERT INTO Book_Authors VALUES
(1, 'Sarah J Maas'),
(2, 'Stephen King'),
(6, 'Tron'),
(10, 'Archie Williams'),
(14, 'Sarah J Maas'),
(16, 'Ryan Dos'),
(19, 'Solara Smith'),
(5, 'Jenae Smith'),
(3, 'Stephen King'),
(9, 'Greg Castle')
;

SELECT * FROM Book_Authors;

SELECT * FROM ((Book_Loans FULL OUTER JOIN Borrower ON Book_Loans.CardNo =
Borrower.CardNo) FULL OUTER JOIN Books ON Book_Loans.BookID = Books.BookID)
 