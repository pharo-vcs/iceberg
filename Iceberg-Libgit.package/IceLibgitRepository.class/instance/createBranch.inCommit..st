actions
createBranch: aString inCommit: anIceGitCommit 

	self withRepoDo: [ :repo |
		repo isUnborn ifTrue: [ ^ self createBranch: aString ].
		repo 
			createBranch: aString 
			targetId: (LGitId fromHexString: anIceGitCommit gitRef)
			force: false.
		^ (self branchNamed: aString)
			switch;
			yourself
	]