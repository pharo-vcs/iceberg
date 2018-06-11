accessing
commitModels
	^ commitModels ifNil: [ 
		commitModels := self retrieveHistory collect: [ :each | 
			(IceTipVersionModel 
				repositoryModel: self repositoryModel 
				on: each) 
				beCached ] ]