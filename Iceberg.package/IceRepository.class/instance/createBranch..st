actions
createBranch: branchName
	self backend createBranch: branchName.
	self branch: branchName.
	self refresh.
