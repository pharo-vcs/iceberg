merging
mergeWithInMergeWorkingCopyState: anIceInMergeWorkingCopyState 

	(anIceInMergeWorkingCopyState referenceCommits includes: package currentCommit)
		ifTrue: [ ^ anIceInMergeWorkingCopyState ].
		
	IceError signal: 'Iceberg does not yet support merging of packages loaded from different commits'