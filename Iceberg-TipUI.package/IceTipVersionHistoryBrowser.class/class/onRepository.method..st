instance creation
onRepository: aRepository method: aMethod
	
	^ self on: (IceTipVersionHistoryModel 
		repositoryModel: (IceTipRepositoryModel on: aRepository) beCached 
		on: aMethod)
		beCached