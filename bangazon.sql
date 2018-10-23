DELETE FROM Computer;
DELETE FROM ComputerEmployee;
DELETE FROM Employee;
DELETE FROM EmployeeTrainingRelation;
DELETE FROM Department;
DELETE FROM TrainingProgram;
DELETE FROM Customer;
DELETE FROM Payment;
DELETE FROM PaymentType;
DELETE FROM TheOrder;
DELETE FROM Product;
DELETE FROM ProductType;
DELETE FROM ProductOrder;

DROP TABLE Computer;
DROP TABLE ComputerEmployee;
DROP TABLE Employee;
DROP TABLE EmployeeTrainingRelation;
DROP TABLE Department;
DROP TABLE TrainingProgram;
DROP TABLE Customer;
DROP TABLE Payment;
DROP TABLE PaymentType;
DROP TABLE TheOrder;
DROP TABLE Product;
DROP TABLE ProductType;
DROP TABLE ProductOrder;

CREATE TABLE Employee (
Id INTEGER NOT NULL PRIMARY KEY autoincrement,
FirstName text NOT NULL,
LastName text NOT NULL,
DepartmentId integer NOT  NULL
)
;
drop table Employee;

CREATE TABLE Department(
Id INTEGER NOT NULL PRIMARY KEY autoincrement,
Name text NOT NULL,
budget INTEGER NOT NULL
);

CREATE TABLE Employee(
Id INTEGER NOT NULL PRIMARY KEY autoincrement,
FirstName text NOT NULL,
LastName text NOT NULL,
DepartmentId integer NOT  NULL,
IsSupervisor boolean NOT NULL,
 foreign key (DepartmentId) references Department(Id)
)
;

CREATE TABLE Computer (
Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
PurchaseDate DATETIME NOT NULL,
DecommissionDate DATETIME NOT NULL,
Operational BOOLEAN NOT NULL
)
;

CREATE TABLE ComputerEmployee (
Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
ComputerId INTEGER NOT NULL,
EmployeeId INTEGER NOT NULL,
FOREIGN KEY (ComputerId) references Computer(Id),
FOREIGN KEY (EmployeeId) references Employee(Id)
)
;

CREATE TABLE TrainingProgram (
Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
Name TEXT NOT NULL,
StartDate DATETIME NOT NULL,
EndDate DATETIME NOT NULL,
Capacity INTEGER NOT NULL
);

CREATE TABLE EmployeeTrainingRelation (
Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
EmployeeId INTEGER NOT NULL,
TrainingProgramId INTEGER NOT NULL,
FOREIGN KEY (EmployeeId) references Employee(Id),
FOREIGN KEY (TrainingProgramId) references TrainingProgram(Id)
);

------------------------------------------

CREATE TABLE Customer (
Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
FirstName text NOT NULL,
LastName text NOT NULL,
MemberSince DATETIME NOT NULL,
LastActice DATETIME NOT NULL
);

CREATE TABLE ProductType (
Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
Name text NOT NULL
);

CREATE TABLE Product (
Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
Price INTEGER NOT NULL,
Title text NOT NULL,
Description text NOT NULL,
Quantity INTEGER NOT NULL,
CreatorId INTEGER NOT NULL,
ProductTypeId INTEGER NOT NULL,
FOREIGN KEY (CreatorId) references Customer(Id),
FOREIGN KEY (ProductTypeId) references ProductType(Id)
);
CREATE TABLE PaymentType (
Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
Name text NOT NULL
);

CREATE TABLE Payment (
Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
AccountNumber INTEGER NOT NULL,
PaymentTypeId INTEGER NOT NULL,
CustomerId INTEGER NOT NULL,
FOREIGN KEY (PaymentTypeId) references PaymentType(Id),
FOREIGN KEY (CustomerId) references Customer(Id)
);

CREATE TABLE TheOrder (
Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
CustomerId INTEGER NOT NULL,
PaymentId INTEGER NOT NULL,
FOREIGN KEY (CustomerId) references Customer(Id),
FOREIGN KEY (PaymentId) references Payment(Id)
);

CREATE TABLE ProductOrder (
Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
ProductId INTEGER NOT NULL,
TheOrderId INTEGER NOT NULL,
FOREIGN  KEY (ProductId) references Product(Id),
FOREIGN KEY (TheOrderId) references TheOrder(Id)
);

/*
INSERT INTO Album
(Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES 
("Take Care, Take Care, Take Care", "2011", 4605, "Temporary Residence Limited", 33, 2)
;*/

;

INSERT INTO Department
(Name, budget)
VALUES 
("HR", 3000000)
;

INSERT INTO Department
(Name, budget)
VALUES 
("Sustainability", 2)
;

INSERT INTO Department
(Name, budget)
VALUES 
("IT", 40000)
;

INSERT INTO Employee
(FirstName, LastName, DepartmentId, IsSupervisor)
VALUES("Lauren", "Moon", 1, 1)
;

INSERT INTO Employee
(FirstName, LastName, DepartmentId, IsSupervisor)
VALUES("Helen", "Chalmers", 3, 0)
;

--YYYYMMDD hh:mm:ss[.mmm]
;
INSERT INTO Computer
(PurchaseDate, DecommissionDate, Operational)
VALUES
(199901030100000, 200311030100000, 0)
;

INSERT INTO ComputerEmployee
(ComputerId, EmployeeId)
VALUES
(1,2)
;

INSERT INTO TrainingProgram
(Name, StartDate, EndDate, Capacity)
VALUES 
("Safe Space", 20180921, 20180925, 30)
;

INSERT INTO TrainingProgram
(Name, StartDate, EndDate, Capacity)
VALUES 
("Sword swinging", 20180320, 20180325, 5)
;

INSERT INTO EmployeeTrainingRelation
(EmployeeId, TrainingProgramId)
values(2, 2)
;

INSERT INTO Customer
(FirstName, LastName, MemberSince, LastActice)
VALUES
("Dejan", "Stjepanovic", 20120131 ,20180802)
;

INSERT INTO PaymentType
(Name)
VALUES
("Visa")
;

INSERT INTO PaymentType
(Name)
VALUES
("MasterCard")
;

INSERT INTO PaymentType
(Name)
VALUES
("Checks")
;

INSERT INTO Payment
(AccountNumber, PaymentTypeId, CustomerId)
VALUES
(01830294, 3, 1)
;

INSERT INTO TheOrder
(CustomerId, PaymentId)
VALUES
(1, 1)
;

INSERT INTO ProductType
(Name)
VALUES
("Accessories")
;

INSERT INTO ProductType
(Name)
VALUES
("Toys")
;

INSERT INTO Product
(Price, Title, Description, Quantity, CreatorId, ProductTypeId)
VALUES
(12.99, "Headphones", "Play music in your ears", 2, 1,1)
;

INSERT INTO ProductOrder
(ProductId, TheOrderId)
VALUES
(1, 1)
;



-- remove CustomerId from either TheOrder or PaymentId
-- change LastActice to LastActive in Customers
-- change DecommissionDate away from not null because numbers have to be null for a while