as yet unclassified
mergeIntoImage: aCommitInfo
	(aCommitInfo changedPackagesTo: self loadedCode referenceCommit)
		collect: [ :package | aCommitInfo versionFor: package ]
		thenDo: [:version | version merge ].
	self loadedCode refreshTo: aCommitInfo