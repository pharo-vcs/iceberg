accessing
branchModelFor: aBranch
	^ (IceTipBranchModel 
		repositoryModel: self 
		on: aBranch)
		beCached