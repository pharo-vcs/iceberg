merging
mergeCommit: aCommit 
	
	| merger changedPackages |
	"Optimize the diff by just comparing changed packages"
	changedPackages := self workingCopy changedPackagesTo: aCommit.
	"Otherwise, we have to do a merge"
	merger := MCThreeWayMerger
			base: (self workingCopy mcSnapshotOfPackages: changedPackages)
			target: (aCommit mcSnapshotOfPackages: changedPackages)
			ancestor: MCSnapshot empty.
	
	self executeMergeOfCommit: aCommit withMerger: merger.
	self workingCopy adoptCommit: aCommit.
	^ aCommit