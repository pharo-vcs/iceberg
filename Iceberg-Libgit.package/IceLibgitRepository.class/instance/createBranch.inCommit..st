actions
createBranch: aString inCommit: anIceGitCommit
	(self repositoryHandle isUnborn and: [ anIceGitCommit isNoCommit ])
		ifTrue: [ ^ self createBranch: aString ].
	self repositoryHandle createBranch: aString targetId: (LGitId fromHexString: anIceGitCommit gitRef) force: false.
	^ (self branchNamed: aString)
		switch;
		yourself