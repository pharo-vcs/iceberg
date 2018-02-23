accessing
newRepository
	^ IceRepositoryCreator new 
		remote: (IceGitRemote url: self remoteUrl);
		location: self projectLocation location;
		subdirectory: self subdirectoryInputText text asString trimmed;
		createRepository