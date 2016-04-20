actions
createBranch: branchName
	self gitCommand: {'checkout'. '-b'. branchName}.
	self branch: branchName