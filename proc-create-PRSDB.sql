USE master;
GO
DROP database IF exists PRSDB;
GO
CREATE database PRSDB;
GO
USE PRSDB;
GO

--creates PRSDB

CREATE table Users(
	ID int Primary Key identity(1,1),
	UserName varchar(30) not null unique,
	Password varchar(30) not null,
	FirstName varchar(30) not null,
	LastName varchar(30) not null,
	Phone varchar(12) null,
	Email varchar(255) null,
	IsReviewer bit not null default 0,
	IsAdmin bit not null default 0,
	);
GO

--creates Users table

CREATE table Vendors(
	ID int Primary Key identity(1,1),
	Code varchar(30) not null unique,
	Name varchar(30) not null,
	Address varchar(30) not null,
	City varchar(30) not null,
	State varchar(2) not null,
	Zip varchar(5) not null,
	Phone varchar(12) null,
	Email varchar(255) null,
	);
go

--creates Vendors table

CREATE table Products(
	ID int Primary Key identity(1,1),
	PartNbr varchar(30) not null unique,
	Name varchar(30) not null,
	Price decimal(9,2) not null default 0,
	Unit varchar(30) not null default 'Each',
	PhotoPath varchar(255) null,
	VendorsID int not null
		Foreign Key references vendors(ID)
	);

--creates products table

CREATE table Requests(
	ID int primary key identity (1,1),
	Description varchar(80) not null,
	Justification varchar(30) not null,
	RejectionReason varchar(80) null,
	DeliveryMode varchar(20) not null,
	Status varchar(10) not null default 'NEW',
	Total decimal(11,2) not null default 0,
	UsersID int not null
		Foreign Key references Users(ID)
	);

-- creates vendors table

CREATE table RequestLines(
	ID int primary key identity (1,1),
	RequestsID int not null
		foreign key references Requests(ID),
	ProductsID int not null
		foreign key references Products(ID),
	Quantity int not null default 1,
	)