querying
branchesForMerge: aCommit
	"Returns a list of local branches to which we could merge the received commit"
	^ self backend allBranches
		select: [:each | each isLocal and: [ (each includesCommit: aCommit) not ]].
