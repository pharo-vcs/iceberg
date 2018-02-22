accessing
newRepository
	^ IceRepositoryCreator new 
		location: self projectLocation location;
		subdirectory: self subdirectoryInputText text asString trimmed;
		createNewRepositoryNamed: self projectNameInputText text trimmed