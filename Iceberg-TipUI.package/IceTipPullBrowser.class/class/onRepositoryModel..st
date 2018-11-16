instance creation
onRepositoryModel: aModel
	^ self on: (IceTipPullModel 
		repositoryModel: aModel 
		on: aModel entity) 
		beCached