tests - create repository
testImportOutdatedLocalRepository
	self scenarioOutdatedLocalRepository.
	
	"Assert"
	self assert: repository branch name equals: 'forBecomeWriteable'.
	self assert: repository incomingCommits size equals: 1