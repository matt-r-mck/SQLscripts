select concat(s.lastname, ', ', s.firstname) as 'Name', isnull(m.Description, 'Undecided') as 'Major' 
	from student s
	left join major m on m.id = s.majorid

	--returns lost of combined first,last name and displays undecided majors

	select concat(s.lastname, ', ', s.firstname) as 'Name', isnull(m.Description, 'undecided') as 'Major'
		from student s
			left join major m on m.id = s.majorid