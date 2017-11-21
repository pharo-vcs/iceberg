actions
load: aCommitInfo
	(aCommitInfo changedPackagesTo: self loadedCode referenceCommit)
		collect: [ :package | aCommitInfo versionFor: package ]
		thenDo: [:version | version load ].
	self loadedCode refreshTo: aCommitInfo