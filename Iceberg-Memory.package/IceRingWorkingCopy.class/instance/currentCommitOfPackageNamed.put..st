accessing-monticello
currentCommitOfPackageNamed: aString put: aCommit 
	
	^ loadedPackageVersions at: aString put: aCommit