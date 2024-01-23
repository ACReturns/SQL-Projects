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

CREATE TABLE Publisher
(
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	PublisherAddress VARCHAR(50) NOT NULL,
	PublisherPhone VARCHAR(50) NOT NULL
);

CREATE TABLE Books
(
	BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Publisher(PublisherName)
);

CREATE TABLE Borrower
(
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BorrowerName VARCHAR(50) NOT NULL,
	BorrowerAddress VARCHAR(50) NOT NULL,
	BorrowerPhone VARCHAR(25) NOT NULL
);



CREATE TABLE Book_Copies
(
	BookID INT NOT NULL FOREIGN KEY REFERENCES Books(BookID),
	BranchID INT NOT NULL FOREIGN KEY REFERENCES Library_Branch(BranchID),
	Number_Of_Copies INT NOT NULL
);

CREATE TABLE Book_Loans
(
	BookID INT NOT NULL FOREIGN KEY REFERENCES Books(BookID),
	BranchID INT NOT NULL FOREIGN KEY REFERENCES Library_Branch(BranchID),
	CardNo INT NOT NULL FOREIGN KEY REFERENCES Borrower(CardNo),
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
);

CREATE TABLE Book_Authors
(
	BookID INT NOT NULL FOREIGN KEY REFERENCES Books(BookID),
	AuthorName VARCHAR(50) NOT NULL
);

/*
DROP TABLE Library_Branch;
DROP TABLE Book_Loans;
DROP TABLE Book_Copies;
DROP TABLE Publisher;
DROP TABLE Borrower;
DROP TABLE Books;
DROP TABLE Book_Authors;
*/

