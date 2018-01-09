intersection
intersectionCommitWithCommit: aCommit
	
	aCommit = self
		ifTrue: [ ^ self ].
	
	^ IceMultipleCommit with: { aCommit . self } repository: repository