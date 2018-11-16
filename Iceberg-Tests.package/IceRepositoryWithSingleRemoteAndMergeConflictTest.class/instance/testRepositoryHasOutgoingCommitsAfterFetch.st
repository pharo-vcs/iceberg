tests
testRepositoryHasOutgoingCommitsAfterFetch

	self repository fetch.
	self repository branch setUpstreamRemote: self remote.
	self assert: self repository hasOutgoingCommits