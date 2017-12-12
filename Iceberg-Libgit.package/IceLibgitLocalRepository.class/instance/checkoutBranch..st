actions
checkoutBranch: newBranchName 
	self withRepoDo: [ :repo |
		[ repo checkout: newBranchName ]
		on: LGit_GIT_ECONFLICT do: [ :e | e acceptError: IceLibgitErrorVisitor new ] ]