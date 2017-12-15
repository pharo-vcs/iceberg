actions
createBranch: aString inCommit: anIceGitCommit 
	
	self withRepoDo: [ :repo | | newBranch |
		newBranch := repo 
			createBranch: aString 
			targetId: (LGitId fromHexString: anIceGitCommit gitRef)
			force: false.
		repo setHead: newBranch ]