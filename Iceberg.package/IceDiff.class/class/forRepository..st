instance creation
forRepository: aRepository 
	^ self new 
		repository: aRepository;
		myVersion: IceCommitish image;
		theirVersion: (IceCurrentHead new repository: aRepository);
		yourself.