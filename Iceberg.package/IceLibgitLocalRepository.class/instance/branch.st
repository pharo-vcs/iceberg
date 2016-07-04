querying
branch
	self withRepoDo: [ :repo |
		^ repo head basename
	]
