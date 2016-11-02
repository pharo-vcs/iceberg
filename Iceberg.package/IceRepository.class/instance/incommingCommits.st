commits
incommingCommits
	^ (SortedCollection sortBlock: [ :a :b | a datetime > b datetime ])
		addAll: self commitsNotLoaded;
		addAll: self currentBranch incommingCommits;
		yourself