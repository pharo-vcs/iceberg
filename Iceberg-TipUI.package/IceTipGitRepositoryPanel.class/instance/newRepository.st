accessing
newRepository
	UIManager default 
		informUser: ('Cloning repository {1}' format: { self remoteUrl })
		during: [ 
			^ IceRepositoryCreator new 
				repository: repository;
				remote: (IceGitRemote url: self remoteUrl);
				location: self projectLocation location;
				createRepository ]