instance creation
onRepositoryModel: aModel
	^ self on: (IceTipPushModel 
		repositoryModel: aModel 
		on: aModel entity) 
		beCached	