merging
mergeWithUnknownVersionWorkingCopyState: anIceUnknownCommitWorkingCopyState 
	
	^ IceUnknownCommitWorkingCopyState
		on: (anIceUnknownCommitWorkingCopyState referenceCommits copyWith: package currentCommit) asSet asArray
		repository: package repository