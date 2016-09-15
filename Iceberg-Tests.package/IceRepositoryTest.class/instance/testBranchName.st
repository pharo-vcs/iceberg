tests -branchs
testBranchName
	repository branchName: 'nuevoBranch'.
	self assert: repository branch name equals: 'nuevoBranch'.