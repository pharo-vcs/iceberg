commits
commitDictionary
	^ commitDictionary ifNil: [ self loadAllCommits ]