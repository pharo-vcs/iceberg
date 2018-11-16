API-branches
hasLocalBranchNamed: aString
	
	^ self branchNamed: aString
		ifPresent: [ :branch | true ]
		ifAbsent: [ false ]