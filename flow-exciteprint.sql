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

-- even excite function  

create or alter procedure FACTORIAL
declare @NUMBER int = 1;
declare @TOTAL int = 0;
declare @FACT int = 4;

While @NUMBER <= @FACT
begin
	set @TOTAL = @TOTAL + @NUMBER
	set @NUMBER = @NUMBER + 1
end
print concat(@FACT, '! = ', @TOTAL)


if 1+5=0 begin
	print 'Hello World'
	print 'The End' --executed if true
end 
else begin
	print 'nope'--executed if false
end
*/

create or alter procedure FACTORIAL
	@NBR int = null
as
begin
	if @NBR is null begin
		print 'ERROR: A positive integer is required.';
		return;
	end
	if @NBR < 1 begin
		print 'ERROR: Parameter must be >= 1'
		return;
	end
	--assume we have a good parameter
	declare @FACT int = 1;
	declare @aNBR int = @NBR
	while @aNBR > 1 begin
		set @FACT = @FACT * @aNBR
		set @aNBR = @aNBR - 1
	end
	print 'The factorial of ' + trim(str(@NBR)) + ' is ' + trim(str(@fact));
	--select 
end
go
exec factorial @nbr = 6
go