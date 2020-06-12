create or alter procedure SelectStudentWithoutSATorGPA
as
begin
	select s.id, concat(firstname, ' ', lastname) as 'Name', s.statecode as 'State', isnull(description, 'undeclared') as 'Major'
	from student s
	left join major m
		on m.id = s.majorid
	order by Lastname
end
go
exec SelectStudentWithoutSATorGPA

--procedure gives user stdent table sans sat and gpa.

