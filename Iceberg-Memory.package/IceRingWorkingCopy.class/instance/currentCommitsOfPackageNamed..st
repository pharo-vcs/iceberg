accessing-monticello
currentCommitsOfPackageNamed: aString 
	
	| packageCommits |
	packageCommits := loadedPackageVersions at: aString ifAbsent: [ 
		^ { IceNoCommit repository: repository } ].
	^ packageCommits