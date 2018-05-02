API-branches
createBranch: aString inCommit: anIceGitCommit

	self handleLibgitError: [
		(self repositoryHandle isUnborn and: [ anIceGitCommit isNoCommit ])
			ifTrue: [ ^ self createBranch: aString ].
		self repositoryHandle createBranch: aString targetId: (LGitId fromHexString: anIceGitCommit gitRef) force: false.
		^ (self branchNamed: aString)
			switch;
			yourself ]