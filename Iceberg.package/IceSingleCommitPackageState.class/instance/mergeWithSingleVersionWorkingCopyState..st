merging
mergeWithSingleVersionWorkingCopyState: anIceSingleVersionWorkingCopyState
	
	| currentCommit |
	currentCommit := package currentCommit.
	anIceSingleVersionWorkingCopyState referenceCommit = currentCommit
		ifTrue: [ ^ anIceSingleVersionWorkingCopyState ].
		
	^ IceUnknownCommitWorkingCopyState
		on: { currentCommit . anIceSingleVersionWorkingCopyState referenceCommit }
		repository: package repository