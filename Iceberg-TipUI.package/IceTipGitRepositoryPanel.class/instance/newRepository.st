accessing
newRepository
	UIManager default 
		informUser: ('Cloning repository {1}' format: { self remoteUrl })
		during: [ 
			^ IceRepositoryCreator new
				remote: (IceGitRemote url: self remoteUrl);
				repository: repository;
				location: self projectLocation location;
				subdirectory: self subdirectoryInputText text asString trimmed;
				createRepository ]