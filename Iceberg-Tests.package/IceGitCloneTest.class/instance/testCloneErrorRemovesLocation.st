tests
testCloneErrorRemovesLocation

	fixture ensureRemoteRepository.

	self should: [IceGitClone new
		location: fixture location;
		url: 'bad url';
		execute] raise: IceGenericError.
		
	self deny: fixture location exists