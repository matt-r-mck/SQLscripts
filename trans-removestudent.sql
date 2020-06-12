begin transaction

delete student
	where Lastname = 'foster';

commit transaction

rollback transaction

select *
	from student s
	join StudentClass sc
		on sc.StudentId = s.id;