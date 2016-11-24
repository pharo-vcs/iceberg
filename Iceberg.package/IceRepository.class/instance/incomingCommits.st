commits
incomingCommits
	^ (SortedCollection sortBlock: [ :a :b | a datetime > b datetime ])
		addAll: self commitsNotLoaded;
		addAll: self currentBranch incomingCommits;
		yourself