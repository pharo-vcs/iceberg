querying
allPackages
	^ self repository directory entries select: [ :entry | 
		entry isDirectory and: [ repository canReadFileNamed: entry name ] ].