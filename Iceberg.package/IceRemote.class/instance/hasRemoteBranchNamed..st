testing
hasRemoteBranchNamed: aString 
	
	self
		remoteBranchNamed: aString
		ifPresent: [ :branch | ^ true ]
		ifAbsent: [ ^ false ]