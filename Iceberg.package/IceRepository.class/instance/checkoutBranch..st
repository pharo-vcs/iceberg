actions
checkoutBranch: branchName

	(self
		branchNamed: branchName
		ifAbsent: [ self createBranchTracking: branchName  ]) checkout