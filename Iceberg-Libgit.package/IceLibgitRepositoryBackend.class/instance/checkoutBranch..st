actions
checkoutBranch: newBranchName 
	self withRepoDo: [ :repo |
		repo checkout: newBranchName ]