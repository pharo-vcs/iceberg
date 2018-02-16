accessing
addChange: aChildDiff
	
	changesDictionary at: aChildDiff name put: aChildDiff.
	aChildDiff parent: self