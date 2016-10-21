actions
checkoutBranch: branchName
	self branchName: branchName.
	self repository checkoutBranch: branchName.
	self refresh.
