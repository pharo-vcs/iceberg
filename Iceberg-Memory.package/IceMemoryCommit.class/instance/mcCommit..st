accessing
mcCommit: aMCVersion 
	self assert: (aMCVersion isKindOf: MCVersion).
	self assert: (aMCVersion dependencies allSatisfy: [ :each |
		  each isKindOf: MCVersionInfo ]).
	mcCommit := aMCVersion