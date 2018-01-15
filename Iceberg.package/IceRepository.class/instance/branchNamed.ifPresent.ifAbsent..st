API-branches
branchNamed: aName ifPresent: presentBlock ifAbsent: absentBlock
	"Access a branch by name.
	If present, evaluate the block used as second argument with the branch found.
	If absent, evaluate the absent block."
	
	self subclassResponsibility