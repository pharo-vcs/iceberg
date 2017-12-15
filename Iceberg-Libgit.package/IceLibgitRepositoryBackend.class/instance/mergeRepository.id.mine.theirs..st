private merging
mergeRepository: repo id: commitId mine: myCommit theirs: theirCommit
	| mergedIndex |
	
	mergedIndex := myCommit merge: theirCommit.
	mergedIndex hasConflicts
		ifTrue: [ 
			"Abort merge and signal for manual merge. 
			 Index is not saved and repository will be discarded, 
			 so no further action is needed to abort the merge" 
			IceMergeAborted signal ].

	"Commit mergedIndex"
	self 
		commitRepository: repo 
		mergedIndex: mergedIndex 
		message: commitId 
		mine: myCommit 
		theirs: theirCommit