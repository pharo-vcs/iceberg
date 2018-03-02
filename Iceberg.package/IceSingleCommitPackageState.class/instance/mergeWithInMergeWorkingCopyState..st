merging
mergeWithInMergeWorkingCopyState: anIceInMergeWorkingCopyState
	
	(package currentCommit = anIceInMergeWorkingCopyState referenceCommits first)
		ifTrue: [ ^ anIceInMergeWorkingCopyState ].
		
	IceError signal: 'Iceberg does not support a package in merge with different commits than the rest of the repository packages.'