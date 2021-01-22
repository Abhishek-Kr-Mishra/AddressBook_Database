--UC1 Create Address Book Database
create DATABASE AddressBookServiceDB
use AddressBookServiceDB

--UC2 Create Table of Address Book
CREATE Table AddressBookTable
(
BookID int IDENTITY(1,1) Primary Key,
FirstName varchar(20),
LastName varchar(30),
PersonAddress varchar(200),
City varchar(30),
PersonState varchar(50),
Zip int,
PhoneNumber BIGINT,
EmailID varchar(30)
)

--UC3 Insert New Contacts to Address Book
INSERT INTO AddressBookTable (FirstName,LastName,PersonAddress,City,PersonState,Zip,PhoneNumber,EmailID)
VALUES('Aditya','Mishra','Harpur Nai Basti','Ballia','Uttar Pradesh',277001,9452513121,'adi@gmail.com'),
	  ('Roshan','Prajapati','Kalidash Nagar','Ballia','Uttar Pradesh',277001,7398014051,'roshan@gmail.com'),
	  ('Random','Guy','Random Address','Random City','Random State',411038,7896325410,'random@gmail.com')

--UC4 Update person details using their name
UPDATE AddressBookTable
SET FirstName = 'Golu',
	LastName = 'Singh',
	City = 'Ballia',
	PersonState = 'Uttar Pradesh',
	EmailID = 'golu@gmail.com'
	where FirstName = 'Random';

--UC5 Delete an adsress using person's name
DELETE from AddressBookTable where FirstName = 'Manish'

--UC6 Ability to select person belonging to a city or state from address book 
SELECT FirstName,
		City,
		PersonState
From
	AddressBookTable;

--UC7 Ability to understand the size of address book by city or state
SELECT COUNT(city),Count(PersonState) from AddressBookTable;

--UC8 Ability to retrieve entries sorted alphabetically by Person’s name for a given city
SELECT * from AddressBookTable where City = 'Ballia' ORDER BY FirstName

--UC9 Add Column Type 
Alter Table AddressBookTable 
Add PersonType varchar(20)

--Update AddressBookTable set PersonType = 'Proffession' where FirstName = 'Abhishek'
--Update AddressBookTable set PersonType = 'Family' where FirstName = 'Aditya'
--Update AddressBookTable set PersonType = 'Friend' where FirstName = 'Roshan'
--Update AddressBookTable set PersonType = 'Proffession' where FirstName = 'Manish'

--UC10 Ability to get number of contact persons count by type
SELECT COUNT(PersonType) from AddressBookTable;

--UC11 Ability to add person to both Friend and Family
INSERT INTO AddressBookTable (FirstName,LastName,PersonAddress,City,PersonState,Zip,PhoneNumber,EmailID,PersonType)
VALUES('Aditya','Mishra','Harpur Nai Basti','Ballia','Uttar Pradesh',277001,9452513121,'adi@gmail.com','Friend')
