private pulling
pullRepository: repo merge: myCommit with: theirCommit
	| mergedIndex |
			
	"Merge both commits"
	mergedIndex := myCommit merge: theirCommit.
	mergedIndex hasConflicts 
		ifTrue: [ IceMergeAborted signal ].
	
	"Commit index"
	self 
		commitRepository: repo 
		mergedIndex: mergedIndex 
		message: repo head upstream name 
		mine: myCommit 
		theirs: theirCommit