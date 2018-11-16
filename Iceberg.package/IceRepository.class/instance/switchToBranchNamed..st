API-branches
switchToBranchNamed: aString
	
	^ (self branchNamed: aString)
		switch;
		yourself