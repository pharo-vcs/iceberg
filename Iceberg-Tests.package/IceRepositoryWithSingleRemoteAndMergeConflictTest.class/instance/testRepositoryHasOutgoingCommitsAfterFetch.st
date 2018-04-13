tests
testRepositoryHasOutgoingCommitsAfterFetch

	repository fetch.
	repository branch setUpstreamRemote: self remote.
	self assert: repository hasOutgoingCommits