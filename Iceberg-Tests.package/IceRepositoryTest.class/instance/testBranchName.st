tests - branchs
testBranchName
	repository createBranch: 'nuevoBranch'.
	self assert: repository branch name equals: 'nuevoBranch'.