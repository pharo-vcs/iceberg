tests
testFrom
	| info |
	info := IceMCGitRepository parseCommitInfo: 
		'|f659e2851cb84eb6812b19e5a820c06fb509b0d5|Nicolás Passerini|2016-05-27 09:20:49 +0200|ea6c151|Updated test method with version 2'.
	
	self assert: info commitId equals: 'f659e2851cb84eb6812b19e5a820c06fb509b0d5'.
	self assert: info username equals: 'Nicolás Passerini'.
	self assert: info datetime equals: 
		(DateAndTime year: 2016  month: 5 day: 27 hour: 9 minute:20 second:49 offset: 2 hours).
	self assert: info parentIds size equals: 1.
	self assert: info comment equals: 'Updated test method with version 2'.
