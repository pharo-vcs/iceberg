tests
testRepositoryHasNoMoreIncomingCommitsAfterPull

	repository pull.
	self deny: repository hasIncomingCommits