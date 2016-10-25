querying
currentBranch
	self withRepoDo: [ :repo |
		^ repo head basename
	]
