actions
checkoutBranch: branchName
	self branchName: branchName.
	self backend checkoutBranch: branchName.
	self loadedPackages do: [ :pkg | pkg loadLatest ]
