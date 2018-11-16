API-branches
branchNamed: aString ifPresent: aBlockClosure 
	"Access a branch by name.
	If present, evaluate the block used as second argument with the branch found.
	If absent, do nothing."
	
	^ self
		branchNamed: aString
		ifPresent: aBlockClosure
		ifAbsent: [ self ]