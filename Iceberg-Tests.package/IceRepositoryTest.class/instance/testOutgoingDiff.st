tests - changes
testOutgoingDiff
	|  diff change | 
	self scenarioTwoLoadedPackagesOneOutdated.
	repository commitWithMessage: 'For testing outgoing commits'.
	
	diff := IceDiff
		from: repository headCommit
		to: repository upstream lastCommit.

	self assert: diff changes notEmpty.
	
	change := diff changes first.
	self assert: change targetClass equals: (Smalltalk at: #Test)