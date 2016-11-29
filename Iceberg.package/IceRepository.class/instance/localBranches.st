querying
localBranches
	^ self backend localBranches collect: [ :branchName | 
		IceBranch named: branchName inRepository: self ]