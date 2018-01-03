actions
load: aCommitInfo
	(aCommitInfo changedPackagesTo: self workingCopy referenceCommit)
		collect: [ :package | aCommitInfo versionFor: package ]
		thenDo: [:version | version load ].
	self workingCopy refreshTo: aCommitInfo