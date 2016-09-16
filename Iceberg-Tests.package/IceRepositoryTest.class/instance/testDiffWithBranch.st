tests - changes
testDiffWithBranch
	|  diff change | 
	self scenarioTwoLoadedPackagesOneOutdated.
	repository commitWithMessage: 'For testing outgoing commits'.
	
	diff := repository headCommit diffWith: repository upstream.

	self assert: diff changes notEmpty.
	
	change := diff changes first.
	self assert: change targetClass equals: (Smalltalk at: #Test)