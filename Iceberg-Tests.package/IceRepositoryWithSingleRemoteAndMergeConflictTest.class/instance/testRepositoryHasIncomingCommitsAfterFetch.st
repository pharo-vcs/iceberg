tests
testRepositoryHasIncomingCommitsAfterFetch

	self repository fetch.
	self repository branch setUpstreamRemote: self remote.
	self assert: self repository hasIncomingCommits