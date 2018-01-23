merging
mergeWithSingleVersionWorkingCopyState: anIceSingleVersionWorkingCopyState 
	
	(package currentCommits first = anIceSingleVersionWorkingCopyState referenceCommit)
		ifTrue: [ 
			^ IceInMergeWorkingCopyState 
				on: package currentCommits 
				repository: package repository ].
		
	IceError signal: 'Iceberg does not support a package in merge with different commits than the rest of the repository packages.'