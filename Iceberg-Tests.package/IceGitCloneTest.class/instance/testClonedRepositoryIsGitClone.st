tests
testClonedRepositoryIsGitClone

	fixture ensureRemoteRepository.

	IceGitClone new
		location: fixture location;
		url: fixture factory defaultRemoteUrl;
		execute.
		
	self assert: (fixture location / '.git') exists