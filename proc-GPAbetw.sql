create or alter procedure ListStudentsByGPA
	@GPA float = null
	--skip error check
as
begin
	declare @GPAHIGH float = @GPA + 0.3;
	declare @GPALOW float = @GPA - 0.4;

	select *
		from student
		where gpa between @GPALOW and @GPAHIGH
		order by GPA
end
go
exec ListStudentsByGPA @GPA = 3.0
go