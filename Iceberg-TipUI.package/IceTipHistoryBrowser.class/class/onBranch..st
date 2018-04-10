instance creation
onBranch: aBranch
	^ self on: (IceTipBranchModel 
		repositoryModel: (IceTipRepositoryModel on: aBranch repository) beCached 
		on: aBranch)
		beCached