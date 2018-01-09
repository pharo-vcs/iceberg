merging
mergeWithSingleVersionWorkingCopyState: anIceSingleVersionWorkingCopyState
	
	anIceSingleVersionWorkingCopyState referenceCommit = package currentCommit
		ifTrue: [ ^ anIceSingleVersionWorkingCopyState ].
	
	^ IceUnknownCommitWorkingCopyState
		on: { anIceSingleVersionWorkingCopyState referenceCommit . package currentCommit }
		repository: package repository