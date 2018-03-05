accessing
packageModels
	^ self sortingStrategy sort: (self repositoryModel entity packages 
		collect: [ :each | (IceTipPackageModel for: each) beCached ])