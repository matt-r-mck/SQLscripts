--update student set
	--MajorId = (select id from major where code = 'math')
	--where MajorId = (select id from major where code = 'acct')
	--changes all acct majors to math

/*
insert student
	(Firstname, Lastname, StateCode, gpa, sat, MajorId)
	values
	('Noah', 'Phense', 'GA', 3.15, 1235, (select id from major where code = 'math')

update student set
	gpa = 3.51,
	majorid = (select id from major where code = 'acct')
	where firstname = 'noah' and lastname = 'phense'
				-or-
	where id = ident_current ('student')

delete from student
	where firstname = 'noah' and lastname = 'phense'
/*

--inserts student named noah etc into student
--changes his gpa to 3.51 and major to accounting
--deletes student