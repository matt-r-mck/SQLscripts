create or alter procedure AddClass
	@CODE varchar(6) = null,
	@SUBJECT varchar(30) = null,
	@SECTION int = null
as
begin
	if exists (select 1 from class where code = @CODE) begin
		print 'Record Exists'
		return;
	end

	insert class
		(code, Subject, Section, InstructorId)
		values
		(@CODE, @SUBJECT, @SECTION, null);
	if @@rowcount != 1 begin
		print 'An error occurred with insert.'
	end
end
go
exec AddClass
	@CODE = 'GEO432',
	@SUBJECT = 'Geography',
	@SECTION = 432;
go
select * from class where code = 'geo432'
go