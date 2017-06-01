instance creation
named: branchName local: isLocal inRepository: repo
	self haltIf: [ branchName includes: Character space ].
	^ (isLocal ifTrue: IceLocalBranch ifFalse: IceRemoteBranch)
		named: branchName inRepository: repo.