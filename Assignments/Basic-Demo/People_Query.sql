CREATE TABLE tbl_persons
(
	persons_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	persons_fname VARCHAR(50) NOT NULL,
	persons_lname VARCHAR(50) NOT NULL,
	persons_contact VARCHAR(50) NOT NULL
);

INSERT INTO tbl_persons
	(persons_fname, persons_lname, persons_contact)
	VALUES
	('bob', 'smith', '232-345-5678'),
	('mary', 'ann', '232-345-5678'),
	('tex', 'burns', '232-345-5678'),
	('gerry', 'kerns', '232-345-5678'),
	('sally', 'fields', '232-345-5678')
;

SELECT * FROM tbl_persons;

UPDATE tbl_persons SET persons_fname = 'mars' WHERE persons_fname = 'bob';

SELECT persons_fname, persons_lname, persons_contact FROM tbl_persons WHERE persons_id BETWEEN 2 AND 5;
SELECT persons_fname, persons_lname, persons_contact FROM tbl_persons WHERE persons_lname LIKE 'ke%';

SELECT persons_fname AS 'First Name', persons_lname AS 'Last Name', persons_contact AS 'Phone' FROM tbl_persons WHERE persons_fname LIKE 'm%' ORDER BY persons_lname;

DELETE FROM tbl_persons WHERE persons_lname = 'smith'; -- How to delete your data

DROP TABLE tbl_persons;