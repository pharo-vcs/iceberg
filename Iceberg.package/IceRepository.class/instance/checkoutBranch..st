actions
checkoutBranch: branchName
	backend 
		ifNil: [ self ensureLocalRepository: branchName ]
		ifNotNil: [ self backend checkoutBranch: branchName ]
