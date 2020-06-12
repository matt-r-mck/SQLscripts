declare @TOTAL int = 0;
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

-- even excite function


if 1+5=0 begin
	print 'Hello World'
	print 'The End' --executed if true
end 
else begin
	print 'nope'--executed if false
end
