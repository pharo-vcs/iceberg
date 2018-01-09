testing
isLoaded
	
	self halt.
	self assert: referenceCommits size = 1.
	^ referenceCommits first isNoCommit not