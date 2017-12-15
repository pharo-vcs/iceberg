querying
localBranches
	^ self backend localBranchNames collect: [ :branchName | 
		IceOldLocalBranch named: branchName inRepository: self ]