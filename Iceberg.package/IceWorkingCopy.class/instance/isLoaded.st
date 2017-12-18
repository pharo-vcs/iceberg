testing
isLoaded
	
	self assert: referenceCommits size = 1.
	^ referenceCommits first isNoCommit not