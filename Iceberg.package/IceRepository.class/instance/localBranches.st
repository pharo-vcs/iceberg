querying
localBranches
	^ self backend localBranchNames collect: [ :branchName | 
		IceBranch named: branchName inRepository: self ]