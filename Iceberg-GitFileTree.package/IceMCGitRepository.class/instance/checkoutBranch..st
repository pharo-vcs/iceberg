actions
checkoutBranch: branchName
	self command: {'checkout'. branchName}.
	self branch: branchName