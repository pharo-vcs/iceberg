actions
checkoutBranch: branchName
	self branch: branchName.
	self repository checkoutBranch: branchName.
	self refresh.
