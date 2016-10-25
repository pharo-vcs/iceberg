tests - changes
testDiffWithBranch
	|  diff change | 
	self scenarioOutgoingCommit.
	
	diff := repository headCommit diffWith: repository currentBranch upstream.

	self assert: diff changes notEmpty.
	
	change := diff changes first.
	self assert: change targetClass equals: (Smalltalk at: #Test)