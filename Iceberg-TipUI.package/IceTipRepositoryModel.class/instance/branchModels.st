accessing
branchModels
	^ self entity allBranches 
		collect: [ :each | (IceTipBranchModel for: each) beCached ]