as yet unclassified
mergeWithInMergeWorkingCopyState: anIceInMergeWorkingCopyState 

	(anIceInMergeWorkingCopyState referenceCommits first = package currentCommit)
		ifTrue: [ ^ anIceInMergeWorkingCopyState ].
		
	IceError signal: 'Iceberg does not yet support merging of packages loaded from different commits'