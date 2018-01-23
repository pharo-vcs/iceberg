merging
mergeCommit: aCommit
	
	| merger currentCommit newCommit |

	currentCommit := self referenceCommit.
	
	(aCommit isAncestorOf: currentCommit)
		ifTrue: [
			"The commit is already merged"
			^ self ].
		
	"Compare working copy and commit packages.
	Do not optimize the selection of packages in here with #changedPackagesTo:
	otherwise we may end up merging only to changed packages, which is not right"
	merger := MCThreeWayMerger
			base: (self workingCopy mcSnapshotOfPackages: self loadedPackages)
			target: (aCommit mcSnapshotOfPackages: aCommit packages)
			ancestor: ((currentCommit commonAncestorWith: aCommit)
				ifNil: [ MCSnapshot empty ]
				ifNotNil: [ :ancestor | (ancestor mcSnapshotOfPackages: ((Set withAll: self loadedPackages)
					addAll: aCommit packages;
					yourself) ) ]).
	
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