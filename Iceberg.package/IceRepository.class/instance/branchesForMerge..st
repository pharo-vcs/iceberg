deprecated
branchesForMerge: aCommit
	"Returns a list of local branches to which we could merge the received commit"

	^ self allBranches reject: [ :each | each includesCommit: aCommit ]