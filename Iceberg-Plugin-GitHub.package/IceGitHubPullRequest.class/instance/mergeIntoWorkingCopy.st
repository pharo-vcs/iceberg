actions
mergeIntoWorkingCopy
	self repository 
		ensureBranch: self branchName;
		checkoutBranch: self branchName.
	self branch merge