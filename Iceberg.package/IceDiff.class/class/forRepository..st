instance creation
forRepository: aRepository 
	^ self new 
		repository: aRepository;
		myVersion: IceCommitish image;
		theirVersion: (IceLoadedCode new repository: aRepository);
		yourself.