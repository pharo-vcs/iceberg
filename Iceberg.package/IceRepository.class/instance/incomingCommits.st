querying
incomingCommits
	^ (SortedCollection sortBlock: [ :a :b | a datetime > b datetime ])
		addAll: self commitsNotLoaded;
		addAll: (self currentBranch incomingCommitsFrom: self pullRemote);
		yourself