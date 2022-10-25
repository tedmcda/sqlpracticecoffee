USE master;
GO

CREATE DATABASE CoffeeAisles; --created database--

USE CoffeeAisles;

/*created database and ran, switching over from master to CoffeeAisles,
first table below was created as the coffebrands i am using for this*/

CREATE TABLE CoffeeBrands (
	ID				SMALLINT		NOT NULL	IDENTITY PRIMARY KEY,
	CoffeeBrandName	VARCHAR(20)		NOT NULL
	);

INSERT INTO CoffeeBrands (CoffeeBrandName)
	VALUES	('Folgers'),
			('DunkinDonuts'),
			('Starbucks'),
			('MaxwellHouse'),
			('DonutShop'),
			('Nestle'),
			('McCafe'),
			('TimHortons'),
			('KrogerSelect')
;

SELECT * FROM CoffeeBrands; --checked work--

/*Added 9 coffee brands for this table, using one that is only going to be used for Kroger since it is a Kroger brand
Using movie actors and directors from the Kevin SMith World for the sales associates, hope you get the references,
distributors are real world coffee distributors from around the world*/

CREATE TABLE SalesPerson (
	ID				SMALLINT		NOT NULL IDENTITY PRIMARY KEY,
	FirstName		VARCHAR(20)		NOT NULL,
	LastName		VARCHAR(20)		NOT NULL,
	Distributor		VARCHAR(20)		NOT NULL
	);

INSERT INTO SalesPerson (FirstName, LastName, Distributor)
VALUES		('Kevin','Smith','Westrock Coffee'),
			('Jason','Lee','Mother Parks'),
			('Casey','Affleck','Red Diamond'),
			('Ben','Affleck','Community Coffee'),
			('Alyssa','Jones','Whites Boots'),
			('Jason','Mewes','Death Wish Coffee'),
			('Matt','Damon','Mother Parks'),
			('Linda','Fiorentino','Red Diamond'),
			('George','Carlin','Whites Boots')
;

SELECT * FROM SalesPerson; --checked work--

CREATE TABLE Costs (
	ID				SMALLINT		NOT NULL REFERENCES CoffeeBrands(ID),
	Ounces			INT				NOT NULL,
	Cost			MONEY			NOT NULL,
	CostPerOunce	MONEY			NOT NULL,
	CoffeeBrandName	VARCHAR(20)		NOT NULL);

SELECT * FROM Costs; --checked work--

INSERT INTO Costs (ID, Ounces, Cost, CostPerOunce,CoffeeBrandName)
	VALUES		(1,16,14.99,1.07,'Folgers'),
				(2,24,17.99,0.75,'DunkinDonuts'),
				(3,12,9.99,0.83,'Starbucks'),
				(4,64,18.99,0.30,'MaxwellHouse'),
				(5,16,12.99,0.81,'DonutShop'),
				(6,8,8.99,1.12,'Nestle'),
				(7,16,15.99,1.00,'McCafe'),
				(8,24,22.99,0.96,'TimHortons'),
				(9,10,11.99,1.20,'KrogerSelect');

SELECT * FROM Costs; --checked work--

CREATE TABLE CoffeeRatings (
	ID					SMALLINT	NOT NULL REFERENCES CoffeeBrands(ID),
	Score				INT			NOT NULL,
	OutOf				INT			NOT NULL,
	NumberofSurveys		INT			NOT NULL
	);

	/*number of surveys add up and total same amount as the scores per store listed below in another table,
	i didn't know how to do the math to show that they added up, something i def want to learn*/

INSERT INTO CoffeeRatings (ID, Score, OutOf, NumberofSurveys)
	VALUES	(1, 8, 10, 15),
			(2, 8, 10, 12),
			(3, 7, 10, 22),
			(4, 4, 10, 9),
			(5, 7, 10, 24),
			(6, 9, 10, 13),
			(7, 10, 10, 10),
			(8, 10, 10, 4),
			(9, 9, 10, 5);

SELECT * FROM CoffeeRatings; --checked work--

CREATE TABLE Stores (
ID				SMALLINT		NOT NULL IDENTITY PRIMARY KEY,
StoreName		VARCHAR(20)		NOT NULL,
NumberofSurveys	INT				NOT NULL
);

SELECT * FROM Stores; --checked work--

INSERT INTO Stores (Storename, NumberofSurveys)
	VALUES	('Meijer',26),
			('Kroger',21),
			('Aldi',7),
			('Walmart',27),
			('Amazon',33)
;

ALTER TABLE Stores
	ADD Cities	VARCHAR(20);--added column to Stores Table--

SELECT * FROM Stores; --checked work--

