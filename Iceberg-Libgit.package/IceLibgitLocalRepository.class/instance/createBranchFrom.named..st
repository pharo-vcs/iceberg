actions
createBranchFrom: aCommitInfo named: branchName
	self withRepoDo: [ :repo | | newBranch |
		newBranch := repo 
			createBranch: branchName 
			targetId: (LGitId fromHexString: aCommitInfo commitId)
			force: false.
		repo setHead: newBranch ]