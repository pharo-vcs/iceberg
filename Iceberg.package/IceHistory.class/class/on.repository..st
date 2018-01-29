instance-creation
on: commitish repository: anIceRepository
	
	^ self new
		commitish: commitish;
		repository: anIceRepository;
		yourself