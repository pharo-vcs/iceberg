instance creation
named: branchName local: isLocal inRepository: repo
	^ (isLocal ifTrue: IceOldLocalBranch ifFalse: IceRemoteBranch)
		named: branchName inRepository: repo.