API-history
lookupCommit: commitId

	^ self
		lookupCommit: commitId
		ifAbsent: [ IceUnknownCommit new 
				repository: self;
				id: commitId; yourself ]