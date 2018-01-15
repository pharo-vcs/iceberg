merging
mergeWithEmptyWorkingCopyState: anIceEmptyWorkingCopyState 
	
	^ IceNotFoundCommitWorkingCopyState
		on: package currentCommit
		repository: package repository