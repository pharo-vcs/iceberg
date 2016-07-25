comparing
isAncestorOf: anotherCommitId
	^ self commit isAncestorOf: (self repository commitAt: anotherCommitId)
