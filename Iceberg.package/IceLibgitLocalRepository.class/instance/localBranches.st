querying
localBranches
	self withRepoDo: [ :repo | ^ repo branches collect: #basename]