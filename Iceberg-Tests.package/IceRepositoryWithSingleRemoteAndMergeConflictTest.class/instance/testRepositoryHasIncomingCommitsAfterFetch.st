tests
testRepositoryHasIncomingCommitsAfterFetch

	repository fetch.
	repository branch setUpstreamRemote: self remote.
	self assert: repository hasIncomingCommits