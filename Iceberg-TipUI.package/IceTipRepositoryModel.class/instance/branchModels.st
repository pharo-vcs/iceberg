accessing
branchModels
	^ self entity localBranches
		collect: [ :each | 
			(IceTipBranchModel 
				repositoryModel: self 
				on: each) 
				beCached ]