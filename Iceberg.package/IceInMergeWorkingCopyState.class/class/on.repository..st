instance creation
on: mergeCommits repository: aRepository
	
	^ self new
		mergeCommits: mergeCommits;
		repository: aRepository;
		yourself