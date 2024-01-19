/*
CREATE PROC dbo.uspGetAddress3 @City NVARCHAR(30), @PostalCode NVARCHAR(10)
AS
SELECT * FROM Person.Address
WHERE City LIKE @City + '%' AND PostalCode LIKE @PostalCode
GO
EXEC dbo.uspGetAddress3 @City = 'New', @PostalCode = '[98]%'
*/

CREATE PROC dbo.uspGetAddress4 @CityName NVARCHAR(30)OUTPUT
AS
Select City FROM Person.Address
WHERE AddressID = 38 AND PostalCode = 48226
GO
DECLARE @CityName NVARCHAR(30)
EXEC dbo.uspGetAddress4 @CityName = @CityName OUTPUT
Print @CityName

SELECT DISTINCT City FROM Person.Address

SELECT TOP 5 * FROM Person.Address

SELECT MIN(CreditRating) FROM Purchasing.Vendor

SELECT MAX(CreditRating) FROM Purchasing.Vendor

SELECT * FROM Person.Person
WHERE FirstName LIKE 'f%' 

SELECT * FROM Person.Person
WHERE FirstName LIKE '[drs]%' 

SELECT * FROM Purchasing.Vendor 
WHERE CreditRating BETWEEN 3 AND 10