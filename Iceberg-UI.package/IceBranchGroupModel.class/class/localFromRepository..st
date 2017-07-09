instance creation
localFromRepository: aRepository
	^ self
		repository: aRepository
		branches: #localBranches
		groupName:
			('Local' asText
				allBold;
				yourself)