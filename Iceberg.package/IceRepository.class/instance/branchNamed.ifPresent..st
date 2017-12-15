branches
branchNamed: aString ifPresent: aBlockClosure 
	
	^ self
		branchNamed: aString
		ifPresent: aBlockClosure
		ifAbsent: [ self ]