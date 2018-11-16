private-changes
changesFromCommit: anIceCommit 

	^ (anIceCommit changedPackagesToCommitInfo: self)
		collect: [ :package | IceMemoryChange on: package ]