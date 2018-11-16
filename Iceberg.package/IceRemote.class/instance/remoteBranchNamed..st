branches
remoteBranchNamed: aString 
	
	^ self
		remoteBranchNamed: aString
		ifPresent: [ :branch | ^ branch ]
		ifAbsent: [ IceBranchNotFound new
			branchName: aString;
			signal ]