API-branches
remoteBranchNamed: aString ifPresent: presentBlock ifAbsent: absentBlock 
	"Access a remote branch by name.
	If present, evaluate the block used as second argument with the branch found.
	If absent, evaluate the absent block."
	
	self subclassResponsibility