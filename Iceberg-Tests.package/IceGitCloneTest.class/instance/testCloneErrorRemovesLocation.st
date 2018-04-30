tests
testCloneErrorRemovesLocation

	fixture ensureRemoteRepository.

	self should: [IceGitClone new
		location: fixture location;
		url: 'bad url';
		execute] raise: LGit_GIT_ERROR.
		
	self deny: fixture location exists