merging
mergeWithEmptyWorkingCopyState: anIceEmptyWorkingCopyState 
	
	^ IceUnknownCommitWorkingCopyState
		on: { }
		repository: self