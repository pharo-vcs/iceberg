history
commitDictionary

	commitDictionary ifNil: [ self lookupCommits ].
	^ commitDictionary