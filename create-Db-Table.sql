/*
USE MASTER,
GO
CREATE DATABASE myDB;
GO

use master ;
go
DRIP DATABASE IF EXISTS BcDb;
go
create database BcDb;
go
use BcDb;
go
CREATE TABLE Customers(
	ID int Primary Key identity(1,1),
	Code varchar(10) not null unique,
	Name varchar(30) not null,
	Sales decimal(9,2) not null default 0 
		check(Sales >= 0),
	Active bit not null default 1,
	Created datetime not null default getdate());
go
*/
go
INSERT Customers
	(code, name) 
	values
	('MAX', 'Steve')
	('PG', 'P&G')
go

select * from customers