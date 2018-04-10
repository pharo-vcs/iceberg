accessing
packageModels
	^ self sortingStrategy sort: (self repositoryModel entity workingCopy packages 
		collect: [ :each | 
			(IceTipPackageModel 
				repositoryModel: self repositoryModel 
				on: each) 
				beCached ])