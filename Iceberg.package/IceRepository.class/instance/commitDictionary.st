commits
commitDictionary
	^ commitDictionary ifNil: [ self loadCommits ].
