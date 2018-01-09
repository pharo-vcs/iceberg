accessing-monticello
currentCommitOfPackageNamed: aString 
	
	^ loadedPackageVersions at: aString ifAbsent: [ 
		IceNoCommit repository: repository ]