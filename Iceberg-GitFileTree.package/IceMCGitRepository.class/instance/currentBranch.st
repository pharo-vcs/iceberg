accessing
currentBranch
	| basicBranch |
	basicBranch := ((self command: 'branch') lines
		detect: [ :line | line beginsWith: '* ' ])
		withoutPrefix: '* '.
		
	(basicBranch beginsWith: '(') ifTrue: [ 
		"Git responds with a message between () when in detached HEAD state, 
		so there is no current branch. " 
		IceNoCurrentBranch signal ].
	
	^ basicBranch