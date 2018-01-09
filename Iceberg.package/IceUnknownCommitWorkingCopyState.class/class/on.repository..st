instance creation
on: aCollection repository: aRepository
	
	^ self new
		referenceCommits: aCollection;
		repository: aRepository;
		yourself