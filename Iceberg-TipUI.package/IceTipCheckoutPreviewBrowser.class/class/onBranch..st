instance creation
onBranch: aBranch
	^ self on: ((IceTipBranchModel for: aBranch)
		repositoryModel: (IceTipRepositoryModel for: aBranch repository) beCached;
		beCached)