tests
testLocationExistsAfterClone

	fixture ensureRemoteRepository.

	IceGitClone new
		location: fixture location;
		url: fixture factory defaultRemoteUrl;
		clone.
		
	self assert: fixture location exists