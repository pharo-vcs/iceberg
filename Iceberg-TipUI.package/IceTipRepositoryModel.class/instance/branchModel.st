accessing
branchModel
	^ (IceTipBranchModel 
		repositoryModel: self 
		on: self entity branch)
		beCached