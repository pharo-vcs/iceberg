accessing
actionColumn: column
	elements := elements sorted: [ :a :b |
		(a at: column id) < (b at: column id) ]
		