querying
allCommits
	^ commits ifNil: [ commits := self loadAllCommits ]