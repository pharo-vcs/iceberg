branches
remoteBranchNamed: aString ifPresent: presentBlock ifAbsent: absentBlock 
	
	localRepository withRepoDo: [ :repo | | branchRef |
		branchRef := repo lookupRemoteBranch: self name , '/', aString ifAbsent: [ ^ absentBlock value ].
		presentBlock value: (localRepository basicNewRemoteBranchNamed: branchRef name) ]