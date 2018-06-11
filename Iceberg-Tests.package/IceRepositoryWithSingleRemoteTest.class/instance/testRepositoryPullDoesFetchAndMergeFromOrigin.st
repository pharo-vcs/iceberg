tests-pull
testRepositoryPullDoesFetchAndMergeFromOrigin

	self repository pull.
	self assert: self repository head commit equals: self remoteRepository head commit.