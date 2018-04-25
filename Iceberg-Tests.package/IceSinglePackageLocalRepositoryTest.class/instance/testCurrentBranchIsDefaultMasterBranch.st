tests-queries
testCurrentBranchIsDefaultMasterBranch

	self assert: self repository branch name equals: 'master'