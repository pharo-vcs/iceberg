querying
allBranchNames
	self withRepoDo: [ :repo | ^ repo allBranches collect: #shortName ]