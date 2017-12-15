description
status

	(self repository workingCopy referenceCommit includes: self)
		ifTrue: [ 'Current' ].

	(self repository workingCopy referenceCommit
		anySatisfy: [ :each | each isNoCommit not and: [ self isAncestorOf: each ]])
			ifTrue: [ ^ 'Loaded' ].

	(self repository branch newCommitWalk includesCommit: self)
			ifTrue: [ ^ 'Not loaded' ].

	^ 'Not merged'