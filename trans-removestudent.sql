begin transaction

delete student
	where Lastname = 'foster';
if @@error <> 0
	rollback transaction
else
	commit transaction

select *
	from student s
	join StudentClass sc
		on sc.StudentId = s.id;