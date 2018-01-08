tests
testRepositoryHasOutgoingCommitsAfterFetch

	repository fetch.
	self assert: repository hasOutgoingCommits