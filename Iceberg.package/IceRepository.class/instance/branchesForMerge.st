querying
branchesForMerge
	"Returns a list of local branches to which we could merge our current branch commits"
	^ self backend allBranchNames 
		collect: [ :name | IceBranch named: name inRepository: self ]
		thenSelect: [:each | each isLocal and: [ each ~= self branch ]].
