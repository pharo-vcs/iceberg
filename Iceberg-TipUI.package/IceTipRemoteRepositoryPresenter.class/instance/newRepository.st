accessing
newRepository
	^ IceRepositoryCreator new 
		remote: (IceGitRemote url: self remoteUrl);
		subdirectory: self subdirectoryInputText text asString trimmed;
		createRepository