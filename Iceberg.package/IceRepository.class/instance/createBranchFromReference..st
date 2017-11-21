actions
createBranchFromReference: branchName
	self backend 
		createBranchFrom: self loadedCode referenceCommit 
		named: branchName