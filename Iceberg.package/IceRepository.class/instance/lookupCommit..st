private
lookupCommit: commitId

	^ self
		lookupCommit: commitId
		ifAbsent: [ IceUnknownCommit new id: commitId; yourself ]