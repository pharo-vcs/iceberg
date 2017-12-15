merging
mergeCommit: aCommit
	
	| merger currentCommit |
	
	self assert: referenceCommits size = 1.
	currentCommit := referenceCommits first.
	
	(aCommit isAncestorOf: currentCommit)
		ifTrue: [
			"The commit is already merged"
			^ self ].
	
	(currentCommit isAncestorOf: aCommit)
		ifTrue: [ 
			"Our commit is simply an ancestor.
			We can fast forward to that commit."
			repository branch setCommit: aCommit.
			^ self ].
	
	"Otherwise, we have to do a merge"
	
	merger := MCThreeWayMerger
			base: currentCommit mcSnapshot
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

	"Load changes into the image"
	merger load.
	referenceCommits add: aCommit.

	^ self commitWithMessage: ('Automatic Merge between {1} and {2}' format: {currentCommit id . aCommit id}).