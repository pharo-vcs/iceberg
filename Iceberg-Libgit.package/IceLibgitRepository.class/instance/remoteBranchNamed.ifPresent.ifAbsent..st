remote-branches
remoteBranchNamed: aString ifPresent: presentBlock ifAbsent: absentBlock 
	
	self withRepoDo: [ :repo | | branchRef |
		branchRef := repo lookupRemoteBranch: aString ifAbsent: [ ^ absentBlock value ].
		presentBlock value: (self basicNewRemoteBranchNamed: branchRef name) ]