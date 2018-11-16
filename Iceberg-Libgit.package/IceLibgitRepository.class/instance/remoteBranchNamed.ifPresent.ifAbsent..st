API-remotes
remoteBranchNamed: aString ifPresent: presentBlock ifAbsent: absentBlock
	
	self handleLibgitError: [ | branchRef |
		branchRef := self repositoryHandle lookupRemoteBranch: aString ifAbsent: [ ^ absentBlock value ].
		presentBlock value: (self basicNewRemoteBranchNamed: branchRef name) ]