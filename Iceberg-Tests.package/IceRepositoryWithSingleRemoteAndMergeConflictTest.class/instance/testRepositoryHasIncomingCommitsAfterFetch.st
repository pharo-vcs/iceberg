tests
testRepositoryHasIncomingCommitsAfterFetch

	repository fetch.
	self assert: repository hasIncomingCommits