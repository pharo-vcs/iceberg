instance creation
with: aCollection repository: aRepository

	^ self new
		commits: aCollection;
		repository: aRepository;
		yourself