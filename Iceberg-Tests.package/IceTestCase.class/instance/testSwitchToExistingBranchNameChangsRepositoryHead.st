tests-branch
testSwitchToExistingBranchNameChangsRepositoryHead

	| branchName newBranch masterBranch |
	branchName := 'new'.
	newBranch := repository createBranch: branchName.
	self assert: newBranch equals: repository head.
	
	masterBranch := repository switchToBranchNamed: 'master'.
	self assert: masterBranch equals: repository head.
	
	newBranch switch.
	self assert: newBranch equals: repository head.