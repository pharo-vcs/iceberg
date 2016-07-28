actions
pull
	self withRepoDo: [ :repo | 
		| remote commit mergeBase |
		remote := (LGitRemote of: repo named: 'origin') lookup.
		remote fetch.

		commit := repo head upstream annotatedCommit. 
		mergeBase := repo mergeBaseBetween: repo head object id and: commit id.
		
		(mergeBase = repo head object id)
			ifTrue: [ repo fastForward ]
			ifFalse: [ repo merge: commit ]
	]