querying
incomingCommitsFrom: aRemote
	^ (SortedCollection sortBlock: [ :a :b | a datetime > b datetime ])
		addAll: self commitsNotLoaded;
		addAll: (self branch incomingCommitsFrom: aRemote);
		yourself