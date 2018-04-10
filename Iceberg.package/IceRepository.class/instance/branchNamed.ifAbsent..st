API-branches
branchNamed: aName ifAbsent: absentBlock
	"Access a branch by name.
	Returns the result of the second argument if absent."
	
	^ self
		branchNamed: aName
		ifPresent: [ :branch | branch ]
		ifAbsent: absentBlock