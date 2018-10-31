branches
branchModels
	^ self branches collect: [ :each | (IceTipBranchModel repositoryModel: self repositoryModel on: each) beCached ]