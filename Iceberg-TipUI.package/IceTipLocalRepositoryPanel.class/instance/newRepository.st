accessing
newRepository
	^ IceRepositoryCreator new 
		location: self projectLocation location;
		subdirectory: self subdirectoryInputText text asString trimmed;
		createRepository