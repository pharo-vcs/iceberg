accessing
branchModels
	^ self entity allBranches 
		collect: [ :each | 
			(IceTipBranchModel for: each) 
				repositoryModel: self;
				beCached ]