Alter TABLE Stores
DROP COLUMN Cities;--dropped cities column from table as I realized this is over the entire store area and not one central location--

SELECT * FROM CoffeeBrands;
SELECT * FROM Costs;
SELECT * FROM SalesPerson;
SELECT * FROM CoffeeRatings;
SELECT * FROM Stores;   --checking tables and work of all--

CREATE TABLE StoreReps (

ID			SMALLINT	NOT NULL REFERENCES SalesPerson(ID),
FirstName	VARCHAR(20)	NOT NULL,
LastName	VARCHAR(20) NOT NULL,
StoreName	VARCHAR(20)	NOT NULL

);

INSERT INTO StoreReps (ID,FirstName, LastName, StoreName)
VALUES		(1,'Kevin','Smith','Meijer'),
			(1,'Kevin','Smith','Kroger'),
			(1,'Kevin','Smith','Aldi'),
			(2,'Jason','Lee','Meijer'),
			(2,'Jason','Lee','Aldi'),
			(2,'Jason','Lee','Walmart'),
			(2,'Jason','Lee','Amazon'),
			(3,'Casey','Affleck','Meijer'),
			(3,'Casey','Affleck','Kroger'),
			(3,'Casey','Affleck','Aldi'),
			(3,'Casey','Affleck','Walmart'),
			(3,'Casey','Affleck','Amazon'),
			(4,'Ben','Affleck','Kroger'),
			(4,'Ben','Affleck','Amazon'),
			(5,'Alyssa','Jones','Meijer'),
			(6,'Jason','Mewes','Kroger'),
			(6,'Jason','Mewes','Aldi'),
			(6,'Jason','Mewes','Amazon'),
			(7,'Matt','Damon','Walmart'),
			(7,'Matt','Damon','Amazon'),
			(8,'Linda','Fiorentino','Meijer'),
			(8,'Linda','Fiorentino','Kroger'),
			(8,'Linda','Fiorentino','Aldi'),
			(8,'Linda','Fiorentino','Amazon'),
			(8,'Linda','Fiorentino','Walmart'),
			(9,'George','Carlin','Amazon')
;

SELECT * FROM CoffeeBrands;
SELECT * FROM Costs;
SELECT * FROM SalesPerson;
SELECT * FROM CoffeeRatings;
SELECT * FROM Stores;
SELECT * FROM StoreReps;

CREATE TABLE StoreBrands (

ID				SMALLINT	NOT NULL REFERENCES Stores (ID),
StoreName		VARCHAR(20)	NOT NULL,
CoffeeBrandName	VARCHAR(20) NOT NULL				

);

SELECT * FROM StoreBrands;--checked work--

INSERT INTO StoreBrands (ID, StoreName, CoffeeBrandName)
	VALUES	(1,'Meijer', 'Folgers'),
			(1,'Meijer', 'DunkinDonuts'),
			(1,'Meijer', 'Starbucks'),
			(1,'Meijer','MaxwellHouse'),
			(1,'Meijer','DonutShop'),
			(1,'Meijer','Nestle'),
			(1,'Meijer','McCafe'),
			(2,'Aldi','Folgers'),
			(2,'Aldi','MaxwellHouse'),
			(2,'Aldi','TimHortons'),
			(3,'Kroger','Folgers'),
			(3,'Kroger','DunkinDonuts'),
			(3,'Kroger','Starbucks'),
			(3,'Kroger','MaxwellHouse'),
			(3,'Kroger','DonutShop'),
			(3,'Kroger','Nestle'),
			(3,'Kroger','McCafe'),
			(3,'Kroger','TimHortons'),
			(3,'Kroger','KrogerSelect'),
			(4,'Walmart','Folgers'),
			(4,'Walmart','DunkinDonuts'),
			(4,'Walmart','Starbucks'),
			(4,'Walmart','MaxwellHouse'),
			(4,'Walmart','DonutShop'),
			(4,'Walmart','Nestle'),
			(4,'Walmart','McCafe'),
			(4,'Walmart','TimHortons'),
			(5,'Amazon','Folgers'),
			(5,'Amazon','DunkinDonuts'),
			(5,'Amazon','Starbucks'),
			(5,'Amazon','MaxwellHouse'),
			(5,'Amazon','DonutShop'),
			(5,'Amazon','Nestle'),
			(5,'Amazon','McCafe'),
			(5,'Amazon','TimHortons')

;

DELETE FROM Storebrands
WHERE CoffeeBrandName = 'TimHortons';

/* deleted TimHortons from the stores as Canada is not shipping TimHortons to the states and therefore won't be selling any
coffee from any of the stores (I made this up by the way)*/

