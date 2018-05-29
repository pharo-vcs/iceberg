instance creation
onRepository: aRepository method: aMethod
	
	^ self on: (IceTipVersionsModel 
		repositoryModel: (IceTipRepositoryModel on: aRepository) beCached 
		on: aMethod)
		beCached