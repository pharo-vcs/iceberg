accessing
allBranchModels
	^ self entity allBranches 
		collect: [ :each | 
			(IceTipBranchModel 
				repositoryModel: self 
				on: each) 
				beCached ]