actions
pullFrom: aRemote
	self withRepoDo: [ :repo | 
		| gitRemote myCommit theirCommit mergeBase |

		"Fetch"
		gitRemote := (LGitRemote of: repo named: aRemote remoteName) lookup.
		gitRemote fetchWithCredentials: IceCredentialsProvider default.		

		"Decide if we can fast-forward or we must do a real merge"
		myCommit := repo head object.
		theirCommit := repo head upstream object.
		mergeBase := repo mergeBaseBetween: myCommit id and: theirCommit id.
		
		(mergeBase = myCommit id)
			ifTrue: [ self pullRepositoryFastForward: repo ]
			ifFalse: [ self pullRepository: repo merge: myCommit with: theirCommit ] ]