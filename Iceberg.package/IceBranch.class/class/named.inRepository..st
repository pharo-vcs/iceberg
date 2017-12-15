instance creation
named: branchName inRepository: repo
	self halt.
	^ self 
		named: branchName
		local: (self isRemoteBranchName: branchName) not
		inRepository: repo