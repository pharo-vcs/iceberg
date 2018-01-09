merging
mergeCommit: aCommit
	
	| merger currentCommit |

	currentCommit := self referenceCommit.
	
	(aCommit isAncestorOf: currentCommit)
		ifTrue: [
			"The commit is already merged"
			^ self ].
	
	"Otherwise, we have to do a merge"
	merger := MCThreeWayMerger
			base: self mcSnapshot
			target: aCommit mcSnapshot
			ancestor: ((currentCommit commonAncestorWith: aCommit)
				ifNil: [ MCSnapshot empty ]
				ifNotNil: [ :ancestor | ancestor mcSnapshot]).
	
	merger hasConflicts ifTrue: [ 
		"Abort merge and signal for manual merge. 
		Index is not saved and repository will be discarded, 
		so no further action is needed to abort the merge"
		IceMergeAborted signal
	].

	self loadChangesFromMCPatch: merger.
	self referenceCommit: aCommit.
	
	"Update current branch target commit"
	self repository branch commit: aCommit.
	^ aCommit