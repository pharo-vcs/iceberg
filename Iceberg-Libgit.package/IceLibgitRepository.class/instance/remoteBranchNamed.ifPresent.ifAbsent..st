remote-branches
remoteBranchNamed: aString ifPresent: presentBlock ifAbsent: absentBlock
	| branchRef |
	branchRef := self repositoryHandle lookupRemoteBranch: aString ifAbsent: [ ^ absentBlock value ].
	presentBlock value: (self basicNewRemoteBranchNamed: branchRef name)