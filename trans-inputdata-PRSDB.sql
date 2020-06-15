begin transaction
INSERT Users
	(UserName, Password, FirstName, LastName, Phone, Email, IsReviewer, IsAdmin)
	VALUES
	('SteRob', 'Password1', 'Steven', 'Roberts', '5135551234', 'SteRob@gmail.com', 0, 0),
	('JamLaw', 'Password2', 'James', 'Lawson', '5135551235', 'JamLaw@gmail.com', 1, 0),
	('FraNew', 'Password3', 'Frank', 'Newbery', '5155551236', 'FraNew@gmail.com', 1, 1)
if @@error!= 0
	rollback transaction
else
	commit transaction

--adds 3 users

begin transaction
INSERT Vendors
	(Code, Name, Address, City, State, Zip, Phone, Email)
	VALUES
	('TAR', 'Target', '1000 Nicollet Mall', 'Minneapolis', 'MN', '55403', '6123046073', 'target@target.com'),
	('MIC', 'Microsoft', '8800 Lyra Dr', 'Colombus', 'OH', '43240', '6147195900', 'microsoft@microsoft.com'),
	('AMA', 'Amazon', '410 Terry Ave N', 'Seattle', 'WA', '98109', '2062661000', 'amazon@amazon.com')
if @@error!= 0
	rollback transaction
else
	commit transaction

--creates 3 vendors

begin transaction
DECLARE @TAR int = (SELECT id from Vendors where code = 'TAR');
INSERT Products
	(PartNbr, Name, Price, Unit, PhotoPath, VendorsID)
	VALUES
	('TABLE01', 'Table', 135.95, 'Each', null, @TAR),
	('CHAIR01', 'Chair', 28.50, 'Each', null, @TAR),
	('DESK01', 'Desk', 165.95, 'Each', null, @TAR),
go
DECLARE @MIC int = (SELECT id from Vendors where code = 'MIC');
INSERT Products
	(PartNbr, Name, Price, Unit, PhotoPath, VendorsID)
	VALUES
	('LAP01', 'Laptop 01', 799.99, 'Each', null, @MIC),
	('DES01', 'Desktop 01', 1299.99, 'Each', null, @MIC),
	('EXD01', 'External Drive 01', 59.99, 'Each', null, @MIC),
go
DECLARE @AMA int = (SELECT id from Vendors where code = 'AMA');
INSERT Products
	(PartNbr, Name, Price, Unit, PhotoPath, VendorsID)
	VALUES
	('HDMI', 'HDMI Cables Pack of 5', 15.99, 'Per 5', null, @AMA),
	('LPS01', 'Laptop 01 Power Supply', 24.95, 'Each', null, @AMA),
	('DPS01', 'Desktop 01 Power Supply', 26.95, 'Each', null, @AMA)

if @@error!= 0
	rollback transaction
else
	commit transaction

--creates 9 products

begin transaction
DECLARE @USER int = (select ID from Users where UserName = 'franew')
INSERT requests
	(Description, Justification, DeliveryMode, UsersID)
	VALUES
	('1st Request', 'None Needed', 'Pickup', @USER)

if @@error!= 0
	rollback transaction
else
	commit transaction

--creates req from frank


DECLARE @REQID int = (Select id from Requests where description = '1st Request');
Insert RequestLines 
	(RequestsID, ProductsID, Quantity)
	values
	(@REQID, (select id from products where PartNbr = 'HDMI'), 1),
	(@REQID, (select id from products where PartNbr = 'LPS01'), 2),
	(@REQID, (select id from products where PartNbr = 'DPS01'), 3);

--specified parts frank needs


DECLARE @REQID int = (Select id from Requests where description = '1st Request');
update Requests set
	total = (select sum(p.price * rl.quantity)
				from products p
				join RequestLines rl on rl.RequestsID = @REQID)
			where id = @REQID
go
select * from Requests r
	join RequestLines rl on rl.RequestsID = r.ID
	join Products p on p.id = rl.ProductsID


	