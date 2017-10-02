tests - changes
testDiffWithBranch
	|  diff change | 
	self scenarioOutgoingCommit.
	
	diff := repository headCommit diffTo: repository branch upstream.

	change := diff elements 
		detect: [ :pkg | pkg changes notEmpty ]
		ifFound: [ :pkg | pkg changes first ]
		ifNone: [ self fail ].
	
	self assert: change targetClass equals: (Smalltalk at: #Test)