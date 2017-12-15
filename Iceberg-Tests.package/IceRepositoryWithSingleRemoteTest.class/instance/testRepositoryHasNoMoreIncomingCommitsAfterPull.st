tests-push
testRepositoryHasNoMoreIncomingCommitsAfterPull

	repository pull.
	self deny: repository hasIncomingCommits