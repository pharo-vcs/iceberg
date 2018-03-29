private-changes
changesFromCommit: anIceCommit 

	^ anIceCommit packages, self packages
		collect: [ :package | IceMemoryChange on: package ]