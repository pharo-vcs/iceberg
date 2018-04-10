private-changes
changedPackagesToCommitInfo: aCommit
	
	| otherDependencies |
	otherDependencies := aCommit mcCommit dependencies.
	^ (mcCommit dependencies select: [ :each |
		| found |
		found := otherDependencies detect: [ :other | other name = each name ] ifNone: [ nil ].
		found isNil or: [ found id ~= each id ] ]) 
			collect: [ :each | each package ] as: Array