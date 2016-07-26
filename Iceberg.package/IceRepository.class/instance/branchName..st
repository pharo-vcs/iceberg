accessing
branchName: branchName
	self branch: (IceBranch new 
		name: branchName;
		repository: self;
		yourself)
