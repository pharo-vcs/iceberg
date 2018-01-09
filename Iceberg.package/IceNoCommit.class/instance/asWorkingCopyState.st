working copy
asWorkingCopyState
	
	^ IceSingleVersionWorkingCopyState
		on: repository head commit
		repository: repository