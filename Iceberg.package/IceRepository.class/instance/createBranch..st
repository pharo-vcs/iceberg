actions
createBranch: branchName
	self repository command: {'checkout'. '-b'. branchName}.
	self branch: branchName.
	self refresh.
