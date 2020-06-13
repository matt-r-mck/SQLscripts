/*declare @TOTAL int = 0;
declare @NUMBER int = 1;
while @number <=10
begin
	if @NUMBER % 2 = 0
	begin
		--print concat('@NUMBER is ', str(@NUMBER));
		set @total = @TOTAL + @NUMBER;
	end
	set @NUMBER = @NUMBER + 1;
end
print concat('The Total is ', str(@TOTAL));

-- even excite function  */


declare @NUMBER int = 1;
declare @TOTAL int = 0;
declare @FACT int = 4;

While @NUMBER <= @FACT
begin
	set @TOTAL = @TOTAL + @NUMBER
	set @NUMBER = @NUMBER + 1
end
print concat(@FACT, '! = ', @TOTAL)

/*
if 1+5=0 begin
	print 'Hello World'
	print 'The End' --executed if true
end 
else begin
	print 'nope'--executed if false
end
*/