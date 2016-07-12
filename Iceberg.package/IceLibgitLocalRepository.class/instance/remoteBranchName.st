querying
remoteBranchName
	self withRepoDo: [ :repo | ^ repo head upstream ifNotNil: #basename ]