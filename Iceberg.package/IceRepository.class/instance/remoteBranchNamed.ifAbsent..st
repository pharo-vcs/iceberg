API-branches
remoteBranchNamed: aName ifAbsent: absentBlock
	"Access a remote branch by name.
	Returns the result of the second argument if absent."
	
	^ self
		branchNamed: aName
		ifPresent: [ :branch | branch ]
		ifAbsent: absentBlock