accessing
newRepository
	^ IceRepositoryCreator new 
		remote: (IceGitRemote url: self remoteInputText text asString trimmed);
		subdirectory: self subdirectoryInputText text asString trimmed;
		createRepository