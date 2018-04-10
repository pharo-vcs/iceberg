API-branches
ensureBranch: branchName
	(self hasLocalBranchNamed: branchName)
		ifFalse: [ self createBranch: branchName ]
