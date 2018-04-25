tests
testNewRepositoryBranchIsNamedMaster

	self assert: self repository branch name equals: 'master'