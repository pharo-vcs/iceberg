merging
mergeWithInMergeWorkingCopyState: anIceInMergeWorkingCopyState 
	
	anIceInMergeWorkingCopyState referenceCommits = package currentCommits
		ifTrue: [ ^ anIceInMergeWorkingCopyState ].
		
	^ IceUnknownCommitWorkingCopyState
		on: anIceInMergeWorkingCopyState referenceCommits, package currentCommits
		repository: package repository