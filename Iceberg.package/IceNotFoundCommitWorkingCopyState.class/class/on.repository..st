instance-creation
on: aNotFoundCommit repository: aRepository
	
	^ self new
		commit: aNotFoundCommit;
		repository: aRepository;
		yourself