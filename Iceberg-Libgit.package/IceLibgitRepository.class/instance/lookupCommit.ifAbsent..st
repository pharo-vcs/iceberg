API-commits
lookupCommit: commitId ifAbsent: aBlock
	^ [ self revparse: commitId ]
		on: NotFound
		do: aBlock