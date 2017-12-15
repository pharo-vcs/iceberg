tests-push
testRepositoryPullDoesFetchAndMergeFromOrigin

	repository pull.
	self assert: repository head commit equals: remoteRepository head commit.