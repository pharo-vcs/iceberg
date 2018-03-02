merging
mergeWithEmptyWorkingCopyState: anIceEmptyWorkingCopyState 
	
	^ IceSingleVersionWorkingCopyState
		on: package currentCommit
		repository: package repository