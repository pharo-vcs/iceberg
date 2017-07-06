actions
mergeIntoImage
	self repository 
		ensureBranch: self branchName;
		checkoutBranch: self branchName;
		merge: self branch lastCommit