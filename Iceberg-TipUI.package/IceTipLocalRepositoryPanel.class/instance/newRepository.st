accessing
newRepository
	^ IceRepositoryCreator new 
		location: self location;
		subdirectory: self subdirectory;
		createRepository