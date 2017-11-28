actions
merge: commitId
	self withRepoDo: [ :repo | 
		| myCommit theirCommit mergeBase |
		"Decide if we can fast-forward or we must do a real merge"
		myCommit := repo head object.
		theirCommit := LGitCommit of: repo fromHexString: commitId.
		mergeBase := repo mergeBaseBetween: myCommit id and: theirCommit id.
		mergeBase = myCommit id
			ifTrue: [ 
				"No need to merge, just fast-forward current HEAD"
				self mergeRepositoryFastForward: repo theirs: theirCommit ]
			ifFalse: [ 
				self
					mergeRepository: repo
					id: commitId
					mine: myCommit
					theirs: theirCommit ] ]