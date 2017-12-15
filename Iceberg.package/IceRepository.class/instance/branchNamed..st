branches
branchNamed: aName
		
	^ self
		branchNamed: aName
		ifPresent: [ :branch | ^ branch ]
		ifAbsent:[ IceBranchNotFound new
			branchName: aName;
			signal ]