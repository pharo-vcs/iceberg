merging
mergeCommit: aCommit
	
	| merger currentCommit newCommit changedPackages |

	currentCommit := self referenceCommit.
	
	(aCommit isAncestorOf: currentCommit)
		ifTrue: [
			"The commit is already merged"
			^ self ].
	
	"Optimize the diff by just comparing changed packages"
	changedPackages := self workingCopy changedPackagesTo: aCommit.
		
	"Compare working copy and commit packages"
	merger := MCThreeWayMerger
			base: (self workingCopy mcSnapshotOfPackages: changedPackages)
			target: (aCommit mcSnapshotOfPackages: aCommit packages)
			ancestor: ((currentCommit commonAncestorWith: aCommit)
				ifNil: [ MCSnapshot empty ]
				ifNotNil: [ :ancestor | ancestor mcSnapshotOfPackages: changedPackages ]).
	
	self executeMergeOfCommit: aCommit withMerger: merger.

	"If #executeMergeOfCommit:withMerger: returns without exception,
	we can assume all conflicts were resolved either manually or automatically."

	(currentCommit isAncestorOf: aCommit) ifTrue: [
		"We can fast-forward"
		"Update current branch target commit"
		self repository branch commit: aCommit.
		self workingCopy adoptCommit: aCommit.
		^ aCommit ].

	"Otherwise, we enter in a merge case and we should create a merge commit either manually or automatically"
	self workingCopy setMergeStateBetweenCommits: { currentCommit . aCommit }.
	newCommit := self workingCopy commitWithMessage: 'Merge ', aCommit id asString.
	self repository branch commit: newCommit.
	^ newCommit