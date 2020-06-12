declare curSTUDENT cursor for --scroll cursor#
	select Firstname, Lastname, gpa, sat from student
	order by Lastname; --cursor searches columns in table

open curSTUDENT;
	
declare @firstname varchar(30), @lastname varchar (30), @gpa float, @sat int;

fetch next from curSTUDENT		--allows for first, etc#
	into @firstname, @lastname, @gpa, @sat --scan first row

while @@fetch_status = 0 --while statement is true
begin
print concat(@lastname, ', ', @firstname, ', SAT is ', str(@sat));
	if @sat < 1000
		break;
	
	fetch next from curSTUDENT
		into @firstname, @lastname, @gpa, @sat; --scan consecutive rows
end
	
close curSTUDENT;

deallocate curSTUDENT;