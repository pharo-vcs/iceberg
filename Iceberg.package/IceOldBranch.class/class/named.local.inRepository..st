instance creation
named: branchName local: isLocal inRepository: repo
	^ (isLocal ifTrue: IceOldLocalBranch ifFalse: IceOldRemoteBranch)
		named: branchName inRepository: repo.