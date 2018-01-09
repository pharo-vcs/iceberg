merging
mergeWithEmptyWorkingCopyState: anIceEmptyWorkingCopyState 
	
	^ IceUnknownCommitWorkingCopyState
		on: { }
		repository: anIceEmptyWorkingCopyState repository