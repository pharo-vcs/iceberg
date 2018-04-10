API-branches
switchToCommitishNamed: aString
	
	^ (self commitishNamed: aString)
		switch;
		yourself