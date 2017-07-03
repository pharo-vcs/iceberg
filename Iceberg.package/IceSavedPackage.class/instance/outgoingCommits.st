querying
outgoingCommits
	^ self repository branch outgoingCommits: [ :walk | walk modifyingPackage: self ]
