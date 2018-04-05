tests
testRepositoryHasIncomingCommitsAfterFetch

	repository fetch.
	repository branch setUpstreamRemote: remote.
	self assert: repository hasIncomingCommits