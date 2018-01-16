printing
status

	(self repository workingCopy referenceCommits includes: self)
		ifTrue: [ 'Current' ].

	(self repository workingCopy referenceCommits
		anySatisfy: [ :each | each isNoCommit not and: [ self isAncestorOf: each ]])
			ifTrue: [ ^ 'Loaded' ].

	(self repository branch newCommitWalk includesCommit: self)
			ifTrue: [ ^ 'Not loaded' ].

	^ 'Not merged'