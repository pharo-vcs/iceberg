accessing
newRepository

	^ IceRepositoryCreator new 
		remote: (IceGitRemote url: self remoteUrl);
		location: self projectLocation location / self userName / self projectName;
		subdirectory: self subdirectoryInputText text asString trimmed;
		createRepository