tests-push
testRepositoryHasNoMoreIncomingCommitsAfterPull

	self repository pull.
	self deny: self repository hasIncomingCommits