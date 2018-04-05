tests
testRepositoryHasOutgoingCommitsAfterFetch

	repository fetch.
	repository branch setUpstreamRemote: remote.
	self assert: repository hasOutgoingCommits