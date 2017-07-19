actions
load
	(self changedPackagesTo: self repository loadedCode referenceCommit)
		collect: [ :package | self versionFor: package ]
		thenDo: [:version | version load ]