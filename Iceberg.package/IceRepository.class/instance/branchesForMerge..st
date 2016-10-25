querying
branchesForMerge: aCommit
	"Returns a list of local branches to which we could merge the received commit"
	^ self backend allBranchNames 
		collect: [ :name | IceBranch named: name inRepository: self ]
		thenSelect: [:each | each isLocal and: [ (each includesCommit: aCommit) not ]].
