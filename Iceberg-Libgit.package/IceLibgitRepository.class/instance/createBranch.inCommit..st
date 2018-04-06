actions
createBranch: aString inCommit: anIceGitCommit 

	self withRepoDo: [ :repo |
		repo 
			createBranch: aString 
			targetId: (LGitId fromHexString: anIceGitCommit gitRef)
			force: false.
		^ (self branchNamed: aString)
			switch;
			yourself
	]