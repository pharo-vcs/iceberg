merging
mergeCommit: aCommit
	
	| merger currentCommit hadConflicts isFastForward |

	currentCommit := self referenceCommit.
	
	(aCommit isAncestorOf: currentCommit)
		ifTrue: [
			"The commit is already merged"
			^ self ].
	
	"Otherwise, we have to do a merge"
	merger := MCThreeWayMerger
			base: self workingCopy mcSnapshot
			target: aCommit mcSnapshot
			ancestor: ((currentCommit commonAncestorWith: aCommit)
				ifNil: [ MCSnapshot empty ]
				ifNotNil: [ :ancestor | ancestor mcSnapshot]).
	
	hadConflicts := merger hasConflicts.
	self executeMergeOfCommit: aCommit withMerger: merger.
	
	isFastForward := hadConflicts and: [ currentCommit isAncestorOf: aCommit ].
	isFastForward ifTrue: [ 
			"Update current branch target commit"
			self repository branch commit: aCommit.
			self workingCopy adoptCommit: aCommit.
			^ aCommit ].


	"Otherwise, we enter in a merge case and we should create a merge commit either manually or automatically"
	self workingCopy setMergeStateBetweenCommits: { currentCommit . aCommit }.

	hadConflicts ifFalse: [ | newCommit |
		newCommit := self workingCopy commitWithMessage: 'Merge ', aCommit id asString.
		self repository branch commit: newCommit.
		^ newCommit
	].

	^ aCommit