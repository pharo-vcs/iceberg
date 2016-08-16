commits
incommingCommits
	^ (SortedCollection sortBlock: [ :a :b | a datetime > b datetime ])
		addAll: self commitsNotLoaded;
		addAll: (self upstream
			ifNotNil: [ self upstream commitsNotIn: self branch]
			ifNil: [ #() ]);
		yourself.