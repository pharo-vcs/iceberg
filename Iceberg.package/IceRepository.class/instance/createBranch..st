actions
createBranch: branchName
	self backend createBranch: branchName.
	self branchName: branchName.
	self refresh.