SELECT * FROM CoffeeBrands;
SELECT * FROM Costs;
SELECT * FROM SalesPerson;
SELECT * FROM CoffeeRatings;
SELECT * FROM Stores;
SELECT * FROM StoreReps;
SELECT * FROM StoreBrands;--checked work on all tables--

SELECT Ounces, Cost, CostPerOunce,CoffeeBrandName
FROM Costs
ORDER BY CostPerOunce ASC;   --ordered in costperounce order, to show unit cost, least to greatest, to show certain coffees are cheaper than others 

SELECT StoreName, CoffeeBrandName
FROM StoreBrands
ORDER BY CoffeeBrandName DESC; --ordered by coffeebrandname order, descending, to show what coffees are in what stores, who has most presence--

SELECT TOP 10 Ounces
FROM Costs
ORDER BY Ounces DESC;

SELECT FirstName, LastName, StoreName
FROM StoreReps
WHERE StoreName IN ('Meijer');

SELECT Score
FROM CoffeeRatings
WHERE Score BETWEEN 0 AND 5;  --doing this by the lowest score as this coffee might want to be dropped--

ALTER TABLE Costs
	ADD Coupons	DEC NULL;

SELECT SUM(NumberofSurveys)
FROM Stores;					--total number of surveys between all stores--

SELECT COUNT(NumberofSurveys)	--total number of columns with values where the SUM is the total of all the values added in the columns--
FROM Stores;

SELECT CoffeeBrandName
FROM Costs INNER JOIN StoreReps
ON Costs.ID = StoreReps.ID;

SELECT CoffeeBrandName
FROM Costs LEFT JOIN StoreReps
ON Costs.ID = StoreReps.ID;

SELECT CoffeeBrandName
FROM Costs RIGHT JOIN StoreReps
ON Costs.ID = StoreReps.ID;

SELECT * FROM CoffeeBrands;
SELECT * FROM Costs;
SELECT * FROM SalesPerson;
SELECT * FROM CoffeeRatings;
SELECT * FROM Stores;
SELECT * FROM StoreReps;
SELECT * FROM StoreBrands;

SELECT AVG(Cost)
FROM Costs;				/*this would be good to know what the average cost is of product on the self and how much store money is invested into the average bag of coffee. Also
						to know if to bring in new coffee that is maybe more expensive than the others and if it would raise the average prices*/


DROP TABLE StoreBrands;

CREATE TABLE StoreBrands (

ID				SMALLINT	NOT NULL REFERENCES CoffeeBrands(ID),
StoreName		VARCHAR(20)	NOT NULL,
CoffeeBrandName	VARCHAR(20) NOT NULL

);

INSERT INTO StoreBrands (ID, StoreName, CoffeeBrandName)
	VALUES	(1,'Meijer', 'Folgers'),
			(1,'Meijer', 'DunkinDonuts'),
			(1,'Meijer', 'Starbucks'),
			(1,'Meijer','MaxwellHouse'),
			(1,'Meijer','DonutShop'),
			(1,'Meijer','Nestle'),
			(1,'Meijer','McCafe'),
			(2,'Aldi','Folgers'),
			(2,'Aldi','MaxwellHouse'),
			(2,'Aldi','TimHortons'),
			(3,'Kroger','Folgers'),
			(3,'Kroger','DunkinDonuts'),
			(3,'Kroger','Starbucks'),
			(3,'Kroger','MaxwellHouse'),
			(3,'Kroger','DonutShop'),
			(3,'Kroger','Nestle'),
			(3,'Kroger','McCafe'),
			(3,'Kroger','TimHortons'),
			(3,'Kroger','KrogerSelect'),
			(4,'Walmart','Folgers'),
			(4,'Walmart','DunkinDonuts'),
			(4,'Walmart','Starbucks'),
			(4,'Walmart','MaxwellHouse'),
			(4,'Walmart','DonutShop'),
			(4,'Walmart','Nestle'),
			(4,'Walmart','McCafe'),
			(4,'Walmart','TimHortons'),
			(5,'Amazon','Folgers'),
			(5,'Amazon','DunkinDonuts'),
			(5,'Amazon','Starbucks'),
			(5,'Amazon','MaxwellHouse'),
			(5,'Amazon','DonutShop'),
			(5,'Amazon','Nestle'),
			(5,'Amazon','McCafe'),
			(5,'Amazon','TimHortons')

;

SELECT * FROM CoffeeBrands;
SELECT * FROM Costs;
SELECT * FROM SalesPerson;
SELECT * FROM CoffeeRatings;
SELECT * FROM Stores;
SELECT * FROM StoreReps;
SELECT * FROM StoreBrands;